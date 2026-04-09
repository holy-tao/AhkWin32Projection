#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\REDIRECTION_FUNCTION_DESCRIPTOR.ahk

/**
 * @namespace Windows.Win32.System.LibraryLoader
 */
class REDIRECTION_DESCRIPTOR extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    FunctionCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<REDIRECTION_FUNCTION_DESCRIPTOR>}
     */
    Redirections {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
