#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
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
     * @type {PSTR}
     */
    ProcessImageName{
        get {
            if(!this.HasProp("__ProcessImageName"))
                this.__ProcessImageName := PSTR(this.ptr + 0)
            return this.__ProcessImageName
        }
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
