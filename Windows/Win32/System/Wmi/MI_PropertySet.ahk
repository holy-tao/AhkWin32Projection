#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Implements a set of property names.
 * @remarks
 * 
 * It supports the building and interrogation of property sets. In general, clients  build property sets and providers interrogate them.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mi/ns-mi-mi_propertyset
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_PropertySet extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_propertysetft">MI_PropertySetFT</a> function table.
     * @type {Pointer<MI_PropertySetFT>}
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
