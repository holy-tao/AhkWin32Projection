#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WINBIO_VERSION.ahk

/**
 * Describes the capabilities of a biometric service provider.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-bsp-schema
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_BSP_SCHEMA extends Win32Struct
{
    static sizeof => 1048

    static packingSize => 8

    /**
     * The type of biometric measurement used by this device. Currently this must be **WINBIO\_TYPE\_FINGERPRINT**.
     * @type {Integer}
     */
    BiometricFactor {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A value that uniquely identifies this biometric service provider component.
     * @type {Pointer<Guid>}
     */
    BspId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A **NULL**-terminated Unicode string that contains a description of the biometric service provider.
     * @type {Array<UInt16>}
     */
    Description{
        get {
            if(!this.HasProp("__DescriptionProxyArray"))
                this.__DescriptionProxyArray := Win32FixedArray(this.ptr + 16, 2, Primitive, "ushort")
            return this.__DescriptionProxyArray
        }
    }

    /**
     * A **NULL**-terminated Unicode string that contains the name of the vendor supplying the biometric service provider.
     * @type {Array<UInt16>}
     */
    Vendor{
        get {
            if(!this.HasProp("__VendorProxyArray"))
                this.__VendorProxyArray := Win32FixedArray(this.ptr + 528, 2, Primitive, "ushort")
            return this.__VendorProxyArray
        }
    }

    /**
     * A [**WINBIO\_VERSION**](winbio-version.md) structure the contains the software version of the biometric service provider component.
     * @type {WINBIO_VERSION}
     */
    Version{
        get {
            if(!this.HasProp("__Version"))
                this.__Version := WINBIO_VERSION(this.ptr + 1040)
            return this.__Version
        }
    }
}
