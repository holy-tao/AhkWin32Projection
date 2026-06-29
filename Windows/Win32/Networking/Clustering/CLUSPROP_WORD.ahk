#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSPROP_VALUE.ahk" { CLUSPROP_VALUE }
#Import ".\CLUSPROP_SYNTAX.ahk" { CLUSPROP_SYNTAX }

/**
 * Describes numeric data.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clusprop_word
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSPROP_WORD {
    #StructPack 4

    Base : CLUSPROP_VALUE

    /**
     * Numeric value.
     */
    w : UInt16

}
