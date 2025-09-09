#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class DVD_RAM_SPARE_AREA_INFORMATION extends Win32Struct
{
    static sizeof => 12

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    FreePrimarySpareSectors{
        get {
            if(!this.HasProp("__FreePrimarySpareSectorsProxyArray"))
                this.__FreePrimarySpareSectorsProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "char")
            return this.__FreePrimarySpareSectorsProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    FreeSupplementalSpareSectors{
        get {
            if(!this.HasProp("__FreeSupplementalSpareSectorsProxyArray"))
                this.__FreeSupplementalSpareSectorsProxyArray := Win32FixedArray(this.ptr + 4, 4, Primitive, "char")
            return this.__FreeSupplementalSpareSectorsProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    AllocatedSupplementalSpareSectors{
        get {
            if(!this.HasProp("__AllocatedSupplementalSpareSectorsProxyArray"))
                this.__AllocatedSupplementalSpareSectorsProxyArray := Win32FixedArray(this.ptr + 8, 4, Primitive, "char")
            return this.__AllocatedSupplementalSpareSectorsProxyArray
        }
    }
}
