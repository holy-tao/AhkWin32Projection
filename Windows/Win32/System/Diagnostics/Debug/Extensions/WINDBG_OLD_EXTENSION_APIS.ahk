#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct WINDBG_OLD_EXTENSION_APIS {
    #StructPack 8

    nSize : UInt32

    lpOutputRoutine : IntPtr

    lpGetExpressionRoutine : IntPtr

    lpGetSymbolRoutine : IntPtr

    lpDisasmRoutine : IntPtr

    lpCheckControlCRoutine : IntPtr

}
