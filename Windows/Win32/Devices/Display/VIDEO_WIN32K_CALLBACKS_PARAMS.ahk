#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class VIDEO_WIN32K_CALLBACKS_PARAMS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    CalloutType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Pointer<Void>}
     */
    PhysDisp {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    Param {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {BOOLEAN}
     */
    LockUserSession{
        get {
            if(!this.HasProp("__LockUserSession"))
                this.__LockUserSession := BOOLEAN(this.ptr + 28)
            return this.__LockUserSession
        }
    }

    /**
     * @type {BOOLEAN}
     */
    IsPostDevice{
        get {
            if(!this.HasProp("__IsPostDevice"))
                this.__IsPostDevice := BOOLEAN(this.ptr + 29)
            return this.__IsPostDevice
        }
    }

    /**
     * @type {BOOLEAN}
     */
    SurpriseRemoval{
        get {
            if(!this.HasProp("__SurpriseRemoval"))
                this.__SurpriseRemoval := BOOLEAN(this.ptr + 30)
            return this.__SurpriseRemoval
        }
    }

    /**
     * @type {BOOLEAN}
     */
    WaitForQueueReady{
        get {
            if(!this.HasProp("__WaitForQueueReady"))
                this.__WaitForQueueReady := BOOLEAN(this.ptr + 31)
            return this.__WaitForQueueReady
        }
    }
}
