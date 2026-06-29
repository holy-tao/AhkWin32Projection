#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the library version.
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-api_version
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct API_VERSION {
    #StructPack 2

    /**
     * The major version number.
     */
    MajorVersion : UInt16

    /**
     * The minor version number.
     */
    MinorVersion : UInt16

    /**
     * The revision number.
     */
    Revision : UInt16

    /**
     * This member is reserved for use by the operating system.
     */
    Reserved : UInt16

}
