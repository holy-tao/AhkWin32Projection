#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BSTR.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class PM_EXTENSIONCONSUMER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer<Guid>}
     */
    ConsumerPID {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {BSTR}
     */
    ExtensionID{
        get {
            if(!this.HasProp("__ExtensionID"))
                this.__ExtensionID := BSTR(this.ptr + 8)
            return this.__ExtensionID
        }
    }
}
