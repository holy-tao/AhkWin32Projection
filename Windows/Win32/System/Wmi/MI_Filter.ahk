#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a reference to the function table MI_FilterFT.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_filter
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_Filter extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_filterft">MI_FilterFT</a> function table.
     * @type {Pointer<MI_FilterFT>}
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
