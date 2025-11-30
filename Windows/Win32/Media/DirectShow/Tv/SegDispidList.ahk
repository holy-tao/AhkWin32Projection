#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class SegDispidList extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static dispidName => 0

    /**
     * @type {Integer (Int32)}
     */
    static dispidStatus => 1

    /**
     * @type {Integer (Int32)}
     */
    static dispidDevImageSourceWidth => 2

    /**
     * @type {Integer (Int32)}
     */
    static dispidDevImageSourceHeight => 3

    /**
     * @type {Integer (Int32)}
     */
    static dispidDevCountryCode => 4

    /**
     * @type {Integer (Int32)}
     */
    static dispidDevOverScan => 5

    /**
     * @type {Integer (Int32)}
     */
    static dispidSegment => 6

    /**
     * @type {Integer (Int32)}
     */
    static dispidDevVolume => 7

    /**
     * @type {Integer (Int32)}
     */
    static dispidDevBalance => 8

    /**
     * @type {Integer (Int32)}
     */
    static dispidDevPower => 9

    /**
     * @type {Integer (Int32)}
     */
    static dispidTuneChan => 10

    /**
     * @type {Integer (Int32)}
     */
    static dispidDevVideoSubchannel => 11

    /**
     * @type {Integer (Int32)}
     */
    static dispidDevAudioSubchannel => 12

    /**
     * @type {Integer (Int32)}
     */
    static dispidChannelAvailable => 13

    /**
     * @type {Integer (Int32)}
     */
    static dispidDevVideoFrequency => 14

    /**
     * @type {Integer (Int32)}
     */
    static dispidDevAudioFrequency => 15

    /**
     * @type {Integer (Int32)}
     */
    static dispidCount => 16

    /**
     * @type {Integer (Int32)}
     */
    static dispidDevFileName => 17

    /**
     * @type {Integer (Int32)}
     */
    static dispidVisible => 18

    /**
     * @type {Integer (Int32)}
     */
    static dispidOwner => 19

    /**
     * @type {Integer (Int32)}
     */
    static dispidMessageDrain => 20

    /**
     * @type {Integer (Int32)}
     */
    static dispidViewable => 21

    /**
     * @type {Integer (Int32)}
     */
    static dispidDevView => 22

    /**
     * @type {Integer (Int32)}
     */
    static dispidKSCat => 23

    /**
     * @type {Integer (Int32)}
     */
    static dispidCLSID => 24

    /**
     * @type {Integer (Int32)}
     */
    static dispid_KSCat => 25

    /**
     * @type {Integer (Int32)}
     */
    static dispid_CLSID => 26

    /**
     * @type {Integer (Int32)}
     */
    static dispidTune => 27

    /**
     * @type {Integer (Int32)}
     */
    static dispidTS => 28

    /**
     * @type {Integer (Int32)}
     */
    static dispidDevSAP => 29

    /**
     * @type {Integer (Int32)}
     */
    static dispidClip => 30

    /**
     * @type {Integer (Int32)}
     */
    static dispidRequestedClipRect => 31

    /**
     * @type {Integer (Int32)}
     */
    static dispidClippedSourceRect => 32

    /**
     * @type {Integer (Int32)}
     */
    static dispidAvailableSourceRect => 33

    /**
     * @type {Integer (Int32)}
     */
    static dispidMediaPosition => 34

    /**
     * @type {Integer (Int32)}
     */
    static dispidDevRun => 35

    /**
     * @type {Integer (Int32)}
     */
    static dispidDevPause => 36

    /**
     * @type {Integer (Int32)}
     */
    static dispidDevStop => 37

    /**
     * @type {Integer (Int32)}
     */
    static dispidCCEnable => 38

    /**
     * @type {Integer (Int32)}
     */
    static dispidDevStep => 39

    /**
     * @type {Integer (Int32)}
     */
    static dispidDevCanStep => 40

    /**
     * @type {Integer (Int32)}
     */
    static dispidSourceSize => 41

    /**
     * @type {Integer (Int32)}
     */
    static dispid_playtitle => 42

    /**
     * @type {Integer (Int32)}
     */
    static dispid_playchapterintitle => 43

    /**
     * @type {Integer (Int32)}
     */
    static dispid_playchapter => 44

    /**
     * @type {Integer (Int32)}
     */
    static dispid_playchaptersautostop => 45

    /**
     * @type {Integer (Int32)}
     */
    static dispid_playattime => 46

    /**
     * @type {Integer (Int32)}
     */
    static dispid_playattimeintitle => 47

    /**
     * @type {Integer (Int32)}
     */
    static dispid_playperiodintitleautostop => 48

    /**
     * @type {Integer (Int32)}
     */
    static dispid_replaychapter => 49

    /**
     * @type {Integer (Int32)}
     */
    static dispid_playprevchapter => 50

    /**
     * @type {Integer (Int32)}
     */
    static dispid_playnextchapter => 51

    /**
     * @type {Integer (Int32)}
     */
    static dispid_playforwards => 52

    /**
     * @type {Integer (Int32)}
     */
    static dispid_playbackwards => 53

    /**
     * @type {Integer (Int32)}
     */
    static dispid_stilloff => 54

    /**
     * @type {Integer (Int32)}
     */
    static dispid_audiolanguage => 55

    /**
     * @type {Integer (Int32)}
     */
    static dispid_showmenu => 56

    /**
     * @type {Integer (Int32)}
     */
    static dispid_resume => 57

    /**
     * @type {Integer (Int32)}
     */
    static dispid_returnfromsubmenu => 58

    /**
     * @type {Integer (Int32)}
     */
    static dispid_buttonsavailable => 59

    /**
     * @type {Integer (Int32)}
     */
    static dispid_currentbutton => 60

    /**
     * @type {Integer (Int32)}
     */
    static dispid_SelectAndActivateButton => 61

    /**
     * @type {Integer (Int32)}
     */
    static dispid_ActivateButton => 62

    /**
     * @type {Integer (Int32)}
     */
    static dispid_SelectRightButton => 63

    /**
     * @type {Integer (Int32)}
     */
    static dispid_SelectLeftButton => 64

    /**
     * @type {Integer (Int32)}
     */
    static dispid_SelectLowerButton => 65

    /**
     * @type {Integer (Int32)}
     */
    static dispid_SelectUpperButton => 66

    /**
     * @type {Integer (Int32)}
     */
    static dispid_ActivateAtPosition => 67

    /**
     * @type {Integer (Int32)}
     */
    static dispid_SelectAtPosition => 68

    /**
     * @type {Integer (Int32)}
     */
    static dispid_ButtonAtPosition => 69

    /**
     * @type {Integer (Int32)}
     */
    static dispid_NumberOfChapters => 70

    /**
     * @type {Integer (Int32)}
     */
    static dispid_TotalTitleTime => 71

    /**
     * @type {Integer (Int32)}
     */
    static dispid_TitlesAvailable => 72

    /**
     * @type {Integer (Int32)}
     */
    static dispid_VolumesAvailable => 73

    /**
     * @type {Integer (Int32)}
     */
    static dispid_CurrentVolume => 74

    /**
     * @type {Integer (Int32)}
     */
    static dispid_CurrentDiscSide => 75

    /**
     * @type {Integer (Int32)}
     */
    static dispid_CurrentDomain => 76

    /**
     * @type {Integer (Int32)}
     */
    static dispid_CurrentChapter => 77

    /**
     * @type {Integer (Int32)}
     */
    static dispid_CurrentTitle => 78

    /**
     * @type {Integer (Int32)}
     */
    static dispid_CurrentTime => 79

    /**
     * @type {Integer (Int32)}
     */
    static dispid_FramesPerSecond => 80

    /**
     * @type {Integer (Int32)}
     */
    static dispid_DVDTimeCode2bstr => 81

    /**
     * @type {Integer (Int32)}
     */
    static dispid_DVDDirectory => 82

    /**
     * @type {Integer (Int32)}
     */
    static dispid_IsSubpictureStreamEnabled => 83

    /**
     * @type {Integer (Int32)}
     */
    static dispid_IsAudioStreamEnabled => 84

    /**
     * @type {Integer (Int32)}
     */
    static dispid_CurrentSubpictureStream => 85

    /**
     * @type {Integer (Int32)}
     */
    static dispid_SubpictureLanguage => 86

    /**
     * @type {Integer (Int32)}
     */
    static dispid_CurrentAudioStream => 87

    /**
     * @type {Integer (Int32)}
     */
    static dispid_AudioStreamsAvailable => 88

    /**
     * @type {Integer (Int32)}
     */
    static dispid_AnglesAvailable => 89

    /**
     * @type {Integer (Int32)}
     */
    static dispid_CurrentAngle => 90

    /**
     * @type {Integer (Int32)}
     */
    static dispid_CCActive => 91

    /**
     * @type {Integer (Int32)}
     */
    static dispid_CurrentCCService => 92

    /**
     * @type {Integer (Int32)}
     */
    static dispid_SubpictureStreamsAvailable => 93

    /**
     * @type {Integer (Int32)}
     */
    static dispid_SubpictureOn => 94

    /**
     * @type {Integer (Int32)}
     */
    static dispid_DVDUniqueID => 95

    /**
     * @type {Integer (Int32)}
     */
    static dispid_EnableResetOnStop => 96

    /**
     * @type {Integer (Int32)}
     */
    static dispid_AcceptParentalLevelChange => 97

    /**
     * @type {Integer (Int32)}
     */
    static dispid_NotifyParentalLevelChange => 98

    /**
     * @type {Integer (Int32)}
     */
    static dispid_SelectParentalCountry => 99

    /**
     * @type {Integer (Int32)}
     */
    static dispid_SelectParentalLevel => 100

    /**
     * @type {Integer (Int32)}
     */
    static dispid_TitleParentalLevels => 101

    /**
     * @type {Integer (Int32)}
     */
    static dispid_PlayerParentalCountry => 102

    /**
     * @type {Integer (Int32)}
     */
    static dispid_PlayerParentalLevel => 103

    /**
     * @type {Integer (Int32)}
     */
    static dispid_Eject => 104

    /**
     * @type {Integer (Int32)}
     */
    static dispid_UOPValid => 105

    /**
     * @type {Integer (Int32)}
     */
    static dispid_SPRM => 106

    /**
     * @type {Integer (Int32)}
     */
    static dispid_GPRM => 107

    /**
     * @type {Integer (Int32)}
     */
    static dispid_DVDTextStringType => 108

    /**
     * @type {Integer (Int32)}
     */
    static dispid_DVDTextString => 109

    /**
     * @type {Integer (Int32)}
     */
    static dispid_DVDTextNumberOfStrings => 110

    /**
     * @type {Integer (Int32)}
     */
    static dispid_DVDTextNumberOfLanguages => 111

    /**
     * @type {Integer (Int32)}
     */
    static dispid_DVDTextLanguageLCID => 112

    /**
     * @type {Integer (Int32)}
     */
    static dispid_RegionChange => 113

    /**
     * @type {Integer (Int32)}
     */
    static dispid_DVDAdm => 114

    /**
     * @type {Integer (Int32)}
     */
    static dispid_DeleteBookmark => 115

    /**
     * @type {Integer (Int32)}
     */
    static dispid_RestoreBookmark => 116

    /**
     * @type {Integer (Int32)}
     */
    static dispid_SaveBookmark => 117

    /**
     * @type {Integer (Int32)}
     */
    static dispid_SelectDefaultAudioLanguage => 118

    /**
     * @type {Integer (Int32)}
     */
    static dispid_SelectDefaultSubpictureLanguage => 119

    /**
     * @type {Integer (Int32)}
     */
    static dispid_PreferredSubpictureStream => 120

    /**
     * @type {Integer (Int32)}
     */
    static dispid_DefaultMenuLanguage => 121

    /**
     * @type {Integer (Int32)}
     */
    static dispid_DefaultSubpictureLanguage => 122

    /**
     * @type {Integer (Int32)}
     */
    static dispid_DefaultAudioLanguage => 123

    /**
     * @type {Integer (Int32)}
     */
    static dispid_DefaultSubpictureLanguageExt => 124

    /**
     * @type {Integer (Int32)}
     */
    static dispid_DefaultAudioLanguageExt => 125

    /**
     * @type {Integer (Int32)}
     */
    static dispid_LanguageFromLCID => 126

    /**
     * @type {Integer (Int32)}
     */
    static dispid_KaraokeAudioPresentationMode => 127

    /**
     * @type {Integer (Int32)}
     */
    static dispid_KaraokeChannelContent => 128

    /**
     * @type {Integer (Int32)}
     */
    static dispid_KaraokeChannelAssignment => 129

    /**
     * @type {Integer (Int32)}
     */
    static dispid_RestorePreferredSettings => 130

    /**
     * @type {Integer (Int32)}
     */
    static dispid_ButtonRect => 131

    /**
     * @type {Integer (Int32)}
     */
    static dispid_DVDScreenInMouseCoordinates => 132

    /**
     * @type {Integer (Int32)}
     */
    static dispid_CustomCompositorClass => 133

    /**
     * @type {Integer (Int32)}
     */
    static dispidCustomCompositorClass => 134

    /**
     * @type {Integer (Int32)}
     */
    static dispid_CustomCompositor => 135

    /**
     * @type {Integer (Int32)}
     */
    static dispidMixerBitmap => 136

    /**
     * @type {Integer (Int32)}
     */
    static dispid_MixerBitmap => 137

    /**
     * @type {Integer (Int32)}
     */
    static dispidMixerBitmapOpacity => 138

    /**
     * @type {Integer (Int32)}
     */
    static dispidMixerBitmapRect => 139

    /**
     * @type {Integer (Int32)}
     */
    static dispidSetupMixerBitmap => 140

    /**
     * @type {Integer (Int32)}
     */
    static dispidUsingOverlay => 141

    /**
     * @type {Integer (Int32)}
     */
    static dispidDisplayChange => 142

    /**
     * @type {Integer (Int32)}
     */
    static dispidRePaint => 143

    /**
     * @type {Integer (Int32)}
     */
    static dispid_IsEqualDevice => 144

    /**
     * @type {Integer (Int32)}
     */
    static dispidrate => 145

    /**
     * @type {Integer (Int32)}
     */
    static dispidposition => 146

    /**
     * @type {Integer (Int32)}
     */
    static dispidpositionmode => 147

    /**
     * @type {Integer (Int32)}
     */
    static dispidlength => 148

    /**
     * @type {Integer (Int32)}
     */
    static dispidChangePassword => 149

    /**
     * @type {Integer (Int32)}
     */
    static dispidSaveParentalLevel => 150

    /**
     * @type {Integer (Int32)}
     */
    static dispidSaveParentalCountry => 151

    /**
     * @type {Integer (Int32)}
     */
    static dispidConfirmPassword => 152

    /**
     * @type {Integer (Int32)}
     */
    static dispidGetParentalLevel => 153

    /**
     * @type {Integer (Int32)}
     */
    static dispidGetParentalCountry => 154

    /**
     * @type {Integer (Int32)}
     */
    static dispidDefaultAudioLCID => 155

    /**
     * @type {Integer (Int32)}
     */
    static dispidDefaultSubpictureLCID => 156

    /**
     * @type {Integer (Int32)}
     */
    static dispidDefaultMenuLCID => 157

    /**
     * @type {Integer (Int32)}
     */
    static dispidBookmarkOnStop => 158

    /**
     * @type {Integer (Int32)}
     */
    static dispidMaxVidRect => 159

    /**
     * @type {Integer (Int32)}
     */
    static dispidMinVidRect => 160

    /**
     * @type {Integer (Int32)}
     */
    static dispidCapture => 161

    /**
     * @type {Integer (Int32)}
     */
    static dispid_DecimateInput => 162

    /**
     * @type {Integer (Int32)}
     */
    static dispidAlloctor => 163

    /**
     * @type {Integer (Int32)}
     */
    static dispid_Allocator => 164

    /**
     * @type {Integer (Int32)}
     */
    static dispidAllocPresentID => 165

    /**
     * @type {Integer (Int32)}
     */
    static dispidSetAllocator => 166

    /**
     * @type {Integer (Int32)}
     */
    static dispid_SetAllocator => 167

    /**
     * @type {Integer (Int32)}
     */
    static dispidStreamBufferSinkName => 168

    /**
     * @type {Integer (Int32)}
     */
    static dispidStreamBufferSourceName => 169

    /**
     * @type {Integer (Int32)}
     */
    static dispidStreamBufferContentRecording => 170

    /**
     * @type {Integer (Int32)}
     */
    static dispidStreamBufferReferenceRecording => 171

    /**
     * @type {Integer (Int32)}
     */
    static dispidstarttime => 172

    /**
     * @type {Integer (Int32)}
     */
    static dispidstoptime => 173

    /**
     * @type {Integer (Int32)}
     */
    static dispidrecordingstopped => 174

    /**
     * @type {Integer (Int32)}
     */
    static dispidrecordingstarted => 175

    /**
     * @type {Integer (Int32)}
     */
    static dispidNameSetLock => 176

    /**
     * @type {Integer (Int32)}
     */
    static dispidrecordingtype => 177

    /**
     * @type {Integer (Int32)}
     */
    static dispidstart => 178

    /**
     * @type {Integer (Int32)}
     */
    static dispidRecordingAttribute => 179

    /**
     * @type {Integer (Int32)}
     */
    static dispid_RecordingAttribute => 180

    /**
     * @type {Integer (Int32)}
     */
    static dispidSBEConfigure => 181

    /**
     * @type {Integer (Int32)}
     */
    static dispid_CurrentRatings => 182

    /**
     * @type {Integer (Int32)}
     */
    static dispid_MaxRatingsLevel => 183

    /**
     * @type {Integer (Int32)}
     */
    static dispid_audioencoderint => 184

    /**
     * @type {Integer (Int32)}
     */
    static dispid_videoencoderint => 185

    /**
     * @type {Integer (Int32)}
     */
    static dispidService => 186

    /**
     * @type {Integer (Int32)}
     */
    static dispid_BlockUnrated => 187

    /**
     * @type {Integer (Int32)}
     */
    static dispid_UnratedDelay => 188

    /**
     * @type {Integer (Int32)}
     */
    static dispid_SuppressEffects => 189

    /**
     * @type {Integer (Int32)}
     */
    static dispidsbesource => 190

    /**
     * @type {Integer (Int32)}
     */
    static dispidSetSinkFilter => 191

    /**
     * @type {Integer (Int32)}
     */
    static dispid_SinkStreams => 192

    /**
     * @type {Integer (Int32)}
     */
    static dispidTVFormats => 193

    /**
     * @type {Integer (Int32)}
     */
    static dispidModes => 194

    /**
     * @type {Integer (Int32)}
     */
    static dispidAuxInputs => 195

    /**
     * @type {Integer (Int32)}
     */
    static dispidTeleTextFilter => 196

    /**
     * @type {Integer (Int32)}
     */
    static dispid_channelchangeint => 197

    /**
     * @type {Integer (Int32)}
     */
    static dispidUnlockProfile => 198

    /**
     * @type {Integer (Int32)}
     */
    static dispid_AddFilter => 199

    /**
     * @type {Integer (Int32)}
     */
    static dispidSetMinSeek => 200

    /**
     * @type {Integer (Int32)}
     */
    static dispidRateEx => 201

    /**
     * @type {Integer (Int32)}
     */
    static dispidaudiocounter => 202

    /**
     * @type {Integer (Int32)}
     */
    static dispidvideocounter => 203

    /**
     * @type {Integer (Int32)}
     */
    static dispidcccounter => 204

    /**
     * @type {Integer (Int32)}
     */
    static dispidwstcounter => 205

    /**
     * @type {Integer (Int32)}
     */
    static dispid_audiocounter => 206

    /**
     * @type {Integer (Int32)}
     */
    static dispid_videocounter => 207

    /**
     * @type {Integer (Int32)}
     */
    static dispid_cccounter => 208

    /**
     * @type {Integer (Int32)}
     */
    static dispid_wstcounter => 209

    /**
     * @type {Integer (Int32)}
     */
    static dispidaudioanalysis => 210

    /**
     * @type {Integer (Int32)}
     */
    static dispidvideoanalysis => 211

    /**
     * @type {Integer (Int32)}
     */
    static dispiddataanalysis => 212

    /**
     * @type {Integer (Int32)}
     */
    static dispidaudio_analysis => 213

    /**
     * @type {Integer (Int32)}
     */
    static dispidvideo_analysis => 214

    /**
     * @type {Integer (Int32)}
     */
    static dispiddata_analysis => 215

    /**
     * @type {Integer (Int32)}
     */
    static dispid_resetFilterList => 216

    /**
     * @type {Integer (Int32)}
     */
    static dispidDevicePath => 217

    /**
     * @type {Integer (Int32)}
     */
    static dispid_SourceFilter => 218

    /**
     * @type {Integer (Int32)}
     */
    static dispid__SourceFilter => 219

    /**
     * @type {Integer (Int32)}
     */
    static dispidUserEvent => 220

    /**
     * @type {Integer (Int32)}
     */
    static dispid_Bookmark => 221

    /**
     * @type {Integer (Int32)}
     */
    static LastReservedDeviceDispid => 16383
}
