#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SP_CLASSINSTALL_HEADER.ahk

/**
 * An SP_NEWDEVICEWIZARD_DATA structure is used by installers to extend the operation of the hardware installation wizard by adding custom pages. It is used with DIF_NEWDEVICEWIZARD_XXX installation requests.
 * @remarks
 * <a href="https://docs.microsoft.com/windows/desktop/api/setupapi/ns-setupapi-sp_newdevicewizard_data">SP_ADDPROPERTYPAGE_DATA</a> is an alias for this structure.
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_newdevicewizard_data
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class SP_NEWDEVICEWIZARD_DATA extends Win32Struct
{
    static sizeof => 192

    static packingSize => 8

    /**
     * An install request header that contains the header size and the DIF code for the request. See <a href="https://docs.microsoft.com/windows/desktop/api/setupapi/ns-setupapi-sp_classinstall_header">SP_CLASSINSTALL_HEADER</a>.
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
     * Reserved. Must be zero.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * An array of property sheet page handles. An installer can add the handles of custom wizard pages to this array.
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
     * The number of pages that are added to the<b> DynamicPages</b> array. 
     * 
     * Because the array index is zero-based, this value is also the index to the next free entry in the array. For example, if there are 3 pages in the array, <b>DynamicPages[</b>3<b>]</b> is the next entry for an installer to use.
     * @type {Integer}
     */
    NumDynamicPages {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

    /**
     * The handle to the top-level window of the hardware installation wizard .
     * @type {Pointer<Void>}
     */
    hwndWizardDlg {
        get => NumGet(this, 184, "ptr")
        set => NumPut("ptr", value, this, 184)
    }
}
