#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 * @version v4.0.30319
 */
class IMAGE_NOTE extends Win32Struct
{
    static sizeof => 270

    static packingSize => 2

    /**
     * @type {Array<SByte>}
     */
    Module{
        get {
            if(!this.HasProp("__ModuleProxyArray"))
                this.__ModuleProxyArray := Win32FixedArray(this.ptr + 0, 10, Primitive, "char")
            return this.__ModuleProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    FileName{
        get {
            if(!this.HasProp("__FileNameProxyArray"))
                this.__FileNameProxyArray := Win32FixedArray(this.ptr + 10, 256, Primitive, "char")
            return this.__FileNameProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    hModule {
        get => NumGet(this, 266, "ushort")
        set => NumPut("ushort", value, this, 266)
    }

    /**
     * @type {Integer}
     */
    hTask {
        get => NumGet(this, 268, "ushort")
        set => NumPut("ushort", value, this, 268)
    }
}
