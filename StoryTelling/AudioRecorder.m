//
//  AudioRecorder.m
//  StoryTelling
//
//  Created by Aaswini on 23/05/13.
//  Copyright (c) 2013 Aaswini. All rights reserved.
//

#import "AudioRecorder.h"

@implementation AudioRecorder

- (id)init{
    NSString *soundFilePath = [[NSString alloc] initWithFormat:@"%@/%@", [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0], @"sound.caf"];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    NSDictionary *recordSettings = [NSDictionary
                                    dictionaryWithObjectsAndKeys:
                                    [NSNumber numberWithInt:AVAudioQualityMin],
                                    AVEncoderAudioQualityKey,
                                    [NSNumber numberWithInt:16],
                                    AVEncoderBitRateKey,
                                    [NSNumber numberWithInt: 2],
                                    AVNumberOfChannelsKey,
                                    [NSNumber numberWithFloat:44100.0],
                                    AVSampleRateKey,
                                    nil];
    
    NSError *error = nil;
    
    audioRecorder = [[AVAudioRecorder alloc]
                     initWithURL:soundFileURL
                     settings:recordSettings
                     error:&error];
    
    if (error)
    {
        NSLog(@"error: %@", [error localizedDescription]);
    } else {
        [audioRecorder prepareToRecord];
    }
    return self;
}

-(void) recordAudio
{
    if (!audioRecorder.recording)
    {
        [audioRecorder record];
    }
}
-(void) stop
{
    if (audioRecorder.recording)
    {
        [audioRecorder stop];
    }
}

@end
