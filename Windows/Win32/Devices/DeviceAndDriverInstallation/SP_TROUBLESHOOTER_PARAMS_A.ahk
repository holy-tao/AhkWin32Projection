#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SP_CLASSINSTALL_HEADER.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset ANSI
 */
class SP_TROUBLESHOOTER_PARAMS_A extends Win32Struct
{
    static sizeof => 528

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
    ChmFile {
        get => StrGet(this.ptr + 8, 259, "UTF-8")
        set => StrPut(value, this.ptr + 8, 259, "UTF-8")
    }

    /**
     * @type {String}
     */
    HtmlTroubleShooter {
        get => StrGet(this.ptr + 268, 259, "UTF-8")
        set => StrPut(value, this.ptr + 268, 259, "UTF-8")
    }
}
