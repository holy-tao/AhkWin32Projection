#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @architecture X64, Arm64
 */
class WHV_VTL_PERMISSION_SET extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    AsUINT32 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Integer>}
     */
    VtlPermissionFrom1 {
        get {
            if(!this.HasProp("__VtlPermissionFrom1ProxyArray"))
                this.__VtlPermissionFrom1ProxyArray := Win32FixedArray(this.ptr + 0, 2, Primitive, "ushort")
            return this.__VtlPermissionFrom1ProxyArray
        }
    }
}
