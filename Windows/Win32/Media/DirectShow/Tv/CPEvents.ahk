#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * This topic applies to Windows XP Service Pack 1 or later.
 * @see https://learn.microsoft.com/windows/win32/api/encdec/ne-encdec-cpevents
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct CPEvents {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No content protection issues.
     * @type {Integer (Int32)}
     */
    static CPEVENT_NONE => 0

    /**
     * Content is blocked because of parental ratings.
     * @type {Integer (Int32)}
     */
    static CPEVENT_RATINGS => 1

    /**
     * Content is blocked because of copy protection rules.
     * @type {Integer (Int32)}
     */
    static CPEVENT_COPP => 2

    /**
     * Content is blocked because the DRM license is not valid.
     * @type {Integer (Int32)}
     */
    static CPEVENT_LICENSE => 3

    /**
     * Content is blocked because the system detected that the clock was rolled back.
     * @type {Integer (Int32)}
     */
    static CPEVENT_ROLLBACK => 4

    /**
     * Content is blocked because the filter graph contains untrusted components.
     * @type {Integer (Int32)}
     */
    static CPEVENT_SAC => 5

    /**
     * Content is being rendered at a lower resolution due to copy protection.
     * @type {Integer (Int32)}
     */
    static CPEVENT_DOWNRES => 6

    /**
     * Content is blocked because the filter graph contains untrusted components.
     * @type {Integer (Int32)}
     */
    static CPEVENT_STUBLIB => 7

    /**
     * Content is blocked because the filter graph contains untrusted components.
     * @type {Integer (Int32)}
     */
    static CPEVENT_UNTRUSTEDGRAPH => 8

    /**
     * @type {Integer (Int32)}
     */
    static CPEVENT_PROTECTWINDOWED => 9
}
