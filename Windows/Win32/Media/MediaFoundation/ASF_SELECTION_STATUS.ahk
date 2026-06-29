#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the selection options for an ASF stream.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/ne-wmcontainer-asf_selection_status
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct ASF_SELECTION_STATUS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No samples from the stream are delivered.
     * @type {Integer (Int32)}
     */
    static ASF_STATUS_NOTSELECTED => 0

    /**
     * Only samples from the stream that are clean points are delivered.
     * @type {Integer (Int32)}
     */
    static ASF_STATUS_CLEANPOINTSONLY => 1

    /**
     * All samples from the stream are delivered.
     * @type {Integer (Int32)}
     */
    static ASF_STATUS_ALLDATAUNITS => 2
}
