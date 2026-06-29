#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_EXPR_VAR {
    #StructPack 4

    ExprType : Int8

    VarType : Int8

    Reserved : UInt16

    Offset : UInt32

}
