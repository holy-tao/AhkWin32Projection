#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SP_CLASSINSTALL_HEADER.ahk
#Include .\DI_FUNCTION.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @architecture X64, Arm64
 */
class SP_ENABLECLASS_PARAMS extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {SP_CLASSINSTALL_HEADER}
     */
    ClassInstallHeader {
        get {
            if(!this.HasProp("__ClassInstallHeader"))
                this.__ClassInstallHeader := SP_CLASSINSTALL_HEADER(0, this)
            return this.__ClassInstallHeader
        }
    }

    /**
     * @type {Pointer}
     */
    ClassGuid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    EnableMessage {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
