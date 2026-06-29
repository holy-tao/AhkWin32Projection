#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR_EXPR_DESC {
    #StructPack 8

    pOffset : IntPtr

    pFormatExpr : IntPtr

}
