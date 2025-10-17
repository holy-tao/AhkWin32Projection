#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SP_CLASSINSTALL_HEADER.ahk

/**
 * An SP_PROPCHANGE_PARAMS structure corresponds to a DIF_PROPERTYCHANGE installation request.
 * @see https://docs.microsoft.com/windows/win32/api//setupapi/ns-setupapi-sp_propchange_params
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class SP_PROPCHANGE_PARAMS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * An install request header that contains the header size and the DIF code for the request. See <a href="https://docs.microsoft.com/windows/desktop/api/setupapi/ns-setupapi-sp_classinstall_header">SP_CLASSINSTALL_HEADER</a>.
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
     * 
     * @type {Integer}
     */
    StateChange {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Flags that specify the scope of a device property change. Can be one of the following:
     * @type {Integer}
     */
    Scope {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Supplies the hardware profile ID for profile-specific changes. Zero specifies the current hardware profile.
     * @type {Integer}
     */
    HwProfile {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
