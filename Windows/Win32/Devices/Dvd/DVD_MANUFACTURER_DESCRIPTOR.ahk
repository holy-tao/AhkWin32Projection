#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class DVD_MANUFACTURER_DESCRIPTOR extends Win32Struct
{
    static sizeof => 2048

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    ManufacturingInformation{
        get {
            if(!this.HasProp("__ManufacturingInformationProxyArray"))
                this.__ManufacturingInformationProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__ManufacturingInformationProxyArray
        }
    }
}
