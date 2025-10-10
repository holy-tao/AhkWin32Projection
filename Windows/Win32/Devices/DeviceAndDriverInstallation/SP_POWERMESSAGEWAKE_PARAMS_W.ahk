#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SP_CLASSINSTALL_HEADER.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset Unicode
 */
class SP_POWERMESSAGEWAKE_PARAMS_W extends Win32Struct
{
    static sizeof => 1032

    static packingSize => 8

    /**
     * @type {SP_CLASSINSTALL_HEADER}
     */
    ClassInstallHeader{
        get {
            if(!this.HasProp("__ClassInstallHeader"))
                this.__ClassInstallHeader := SP_CLASSINSTALL_HEADER(this.ptr + 0)
            return this.__ClassInstallHeader
        }
    }

    /**
     * @type {String}
     */
    PowerMessageWake {
        get => StrGet(this.ptr + 8, 511, "UTF-16")
        set => StrPut(value, this.ptr + 8, 511, "UTF-16")
    }
}
