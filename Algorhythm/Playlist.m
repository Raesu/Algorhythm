//
//  Playlist.m
//  Algorhythm
//
//  Created by Ryan Summe on 5/30/15.
//  Copyright (c) 2015 Ryan Summe. All rights reserved.
//

#import "Playlist.h"
#import "MusicLibrary.h"

@implementation Playlist

- (instancetype)initWithIndex:(NSUInteger)index {
    self = [super init];
    if (self) {
        MusicLibrary *musicLibrary = [[MusicLibrary alloc]init];
        NSArray *library = musicLibrary.library;
        
        NSDictionary *playlistDictionary = library[index];
        _playlistTitle = [playlistDictionary objectForKey:kTitle];
        _playlistDescription = [playlistDictionary objectForKey:kDescription];
        
        NSString *iconName = [playlistDictionary objectForKey:kIcon];
        _playlistIcon = [UIImage imageNamed:iconName];
        
        NSString *iconLarge = [playlistDictionary objectForKey:kLargeIcon];
        _playlistIconLarge = [UIImage imageNamed:iconLarge];
        
        _playlistArtists = [NSArray arrayWithArray:[playlistDictionary objectForKey:kArtists]];
        _backgroundColor = [self rgbColorFromDictionary:[playlistDictionary objectForKey:kBackgroundColor]];
        
    }
    return self;
}

- (UIColor *)rgbColorFromDictionary:(NSDictionary *)colorDict {
    CGFloat red = [[colorDict objectForKey:@"red"] doubleValue];
    CGFloat green = [[colorDict objectForKey:@"green"] doubleValue];
    CGFloat blue = [[colorDict objectForKey:@"blue"] doubleValue];
    CGFloat alpha = [[colorDict objectForKey:@"alpha"] doubleValue];
    
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}

@end
