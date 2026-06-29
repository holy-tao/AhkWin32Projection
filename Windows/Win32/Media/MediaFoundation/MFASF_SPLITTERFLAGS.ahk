#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the ASF splitter options.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/ne-wmcontainer-mfasf_splitterflags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFASF_SPLITTERFLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The splitter delivers samples for the ASF content in reverse order to accommodate reverse playback.
     * @type {Integer (Int32)}
     */
    static MFASF_SPLITTER_REVERSE => 1

    /**
     * The splitter delivers samples for streams that are protected with Windows Media Digital Rights Management.
     * @type {Integer (Int32)}
     */
    static MFASF_SPLITTER_WMDRM => 2
}
