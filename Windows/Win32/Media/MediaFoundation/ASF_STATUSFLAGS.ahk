#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines status conditions for the IMFASFSplitter::GetNextSample method.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/ne-wmcontainer-asf_statusflags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class ASF_STATUSFLAGS extends Win32Enum {

    /**
     * The operation is incomplete.
     * Native name: ASF_STATUSFLAGS_INCOMPLETE
     * @type {Integer (Int32)}
     */
    static INCOMPLETE => 1

    /**
     * One or more non-critical errors
     *         occurred while parsing the ASF data.
     * Native name: ASF_STATUSFLAGS_NONFATAL_ERROR
     * @type {Integer (Int32)}
     */
    static NONFATAL_ERROR => 2
}
