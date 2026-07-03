#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PWINDBG_CHECK_CONTROL_C.ahk" { PWINDBG_CHECK_CONTROL_C }
#Import ".\PWINDBG_DISASM.ahk" { PWINDBG_DISASM }
#Import ".\PWINDBG_GET_EXPRESSION.ahk" { PWINDBG_GET_EXPRESSION }
#Import ".\PWINDBG_GET_SYMBOL.ahk" { PWINDBG_GET_SYMBOL }
#Import ".\PWINDBG_OUTPUT_ROUTINE.ahk" { PWINDBG_OUTPUT_ROUTINE }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct WINDBG_OLD_EXTENSION_APIS {
    #StructPack 8

    nSize : UInt32

    lpOutputRoutine : PWINDBG_OUTPUT_ROUTINE

    lpGetExpressionRoutine : PWINDBG_GET_EXPRESSION

    lpGetSymbolRoutine : PWINDBG_GET_SYMBOL

    lpDisasmRoutine : PWINDBG_DISASM

    lpCheckControlCRoutine : PWINDBG_CHECK_CONTROL_C

}
