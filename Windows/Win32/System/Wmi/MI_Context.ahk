#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Holds context for the operation that the provider needs to carry out.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_context
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_Context extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * This member is used internally, and it must not be changed.
     * @type {Pointer<MI_ContextFT>}
     */
    ft {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Reserved for internal use.
     * @type {Array<IntPtr>}
     */
    reserved{
        get {
            if(!this.HasProp("__reservedProxyArray"))
                this.__reservedProxyArray := Win32FixedArray(this.ptr + 8, 3, Primitive, "ptr")
            return this.__reservedProxyArray
        }
    }
}
