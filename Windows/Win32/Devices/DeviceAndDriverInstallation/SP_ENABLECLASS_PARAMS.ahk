#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DI_FUNCTION.ahk
#Include .\SP_CLASSINSTALL_HEADER.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @architecture X64, Arm64
 */
class SP_ENABLECLASS_PARAMS extends Win32Struct {
    static sizeof => 28

    static packingSize => 4

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
     * @type {Guid}
     */
    ClassGuid {
        get {
            if(!this.HasProp("__ClassGuid"))
                this.__ClassGuid := Guid(8, this)
            return this.__ClassGuid
        }
    }

    /**
     * @type {Integer}
     */
    EnableMessage {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
