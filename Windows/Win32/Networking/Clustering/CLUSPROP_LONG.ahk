#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSPROP_VALUE.ahk" { CLUSPROP_VALUE }
#Import ".\CLUSPROP_SYNTAX.ahk" { CLUSPROP_SYNTAX }

/**
 * Describes signed LONG data.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clusprop_long
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSPROP_LONG {
    #StructPack 4

    Base : CLUSPROP_VALUE

    /**
     * Signed <b>LONG</b> value.
     */
    l : Int32

}
