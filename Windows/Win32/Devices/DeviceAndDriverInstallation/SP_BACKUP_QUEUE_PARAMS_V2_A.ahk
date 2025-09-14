#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset ANSI
 */
class SP_BACKUP_QUEUE_PARAMS_V2_A extends Win32Struct
{
    static sizeof => 528

    static packingSize => 1

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<SByte>}
     */
    FullInfPath{
        get {
            if(!this.HasProp("__FullInfPathProxyArray"))
                this.__FullInfPathProxyArray := Win32FixedArray(this.ptr + 4, 260, Primitive, "char")
            return this.__FullInfPathProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    FilenameOffset {
        get => NumGet(this, 264, "int")
        set => NumPut("int", value, this, 264)
    }

    /**
     * @type {Array<SByte>}
     */
    ReinstallInstance{
        get {
            if(!this.HasProp("__ReinstallInstanceProxyArray"))
                this.__ReinstallInstanceProxyArray := Win32FixedArray(this.ptr + 268, 260, Primitive, "char")
            return this.__ReinstallInstanceProxyArray
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 528
    }
}
