#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\SP_CLASSINSTALL_HEADER.ahk" { SP_CLASSINSTALL_HEADER }
#Import "..\..\UI\Controls\HPROPSHEETPAGE.ahk" { HPROPSHEETPAGE }
#Import ".\DI_FUNCTION.ahk" { DI_FUNCTION }

/**
 * An SP_NEWDEVICEWIZARD_DATA structure is used by installers to extend the operation of the hardware installation wizard by adding custom pages. It is used with DIF_NEWDEVICEWIZARD_XXX installation requests.
 * @remarks
 * <a href="https://docs.microsoft.com/windows/desktop/api/setupapi/ns-setupapi-sp_newdevicewizard_data">SP_ADDPROPERTYPAGE_DATA</a> is an alias for this structure.
 * @see https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_newdevicewizard_data
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @architecture X64, Arm64
 */
export default struct SP_NEWDEVICEWIZARD_DATA {
    #StructPack 8

    /**
     * An install request header that contains the header size and the DIF code for the request. See <a href="https://docs.microsoft.com/windows/desktop/api/setupapi/ns-setupapi-sp_classinstall_header">SP_CLASSINSTALL_HEADER</a>.
     */
    ClassInstallHeader : SP_CLASSINSTALL_HEADER

    /**
     * Reserved. Must be zero.
     */
    Flags : UInt32

    /**
     * An array of property sheet page handles. An installer can add the handles of custom wizard pages to this array.
     */
    DynamicPages : HPROPSHEETPAGE[20]

    /**
     * The number of pages that are added to the<b> DynamicPages</b> array. 
     * 
     * Because the array index is zero-based, this value is also the index to the next free entry in the array. For example, if there are 3 pages in the array, <b>DynamicPages[</b>3<b>]</b> is the next entry for an installer to use.
     */
    NumDynamicPages : UInt32

    /**
     * The handle to the top-level window of the hardware installation wizard .
     */
    hwndWizardDlg : HWND

}
