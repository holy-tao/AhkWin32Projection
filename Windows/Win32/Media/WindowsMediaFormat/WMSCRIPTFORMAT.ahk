#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The WMSCRIPTFORMAT structure describes the type of script data used in a script stream.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wmscriptformat
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WMSCRIPTFORMAT {
    #StructPack 4

    /**
     * GUID identifying the type of script commands in a script stream. Always set to WMSCRIPTTYPE_TwoStrings.
     */
    scriptType : Guid

}
