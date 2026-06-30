#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk
#Include .\VIDEO_WIN32K_CALLBACKS_PARAMS_TYPE.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 */
class VIDEO_WIN32K_CALLBACKS_PARAMS extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {VIDEO_WIN32K_CALLBACKS_PARAMS_TYPE}
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
    LockUserSession {
        get => NumGet(this, 28, "char")
        set => NumPut("char", value, this, 28)
    }

    /**
     * @type {BOOLEAN}
     */
    IsPostDevice {
        get => NumGet(this, 29, "char")
        set => NumPut("char", value, this, 29)
    }

    /**
     * @type {BOOLEAN}
     */
    SurpriseRemoval {
        get => NumGet(this, 30, "char")
        set => NumPut("char", value, this, 30)
    }

    /**
     * @type {BOOLEAN}
     */
    WaitForQueueReady {
        get => NumGet(this, 31, "char")
        set => NumPut("char", value, this, 31)
    }
}
