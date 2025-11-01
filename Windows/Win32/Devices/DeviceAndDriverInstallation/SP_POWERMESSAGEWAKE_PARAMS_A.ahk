#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SP_CLASSINSTALL_HEADER.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_powermessagewake_params_a
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset ANSI
 */
class SP_POWERMESSAGEWAKE_PARAMS_A extends Win32Struct
{
    static sizeof => 520

    static packingSize => 8

    /**
     * @type {SP_CLASSINSTALL_HEADER}
     */
    ClassInstallHeader{
        get {
            if(!this.HasProp("__ClassInstallHeader"))
                this.__ClassInstallHeader := SP_CLASSINSTALL_HEADER(0, this)
            return this.__ClassInstallHeader
        }
    }

    /**
     * @type {String}
     */
    PowerMessageWake {
        get => StrGet(this.ptr + 8, 511, "UTF-8")
        set => StrPut(value, this.ptr + 8, 511, "UTF-8")
    }
}
