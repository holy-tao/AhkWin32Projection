#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Function table for all actions on a session object.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ns-mi-mi_sessionft
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_SessionFT extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * TBD
     * @type {Pointer}
     */
    Close {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * TBD
     * @type {Pointer}
     */
    GetApplication {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * TBD
     * @type {Pointer}
     */
    GetInstance {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * TBD
     * @type {Pointer}
     */
    ModifyInstance {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * TBD
     * @type {Pointer}
     */
    CreateInstance {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * TBD
     * @type {Pointer}
     */
    DeleteInstance {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * TBD
     * @type {Pointer}
     */
    Invoke {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * TBD
     * @type {Pointer}
     */
    EnumerateInstances {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * TBD
     * @type {Pointer}
     */
    QueryInstances {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * TBD
     * @type {Pointer}
     */
    AssociatorInstances {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * TBD
     * @type {Pointer}
     */
    ReferenceInstances {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * TBD
     * @type {Pointer}
     */
    Subscribe {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * TBD
     * @type {Pointer}
     */
    GetClass {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * TBD
     * @type {Pointer}
     */
    EnumerateClasses {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * TBD
     * @type {Pointer}
     */
    TestConnection {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }
}
