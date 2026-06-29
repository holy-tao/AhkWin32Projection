#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MODULE_TYPE_INFO {
    #StructPack 2

    dataLength : UInt16

    leaf : UInt16

    data : Int8[1]

}
