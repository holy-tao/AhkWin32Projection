#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_CONTROLLER_LIST extends Win32Struct
{
    static sizeof => 4096

    static packingSize => 2

    /**
     * @type {Integer}
     */
    NumberOfIdentifiers {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Array<UInt16>}
     */
    ControllerID{
        get {
            if(!this.HasProp("__ControllerIDProxyArray"))
                this.__ControllerIDProxyArray := Win32FixedArray(this.ptr + 2, 2047, Primitive, "ushort")
            return this.__ControllerIDProxyArray
        }
    }
}
