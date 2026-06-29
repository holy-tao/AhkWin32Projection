#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_EXPR_OPERATOR {
    #StructPack 1

    ExprType : Int8

    Operator : Int8

    CastType : Int8

    Reserved : Int8

}
