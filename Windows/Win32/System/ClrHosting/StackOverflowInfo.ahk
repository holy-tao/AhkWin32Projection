#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\StackOverflowType.ahk" { StackOverflowType }
#Import "..\Diagnostics\Debug\EXCEPTION_POINTERS.ahk" { EXCEPTION_POINTERS }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct StackOverflowInfo {
    #StructPack 8

    soType : StackOverflowType

    pExceptionInfo : EXCEPTION_POINTERS.Ptr

}
