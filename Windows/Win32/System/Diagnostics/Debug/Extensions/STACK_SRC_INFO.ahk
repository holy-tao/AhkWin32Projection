#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct STACK_SRC_INFO {
    #StructPack 8

    ImagePath : PWSTR

    ModuleName : PWSTR

    Function : PWSTR

    Displacement : UInt32

    Row : UInt32

    Column : UInt32

}
