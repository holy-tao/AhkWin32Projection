#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines status conditions for the IMFASFSplitter::GetNextSample method.
 * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/ne-wmcontainer-asf_statusflags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ASF_STATUSFLAGS{

    /**
     * The operation is incomplete.
     * @type {Integer (Int32)}
     */
    static ASF_STATUSFLAGS_INCOMPLETE => 1

    /**
     * One or more non-critical errors
     *         occurred while parsing the ASF data.
     * @type {Integer (Int32)}
     */
    static ASF_STATUSFLAGS_NONFATAL_ERROR => 2
}
