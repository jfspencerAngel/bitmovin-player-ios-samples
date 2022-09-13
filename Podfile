platform :ios, '12.0'
use_frameworks!

source 'https://cdn.cocoapods.org'
source 'https://github.com/bitmovin/cocoapod-specs.git'

workspace 'BitmovinPlayerSamples'

def bitmovin_player
  pod 'BitmovinPlayer', '3.27.0'
end

def google_cast
  pod 'google-cast-sdk', '4.7.0'
end

target 'BasicPlayback' do
    project 'BasicPlayback/BasicPlayback.xcodeproj'
    bitmovin_player
end

target 'BasicPlaybackObjectiveC' do
    project 'BasicPlaybackObjectiveC/BasicPlaybackObjectiveC.xcodeproj'
    bitmovin_player
end

target 'BasicDRMPlayback' do
    project 'BasicDRMPlayback/BasicDRMPlayback.xcodeproj'
    bitmovin_player
end

target 'BasicCasting' do
    project 'BasicCasting/BasicCasting.xcodeproj'
    bitmovin_player
    google_cast
end

target 'BasicPictureInPicture' do
    project 'BasicPictureInPicture/BasicPictureInPicture.xcodeproj'
    bitmovin_player
end

target 'AdvancedCasting' do
    project 'AdvancedCasting/AdvancedCasting.xcodeproj'
    bitmovin_player
    google_cast
end

target 'BasicMetadataHandling' do
    project 'BasicMetadataHandling/BasicMetadataHandling.xcodeproj'
    bitmovin_player
end

target 'CustomHtmlUi' do
    project 'CustomHtmlUi/CustomHtmlUi.xcodeproj'
    bitmovin_player
end

target 'BasicAds' do
    project 'BasicAds/BasicAds.xcodeproj'
    bitmovin_player
    pod 'GoogleAds-IMA-iOS-SDK', '3.14.5'
end

target 'BasicPlaybackTV' do
    project 'BasicPlaybackTV/BasicPlaybackTV.xcodeproj'
    platform :tvos, '12.0'
    bitmovin_player
end

target 'SystemUI' do
    project 'SystemUI/SystemUI'
    bitmovin_player
end

target 'BasicPlaylist' do
    project 'BasicPlaylist/BasicPlaylist.xcodeproj'
    bitmovin_player
end

target 'BasicOfflinePlayback' do
    project 'BasicOfflinePlayback/BasicOfflinePlayback.xcodeproj'
    bitmovin_player
end

target 'BackgroundPlayback' do
    project 'BackgroundPlayback/BackgroundPlayback.xcodeproj'
    bitmovin_player
end

target 'BasicFullscreenHandling' do
    project 'BasicFullscreenHandling/BasicFullscreenHandling.xcodeproj'
    bitmovin_player
    pod 'SwiftLint'
end

target 'BasicPlaylistTV' do
    project 'BasicPlaylistTV/BasicPlaylistTV.xcodeproj'
    platform :tvos, '12.0'
    bitmovin_player
end

target 'NextUpTV' do
    project 'NextUpTV/NextUpTV.xcodeproj'
    platform :tvos, '12.0'
    bitmovin_player
end
