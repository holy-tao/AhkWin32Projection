#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\StackOverflowType.ahk
#Include ..\Diagnostics\Debug\EXCEPTION_POINTERS.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
class StackOverflowInfo extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {StackOverflowType}
     */
    soType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Pointer<EXCEPTION_POINTERS>}
     */
    pExceptionInfo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
