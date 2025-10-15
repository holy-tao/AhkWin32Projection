#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 * @charset ANSI
 */
class DIACTIONA extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    uAppData {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwSemantic {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {PSTR}
     */
    lptszActionName{
        get {
            if(!this.HasProp("__lptszActionName"))
                this.__lptszActionName := PSTR(this.ptr + 16)
            return this.__lptszActionName
        }
    }

    /**
     * @type {Integer}
     */
    uResIdString {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<Guid>}
     */
    guidInstance {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    dwObjID {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    dwHow {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
