#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
class DVD_BCA_DESCRIPTOR extends Win32Struct {
    static sizeof => 1

    static packingSize => 1

    /**
     * @type {Array<Integer>}
     */
    BCAInformation {
        get {
            if(!this.HasProp("__BCAInformationProxyArray"))
                this.__BCAInformationProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__BCAInformationProxyArray
        }
    }
}
