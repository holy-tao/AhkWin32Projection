#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SP_CLASSINSTALL_HEADER.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_selectdevice_params_w
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset Unicode
 */
class SP_SELECTDEVICE_PARAMS_W extends Win32Struct
{
    static sizeof => 1216

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
    Title {
        get => StrGet(this.ptr + 8, 59, "UTF-16")
        set => StrPut(value, this.ptr + 8, 59, "UTF-16")
    }

    /**
     * @type {String}
     */
    Instructions {
        get => StrGet(this.ptr + 128, 255, "UTF-16")
        set => StrPut(value, this.ptr + 128, 255, "UTF-16")
    }

    /**
     * @type {String}
     */
    ListLabel {
        get => StrGet(this.ptr + 640, 29, "UTF-16")
        set => StrPut(value, this.ptr + 640, 29, "UTF-16")
    }

    /**
     * @type {String}
     */
    SubTitle {
        get => StrGet(this.ptr + 700, 255, "UTF-16")
        set => StrPut(value, this.ptr + 700, 255, "UTF-16")
    }
}
