#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSPROP_VALUE.ahk" { CLUSPROP_VALUE }
#Import ".\CLUSPROP_SYNTAX.ahk" { CLUSPROP_SYNTAX }

/**
 * Describes a binary data value.
 * @remarks
 * Use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusprop_binary_declare">CLUSPROP_BINARY_DECLARE</a> macro to 
 *      initialize a <b>CLUSPROP_BINARY</b> structure.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clusprop_binary
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSPROP_BINARY {
    #StructPack 4

    Base : CLUSPROP_VALUE

    /**
     * Array of bytes containing the data.
     */
    rgb : Int8[1]

}
