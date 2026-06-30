#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\DEV_OBJECT_TYPE.ahk
#Include ..\Properties\DEVPROPERTY.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceQuery
 */
class DEV_OBJECT extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {DEV_OBJECT_TYPE}
     */
    ObjectType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    pszObjectId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    cPropertyCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<DEVPROPERTY>}
     */
    pProperties {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
