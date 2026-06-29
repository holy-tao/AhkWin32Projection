#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Describes the default, maximum, and minimum values allowed for a FILETIME.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ns-resapi-resutil_filetime_data
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct RESUTIL_FILETIME_DATA {
    #StructPack 4

    Default : FILETIME

    Minimum : FILETIME

    Maximum : FILETIME

}
