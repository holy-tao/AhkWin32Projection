#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KEY_VALUE_PARTIAL_INFORMATION_ALIGN64 {
    #StructPack 4

    Type : UInt32

    DataLength : UInt32

    Data : Int8[1]

}
