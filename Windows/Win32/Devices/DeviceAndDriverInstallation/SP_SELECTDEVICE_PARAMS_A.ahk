#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SP_CLASSINSTALL_HEADER.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_selectdevice_params_a
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 * @charset ANSI
 */
class SP_SELECTDEVICE_PARAMS_A extends Win32Struct
{
    static sizeof => 616

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
        get => StrGet(this.ptr + 8, 59, "UTF-8")
        set => StrPut(value, this.ptr + 8, 59, "UTF-8")
    }

    /**
     * @type {String}
     */
    Instructions {
        get => StrGet(this.ptr + 68, 255, "UTF-8")
        set => StrPut(value, this.ptr + 68, 255, "UTF-8")
    }

    /**
     * @type {String}
     */
    ListLabel {
        get => StrGet(this.ptr + 324, 29, "UTF-8")
        set => StrPut(value, this.ptr + 324, 29, "UTF-8")
    }

    /**
     * @type {String}
     */
    SubTitle {
        get => StrGet(this.ptr + 354, 255, "UTF-8")
        set => StrPut(value, this.ptr + 354, 255, "UTF-8")
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 610, 2, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }
}
