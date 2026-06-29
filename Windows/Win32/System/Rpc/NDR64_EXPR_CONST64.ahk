#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_EXPR_CONST64 {
    #StructPack 8

    ExprType : Int8

    Reserved : Int8

    Reserved1 : UInt16

    ConstValue : Int64

}
