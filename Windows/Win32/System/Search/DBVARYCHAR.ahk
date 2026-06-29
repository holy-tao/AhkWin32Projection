#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DBVARYCHAR {
    #StructPack 2

    len : Int16

    str : Int8[8001]

}
