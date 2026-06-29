#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DB_NUMERIC {
    #StructPack 1

    precision : Int8

    scale : Int8

    sign : Int8

    val : Int8[16]

}
