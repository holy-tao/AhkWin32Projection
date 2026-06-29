#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\SP_CLASSINSTALL_HEADER.ahk" { SP_CLASSINSTALL_HEADER }
#Import "..\..\UI\Controls\HPROPSHEETPAGE.ahk" { HPROPSHEETPAGE }
#Import ".\DI_FUNCTION.ahk" { DI_FUNCTION }

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @architecture X64, Arm64
 */
export default struct SP_INSTALLWIZARD_DATA {
    #StructPack 8

    ClassInstallHeader : SP_CLASSINSTALL_HEADER

    Flags : UInt32

    DynamicPages : HPROPSHEETPAGE[20]

    NumDynamicPages : UInt32

    DynamicPageFlags : UInt32

    PrivateFlags : UInt32

    PrivateData : LPARAM

    hwndWizardDlg : HWND

}
