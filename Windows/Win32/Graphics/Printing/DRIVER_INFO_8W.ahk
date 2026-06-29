#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Contains printer driver information.
 * @remarks
 * The strings for these members are contained in the .inf file that is used to add the driver.
 * @see https://learn.microsoft.com/windows/win32/printdocs/driver-info-8
 * @namespace Windows.Win32.Graphics.Printing
 * @charset Unicode
 */
export default struct DRIVER_INFO_8W {
    #StructPack 8

    /**
     * The operating system version for which the driver was written. The supported value is 3.
     */
    cVersion : UInt32

    /**
     * A pointer to a null-terminated string that specifies the name of the driver (for example, QMS 810).
     */
    pName : PWSTR

    /**
     * A pointer to a null-terminated string that specifies the environment for which the driver was written (for example, Windows x86, Windows IA64, and Windows x64.
     */
    pEnvironment : PWSTR

    /**
     * A pointer to a null-terminated string that specifies a file name or a full path and file name for the file that contains the device driver (for example, C:\\DRIVERS\\Pscript.dll).
     */
    pDriverPath : PWSTR

    /**
     * A pointer to a null-terminated string that specifies a file name or a full path and file name for the file that contains driver data (for example, C:\\DRIVERS\\Qms810.ppd).
     */
    pDataFile : PWSTR

    /**
     * A pointer to a null-terminated string that specifies a file name or a full path and file name for the device driver's configuration dynamic-link library (for example, C:\\DRIVERS\\Pscrptui.dll).
     */
    pConfigFile : PWSTR

    /**
     * A pointer to a null-terminated string that specifies a file name or a full path and file name for the device driver's help file (for example, C:\\DRIVERS\\Pscrptui.hlp).
     */
    pHelpFile : PWSTR

    /**
     * A pointer to a MultiSZ buffer that contains a sequence of null-terminated strings. Each null-terminated string in the buffer contains the name of a file the driver depends on. The sequence of strings is terminated by an empty, zero-length string. If **pDependentFiles** is not **NULL** and does not contain any file names, it will point to a buffer that contains two empty strings.
     */
    pDependentFiles : PWSTR

    /**
     * A pointer to a null-terminated string that specifies a language monitor (for example, "PJL monitor"). This member can be **NULL** and should be specified only for printers capable of bidirectional communication.
     */
    pMonitorName : PWSTR

    /**
     * A pointer to a null-terminated string that specifies the default data type of the print job (for example, "EMF").
     */
    pDefaultDataType : PWSTR

    /**
     * A pointer to a null-terminated string that specifies previous printer driver names that are compatible with this driver. For example, OldName1\\0OldName2\\0\\0.
     */
    pszzPreviousNames : PWSTR

    /**
     * The date of the driver package, as coded in the driver files.
     */
    ftDriverDate : FILETIME

    /**
     * The version number of the driver. This comes from the version structure of the driver.
     */
    dwlDriverVersion : Int64

    /**
     * A pointer to a null-terminated string that specifies the manufacturer's name.
     */
    pszMfgName : PWSTR

    /**
     * A pointer to a null-terminated string that specifies the URL for the manufacturer.
     */
    pszOEMUrl : PWSTR

    /**
     * A pointer to a null-terminated string that specifies the hardware ID for the printer driver.
     */
    pszHardwareID : PWSTR

    /**
     * A pointer to a null-terminated string that specifies the provider of the printer driver (for example, "Microsoft Windows 2000").
     */
    pszProvider : PWSTR

    /**
     * A pointer to a null-terminated string that specifies the print processor (for example, "WinPrint").
     */
    pszPrintProcessor : PWSTR

    /**
     * A pointer to a null-terminated string that specifies the vendor's driver setup DLL and entry point.
     */
    pszVendorSetup : PWSTR

    /**
     * A pointer to a null-terminated string that specifies the color profiles associated with the driver.
     */
    pszzColorProfiles : PWSTR

    /**
     * A pointer to a null-terminated string that specifies the path to the driver's .inf file in the driver store. (See Remarks.) This must be **NULL** if the DRIVER\_INFO\_8 is being passed to [**AddPrinterDriver**](addprinterdriver.md) or [**AddPrinterDriverEx**](addprinterdriverex.md).
     */
    pszInfPath : PWSTR

    /**
     * Attribute flags for printer drivers. This must be 0 if the DRIVER\_INFO\_8 is being passed to [**AddPrinterDriver**](addprinterdriver.md) or [**AddPrinterDriverEx**](addprinterdriverex.md). Otherwise, it can be any combination of the following flags:
     * 
     * 
     * 
     * | Flag name/value                                                         | Meaning                                                                                                                                                                                                                                                                                                                                             | Minimum OS                                             |
     * |-------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------|
     * | PRINTER\_DRIVER\_PACKAGE\_AWARE<br/> 0x00000001<br/>        | The printer driver is part of a driver package.                                                                                                                                                                                                                                                                                                     | Windows Vista                                          |
     * | PRINTER\_DRIVER\_XPS<br/> 0x00000002<br/>                   | The printer driver supports the Microsoft XPS format described in the [XML Paper Specification: Overview](/previous-versions/windows/hardware/design/dn641615(v=vs.85)), and also in [Product Behavior, section <27>](/openspecs/windows_protocols/ms-rprn/e81cbc09-ab05-4a32-ae4a-8ec57b436c43).                        | Windows 8<br/> Windows Server 2012<br/>    |
     * | PRINTER\_DRIVER\_SANDBOX\_ENABLED<br/> 0x00000004<br/>      | The printer driver is compatible with [printer driver isolation](/openspecs/windows_protocols/ms-rprn/831cd729-be7c-451e-b729-bd8d84ce4d24). For more information, see [Product Behavior, section <28>](/openspecs/windows_protocols/ms-rprn/e81cbc09-ab05-4a32-ae4a-8ec57b436c43). | Windows 7<br/> Windows Server 2008 R2<br/> |
     * | PRINTER\_DRIVER\_CLASS<br/> 0x00000008<br/>                 | The printer driver is a [class printer driver](/openspecs/windows_protocols/ms-rprn/831cd729-be7c-451e-b729-bd8d84ce4d24).                                                                                                                                                                                       | Windows 8<br/> Windows Server 2012<br/>    |
     * | PRINTER\_DRIVER\_DERIVED<br/> 0x00000010<br/>               | The printer driver is a [derived printer driver](/openspecs/windows_protocols/ms-rprn/831cd729-be7c-451e-b729-bd8d84ce4d24).                                                                                                                                                                                   | Windows 8<br/> Windows Server 2012<br/>    |
     * | PRINTER\_DRIVER\_NOT\_SHAREABLE<br/> 0x00000020<br/>        | Printers using this printer driver cannot be shared.                                                                                                                                                                                                                                                                                                | Windows 8<br/> Windows Server 2012<br/>    |
     * | PRINTER\_DRIVER\_CATEGORY\_FAX<br/> 0x00000040<br/>         | The printer driver is intended for use with [fax printers](/openspecs/windows_protocols/ms-rprn/831cd729-be7c-451e-b729-bd8d84ce4d24).                                                                                                                                                                                    | Windows 8<br/> Windows Server 2012<br/>    |
     * | PRINTER\_DRIVER\_CATEGORY\_FILE<br/> 0x00000080<br/>        | The printer driver is intended for use with [file printers](/openspecs/windows_protocols/ms-rprn/831cd729-be7c-451e-b729-bd8d84ce4d24).                                                                                                                                                                                  | Windows 8<br/> Windows Server 2012<br/>    |
     * | PRINTER\_DRIVER\_CATEGORY\_VIRTUAL<br/> 0x00000100<br/>     | The printer driver is intended for use with [virtual printers](/openspecs/windows_protocols/ms-rprn/831cd729-be7c-451e-b729-bd8d84ce4d24).                                                                                                                                                                            | Windows 8<br/> Windows Server 2012<br/>    |
     * | PRINTER\_DRIVER\_CATEGORY\_SERVICE<br/> 0x00000200<br/>     | The printer driver is intended for use with [service printers](/openspecs/windows_protocols/ms-rprn/831cd729-be7c-451e-b729-bd8d84ce4d24).                                                                                                                                                                            | Windows 8<br/> Windows Server 2012<br/>    |
     * | PRINTER\_DRIVER\_SOFT\_RESET\_REQUIRED<br/> 0x00000400<br/> | Printers that use this printer driver should follow the guidelines outlined in the USB Device Class Definition. For more information, see [Product Behavior, section <36>](/openspecs/windows_protocols/ms-rprn/e81cbc09-ab05-4a32-ae4a-8ec57b436c43)                                                                      | Windows 8<br/> Windows Server 2012<br/>    |
     */
    dwPrinterDriverAttributes : UInt32

    /**
     * A pointer to a null-terminated multi-string that specifies all the core printer drivers that the driver depends on. This must be **NULL** if the **DRIVER\_INFO\_8** is being passed to [**AddPrinterDriver**](addprinterdriver.md) or [**AddPrinterDriverEx**](addprinterdriverex.md).
     */
    pszzCoreDriverDependencies : PWSTR

    /**
     * The earliest allowed date of any drivers that shipped with Windows and on which this driver depends.
     */
    ftMinInboxDriverVerDate : FILETIME

    /**
     * The earliest allowed version of any drivers that shipped with Windows and on which this driver depends.
     */
    dwlMinInboxDriverVerVersion : Int64

}
