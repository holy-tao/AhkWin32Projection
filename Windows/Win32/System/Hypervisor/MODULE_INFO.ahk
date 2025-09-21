#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOS_IMAGE_INFO.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class MODULE_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer<Byte>}
     */
    ProcessImageName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {DOS_IMAGE_INFO}
     */
    Image{
        get {
            if(!this.HasProp("__Image"))
                this.__Image := DOS_IMAGE_INFO(this.ptr + 8)
            return this.__Image
        }
    }
}
