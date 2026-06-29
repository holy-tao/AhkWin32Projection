#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSPROP_VALUE.ahk" { CLUSPROP_VALUE }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\CLUSPROP_SYNTAX.ahk" { CLUSPROP_SYNTAX }

/**
 * Describes a date and time stamp for a file.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clusprop_filetime
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSPROP_FILETIME {
    #StructPack 4

    Base : CLUSPROP_VALUE

    /**
     * A date and time value.
     */
    ft : FILETIME

}
