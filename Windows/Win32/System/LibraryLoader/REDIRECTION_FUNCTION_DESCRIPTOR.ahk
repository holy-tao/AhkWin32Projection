#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.System.LibraryLoader
 * @version v4.0.30319
 */
class REDIRECTION_FUNCTION_DESCRIPTOR extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    DllName{
        get {
            if(!this.HasProp("__DllName"))
                this.__DllName := PSTR(this.ptr + 0)
            return this.__DllName
        }
    }

    /**
     * @type {PSTR}
     */
    FunctionName{
        get {
            if(!this.HasProp("__FunctionName"))
                this.__FunctionName := PSTR(this.ptr + 8)
            return this.__FunctionName
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    RedirectionTarget {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
