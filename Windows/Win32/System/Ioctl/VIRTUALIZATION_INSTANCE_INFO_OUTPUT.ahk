#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class VIRTUALIZATION_INSTANCE_INFO_OUTPUT extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Guid}
     */
    VirtualizationInstanceID {
        get {
            if(!this.HasProp("__VirtualizationInstanceID"))
                this.__VirtualizationInstanceID := Guid(0, this)
            return this.__VirtualizationInstanceID
        }
    }
}
