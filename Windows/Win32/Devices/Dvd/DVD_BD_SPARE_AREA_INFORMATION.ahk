#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class DVD_BD_SPARE_AREA_INFORMATION extends Win32Struct
{
    static sizeof => 12

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    NumberOfFreeSpareBlocks{
        get {
            if(!this.HasProp("__NumberOfFreeSpareBlocksProxyArray"))
                this.__NumberOfFreeSpareBlocksProxyArray := Win32FixedArray(this.ptr + 4, 4, Primitive, "char")
            return this.__NumberOfFreeSpareBlocksProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    NumberOfAllocatedSpareBlocks{
        get {
            if(!this.HasProp("__NumberOfAllocatedSpareBlocksProxyArray"))
                this.__NumberOfAllocatedSpareBlocksProxyArray := Win32FixedArray(this.ptr + 8, 4, Primitive, "char")
            return this.__NumberOfAllocatedSpareBlocksProxyArray
        }
    }
}
