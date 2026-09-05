#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class SegEventidList extends Win32Enum {

    /**
     * Native name: eventidStateChange
     * @type {Integer (Int32)}
     */
    static StateChange => 0

    /**
     * Native name: eventidOnTuneChanged
     * @type {Integer (Int32)}
     */
    static OnTuneChanged => 1

    /**
     * Native name: eventidEndOfMedia
     * @type {Integer (Int32)}
     */
    static EndOfMedia => 2

    /**
     * @type {Integer (Int32)}
     */
    static eventidDVDNotify => 3

    /**
     * Native name: eventidPlayForwards
     * @type {Integer (Int32)}
     */
    static PlayForwards => 4

    /**
     * Native name: eventidPlayBackwards
     * @type {Integer (Int32)}
     */
    static PlayBackwards => 5

    /**
     * Native name: eventidShowMenu
     * @type {Integer (Int32)}
     */
    static ShowMenu => 6

    /**
     * Native name: eventidResume
     * @type {Integer (Int32)}
     */
    static Resume => 7

    /**
     * Native name: eventidSelectOrActivateButton
     * @type {Integer (Int32)}
     */
    static SelectOrActivateButton => 8

    /**
     * Native name: eventidStillOff
     * @type {Integer (Int32)}
     */
    static StillOff => 9

    /**
     * Native name: eventidPauseOn
     * @type {Integer (Int32)}
     */
    static PauseOn => 10

    /**
     * Native name: eventidChangeCurrentAudioStream
     * @type {Integer (Int32)}
     */
    static ChangeCurrentAudioStream => 11

    /**
     * Native name: eventidChangeCurrentSubpictureStream
     * @type {Integer (Int32)}
     */
    static ChangeCurrentSubpictureStream => 12

    /**
     * Native name: eventidChangeCurrentAngle
     * @type {Integer (Int32)}
     */
    static ChangeCurrentAngle => 13

    /**
     * Native name: eventidPlayAtTimeInTitle
     * @type {Integer (Int32)}
     */
    static PlayAtTimeInTitle => 14

    /**
     * Native name: eventidPlayAtTime
     * @type {Integer (Int32)}
     */
    static PlayAtTime => 15

    /**
     * Native name: eventidPlayChapterInTitle
     * @type {Integer (Int32)}
     */
    static PlayChapterInTitle => 16

    /**
     * Native name: eventidPlayChapter
     * @type {Integer (Int32)}
     */
    static PlayChapter => 17

    /**
     * Native name: eventidReplayChapter
     * @type {Integer (Int32)}
     */
    static ReplayChapter => 18

    /**
     * Native name: eventidPlayNextChapter
     * @type {Integer (Int32)}
     */
    static PlayNextChapter => 19

    /**
     * Native name: eventidStop
     * @type {Integer (Int32)}
     */
    static Stop => 20

    /**
     * Native name: eventidReturnFromSubmenu
     * @type {Integer (Int32)}
     */
    static ReturnFromSubmenu => 21

    /**
     * Native name: eventidPlayTitle
     * @type {Integer (Int32)}
     */
    static PlayTitle => 22

    /**
     * Native name: eventidPlayPrevChapter
     * @type {Integer (Int32)}
     */
    static PlayPrevChapter => 23

    /**
     * Native name: eventidChangeKaraokePresMode
     * @type {Integer (Int32)}
     */
    static ChangeKaraokePresMode => 24

    /**
     * Native name: eventidChangeVideoPresMode
     * @type {Integer (Int32)}
     */
    static ChangeVideoPresMode => 25

    /**
     * Native name: eventidOverlayUnavailable
     * @type {Integer (Int32)}
     */
    static OverlayUnavailable => 26

    /**
     * Native name: eventidSinkCertificateFailure
     * @type {Integer (Int32)}
     */
    static SinkCertificateFailure => 27

    /**
     * Native name: eventidSinkCertificateSuccess
     * @type {Integer (Int32)}
     */
    static SinkCertificateSuccess => 28

    /**
     * Native name: eventidSourceCertificateFailure
     * @type {Integer (Int32)}
     */
    static SourceCertificateFailure => 29

    /**
     * Native name: eventidSourceCertificateSuccess
     * @type {Integer (Int32)}
     */
    static SourceCertificateSuccess => 30

    /**
     * Native name: eventidRatingsBlocked
     * @type {Integer (Int32)}
     */
    static RatingsBlocked => 31

    /**
     * Native name: eventidRatingsUnlocked
     * @type {Integer (Int32)}
     */
    static RatingsUnlocked => 32

    /**
     * Native name: eventidRatingsChanged
     * @type {Integer (Int32)}
     */
    static RatingsChanged => 33

    /**
     * Native name: eventidWriteFailure
     * @type {Integer (Int32)}
     */
    static WriteFailure => 34

    /**
     * Native name: eventidTimeHole
     * @type {Integer (Int32)}
     */
    static TimeHole => 35

    /**
     * Native name: eventidStaleDataRead
     * @type {Integer (Int32)}
     */
    static StaleDataRead => 36

    /**
     * Native name: eventidContentBecomingStale
     * @type {Integer (Int32)}
     */
    static ContentBecomingStale => 37

    /**
     * Native name: eventidStaleFileDeleted
     * @type {Integer (Int32)}
     */
    static StaleFileDeleted => 38

    /**
     * Native name: eventidEncryptionOn
     * @type {Integer (Int32)}
     */
    static EncryptionOn => 39

    /**
     * Native name: eventidEncryptionOff
     * @type {Integer (Int32)}
     */
    static EncryptionOff => 40

    /**
     * Native name: eventidRateChange
     * @type {Integer (Int32)}
     */
    static RateChange => 41

    /**
     * Native name: eventidLicenseChange
     * @type {Integer (Int32)}
     */
    static LicenseChange => 42

    /**
     * @type {Integer (Int32)}
     */
    static eventidCOPPBlocked => 43

    /**
     * @type {Integer (Int32)}
     */
    static eventidCOPPUnblocked => 44

    /**
     * @type {Integer (Int32)}
     */
    static dispidlicenseerrorcode => 45

    /**
     * Native name: eventidBroadcastEvent
     * @type {Integer (Int32)}
     */
    static BroadcastEvent => 46

    /**
     * Native name: eventidBroadcastEventEx
     * @type {Integer (Int32)}
     */
    static BroadcastEventEx => 47

    /**
     * Native name: eventidContentPrimarilyAudio
     * @type {Integer (Int32)}
     */
    static ContentPrimarilyAudio => 48

    /**
     * @type {Integer (Int32)}
     */
    static dispidAVDecAudioDualMonoEvent => 49

    /**
     * @type {Integer (Int32)}
     */
    static dispidAVAudioSampleRateEvent => 50

    /**
     * @type {Integer (Int32)}
     */
    static dispidAVAudioChannelConfigEvent => 51

    /**
     * @type {Integer (Int32)}
     */
    static dispidAVAudioChannelCountEvent => 52

    /**
     * @type {Integer (Int32)}
     */
    static dispidAVDecCommonMeanBitRateEvent => 53

    /**
     * @type {Integer (Int32)}
     */
    static dispidAVDDSurroundModeEvent => 54

    /**
     * @type {Integer (Int32)}
     */
    static dispidAVDecCommonInputFormatEvent => 55

    /**
     * @type {Integer (Int32)}
     */
    static dispidAVDecCommonOutputFormatEvent => 56

    /**
     * Native name: eventidWriteFailureClear
     * @type {Integer (Int32)}
     */
    static WriteFailureClear => 57

    /**
     * @type {Integer (Int32)}
     */
    static LastReservedDeviceEvent => 16383
}
