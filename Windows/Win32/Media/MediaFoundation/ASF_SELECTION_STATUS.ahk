#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the selection options for an ASF stream.
 * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/ne-wmcontainer-asf_selection_status
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ASF_SELECTION_STATUS{

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
