#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WINBIO_VERSION.ahk

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_BSP_SCHEMA extends Win32Struct
{
    static sizeof => 1048

    static packingSize => 8

    /**
     * @type {Integer}
     */
    BiometricFactor {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Guid>}
     */
    BspId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Array<UInt16>}
     */
    Description{
        get {
            if(!this.HasProp("__DescriptionProxyArray"))
                this.__DescriptionProxyArray := Win32FixedArray(this.ptr + 16, 256, Primitive, "ushort")
            return this.__DescriptionProxyArray
        }
    }

    /**
     * @type {Array<UInt16>}
     */
    Vendor{
        get {
            if(!this.HasProp("__VendorProxyArray"))
                this.__VendorProxyArray := Win32FixedArray(this.ptr + 528, 256, Primitive, "ushort")
            return this.__VendorProxyArray
        }
    }

    /**
     * @type {WINBIO_VERSION}
     */
    Version{
        get {
            if(!this.HasProp("__Version"))
                this.__Version := WINBIO_VERSION(1040, this)
            return this.__Version
        }
    }
}
