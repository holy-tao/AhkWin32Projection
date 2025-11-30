#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class SegEventidList extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static eventidStateChange => 0

    /**
     * @type {Integer (Int32)}
     */
    static eventidOnTuneChanged => 1

    /**
     * @type {Integer (Int32)}
     */
    static eventidEndOfMedia => 2

    /**
     * @type {Integer (Int32)}
     */
    static eventidDVDNotify => 3

    /**
     * @type {Integer (Int32)}
     */
    static eventidPlayForwards => 4

    /**
     * @type {Integer (Int32)}
     */
    static eventidPlayBackwards => 5

    /**
     * @type {Integer (Int32)}
     */
    static eventidShowMenu => 6

    /**
     * @type {Integer (Int32)}
     */
    static eventidResume => 7

    /**
     * @type {Integer (Int32)}
     */
    static eventidSelectOrActivateButton => 8

    /**
     * @type {Integer (Int32)}
     */
    static eventidStillOff => 9

    /**
     * @type {Integer (Int32)}
     */
    static eventidPauseOn => 10

    /**
     * @type {Integer (Int32)}
     */
    static eventidChangeCurrentAudioStream => 11

    /**
     * @type {Integer (Int32)}
     */
    static eventidChangeCurrentSubpictureStream => 12

    /**
     * @type {Integer (Int32)}
     */
    static eventidChangeCurrentAngle => 13

    /**
     * @type {Integer (Int32)}
     */
    static eventidPlayAtTimeInTitle => 14

    /**
     * @type {Integer (Int32)}
     */
    static eventidPlayAtTime => 15

    /**
     * @type {Integer (Int32)}
     */
    static eventidPlayChapterInTitle => 16

    /**
     * @type {Integer (Int32)}
     */
    static eventidPlayChapter => 17

    /**
     * @type {Integer (Int32)}
     */
    static eventidReplayChapter => 18

    /**
     * @type {Integer (Int32)}
     */
    static eventidPlayNextChapter => 19

    /**
     * @type {Integer (Int32)}
     */
    static eventidStop => 20

    /**
     * @type {Integer (Int32)}
     */
    static eventidReturnFromSubmenu => 21

    /**
     * @type {Integer (Int32)}
     */
    static eventidPlayTitle => 22

    /**
     * @type {Integer (Int32)}
     */
    static eventidPlayPrevChapter => 23

    /**
     * @type {Integer (Int32)}
     */
    static eventidChangeKaraokePresMode => 24

    /**
     * @type {Integer (Int32)}
     */
    static eventidChangeVideoPresMode => 25

    /**
     * @type {Integer (Int32)}
     */
    static eventidOverlayUnavailable => 26

    /**
     * @type {Integer (Int32)}
     */
    static eventidSinkCertificateFailure => 27

    /**
     * @type {Integer (Int32)}
     */
    static eventidSinkCertificateSuccess => 28

    /**
     * @type {Integer (Int32)}
     */
    static eventidSourceCertificateFailure => 29

    /**
     * @type {Integer (Int32)}
     */
    static eventidSourceCertificateSuccess => 30

    /**
     * @type {Integer (Int32)}
     */
    static eventidRatingsBlocked => 31

    /**
     * @type {Integer (Int32)}
     */
    static eventidRatingsUnlocked => 32

    /**
     * @type {Integer (Int32)}
     */
    static eventidRatingsChanged => 33

    /**
     * @type {Integer (Int32)}
     */
    static eventidWriteFailure => 34

    /**
     * @type {Integer (Int32)}
     */
    static eventidTimeHole => 35

    /**
     * @type {Integer (Int32)}
     */
    static eventidStaleDataRead => 36

    /**
     * @type {Integer (Int32)}
     */
    static eventidContentBecomingStale => 37

    /**
     * @type {Integer (Int32)}
     */
    static eventidStaleFileDeleted => 38

    /**
     * @type {Integer (Int32)}
     */
    static eventidEncryptionOn => 39

    /**
     * @type {Integer (Int32)}
     */
    static eventidEncryptionOff => 40

    /**
     * @type {Integer (Int32)}
     */
    static eventidRateChange => 41

    /**
     * @type {Integer (Int32)}
     */
    static eventidLicenseChange => 42

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
     * @type {Integer (Int32)}
     */
    static eventidBroadcastEvent => 46

    /**
     * @type {Integer (Int32)}
     */
    static eventidBroadcastEventEx => 47

    /**
     * @type {Integer (Int32)}
     */
    static eventidContentPrimarilyAudio => 48

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
     * @type {Integer (Int32)}
     */
    static eventidWriteFailureClear => 57

    /**
     * @type {Integer (Int32)}
     */
    static LastReservedDeviceEvent => 16383
}
