#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The AM_OVERLAY_NOTIFY_FLAGS enumeration indicates what the overlay has changed, or is about to change.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/win32/api/strmif/nf-strmif-iddrawexclmodevideocallback-onupdateoverlay">IDDrawExclModeVideoCallback::OnUpdateOverlay</a> method uses these flags to indicate how the overlay has changed, so that applications can take the necessary steps.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-_am_overlay_notify_flags
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct _AM_OVERLAY_NOTIFY_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The rectangle will be changed from visible to invisible, or vice-versa.
     * @type {Integer (Int32)}
     */
    static AM_OVERLAY_NOTIFY_VISIBLE_CHANGE => 1

    /**
     * Source rectangle changed or changing.
     * @type {Integer (Int32)}
     */
    static AM_OVERLAY_NOTIFY_SOURCE_CHANGE => 2

    /**
     * Destination rectangle changed or changing.
     * @type {Integer (Int32)}
     */
    static AM_OVERLAY_NOTIFY_DEST_CHANGE => 4
}
