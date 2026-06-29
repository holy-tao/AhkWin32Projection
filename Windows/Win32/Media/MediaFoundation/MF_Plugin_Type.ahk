#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the object type for the IMFPluginControl interface.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mf_plugin_type
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_Plugin_Type {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Media Foundation transform (MFT).
     * @type {Integer (Int32)}
     */
    static MF_Plugin_Type_MFT => 0

    /**
     * Media source.
     * @type {Integer (Int32)}
     */
    static MF_Plugin_Type_MediaSource => 1

    /**
     * Match output type.
     * @type {Integer (Int32)}
     */
    static MF_Plugin_Type_MFT_MatchOutputType => 2

    /**
     * Other.
     * @type {Integer (Int32)}
     */
    static MF_Plugin_Type_Other => -1
}
