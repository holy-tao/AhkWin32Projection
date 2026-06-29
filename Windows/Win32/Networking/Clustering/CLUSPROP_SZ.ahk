#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSPROP_VALUE.ahk" { CLUSPROP_VALUE }
#Import ".\CLUSPROP_SYNTAX.ahk" { CLUSPROP_SYNTAX }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Describes multiple NULL-terminated Unicode strings.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clusprop_sz
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSPROP_SZ {
    #StructPack 4

    Base : CLUSPROP_VALUE

    /**
     * Multiple null-terminated Unicode strings with the last string followed by an additional <b>NULL</b>-terminating character.
     */
    sz : WCHAR[1]

}
