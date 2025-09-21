#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SP_CLASSINSTALL_HEADER.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class SP_INSTALLWIZARD_DATA extends Win32Struct
{
    static sizeof => 208

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
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<Void>}
     */
    DynamicPages{
        get {
            if(!this.HasProp("__DynamicPagesProxyArray"))
                this.__DynamicPagesProxyArray := Win32FixedArray(this.ptr + 16, 20, Primitive, "ptr")
            return this.__DynamicPagesProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    NumDynamicPages {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

    /**
     * @type {Integer}
     */
    DynamicPageFlags {
        get => NumGet(this, 180, "uint")
        set => NumPut("uint", value, this, 180)
    }

    /**
     * @type {Integer}
     */
    PrivateFlags {
        get => NumGet(this, 184, "uint")
        set => NumPut("uint", value, this, 184)
    }

    /**
     * @type {Pointer}
     */
    PrivateData {
        get => NumGet(this, 192, "ptr")
        set => NumPut("ptr", value, this, 192)
    }

    /**
     * @type {Pointer<Void>}
     */
    hwndWizardDlg {
        get => NumGet(this, 200, "ptr")
        set => NumPut("ptr", value, this, 200)
    }
}
