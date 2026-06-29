#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The WMPPartnerNotification enumeration defines operational states of an online store.
 * @see https://learn.microsoft.com/windows/win32/api/contentpartner/ne-contentpartner-wmppartnernotification
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct WMPPartnerNotification {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Start background processing.
     * @type {Integer (Int32)}
     */
    static wmpsnBackgroundProcessingBegin => 1

    /**
     * End background processing.
     * @type {Integer (Int32)}
     */
    static wmpsnBackgroundProcessingEnd => 2

    /**
     * The catalog download failed.
     * @type {Integer (Int32)}
     */
    static wmpsnCatalogDownloadFailure => 3

    /**
     * The catalog download completed.
     * @type {Integer (Int32)}
     */
    static wmpsnCatalogDownloadComplete => 4
}
