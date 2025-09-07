#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This structure represents a CIM instance. This object should not be accessed directly. Instead, the MI_Instance_* functions should be used.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_instance
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_Instance extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_instanceft">MI_InstanceFT</a> function table.
     * @type {Pointer<MI_InstanceFT>}
     */
    ft {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The class declaration for this instance.
     * @type {Pointer<MI_ClassDecl>}
     */
    classDecl {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Optional server name. Can be null.
     * @type {Pointer<UInt16>}
     */
    serverName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Optional namespace. Can be null.
     * @type {Pointer<UInt16>}
     */
    nameSpace {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Reserved for internal use.
     * @type {Array<IntPtr>}
     */
    reserved{
        get {
            if(!this.HasProp("__reservedProxyArray"))
                this.__reservedProxyArray := Win32FixedArray(this.ptr + 32, 8, Primitive, "ptr")
            return this.__reservedProxyArray
        }
    }
}
