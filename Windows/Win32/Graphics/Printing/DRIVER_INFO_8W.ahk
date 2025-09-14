#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Contains printer driver information.
 * @remarks
 * The strings for these members are contained in the .inf file that is used to add the driver.
 * @see https://learn.microsoft.com/windows/win32/printdocs/driver-info-8
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset Unicode
 */
class DRIVER_INFO_8W extends Win32Struct
{
    static sizeof => 200

    static packingSize => 8

    /**
     * The operating system version for which the driver was written. The supported value is 3.
     * @type {Integer}
     */
    cVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a null-terminated string that specifies the name of the driver (for example, QMS 810).
     * @type {Pointer<PWSTR>}
     */
    pName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a null-terminated string that specifies the environment for which the driver was written (for example, Windows x86, Windows IA64, and Windows x64.
     * @type {Pointer<PWSTR>}
     */
    pEnvironment {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to a null-terminated string that specifies a file name or a full path and file name for the file that contains the device driver (for example, C:\\DRIVERS\\Pscript.dll).
     * @type {Pointer<PWSTR>}
     */
    pDriverPath {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to a null-terminated string that specifies a file name or a full path and file name for the file that contains driver data (for example, C:\\DRIVERS\\Qms810.ppd).
     * @type {Pointer<PWSTR>}
     */
    pDataFile {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A pointer to a null-terminated string that specifies a file name or a full path and file name for the device driver's configuration dynamic-link library (for example, C:\\DRIVERS\\Pscrptui.dll).
     * @type {Pointer<PWSTR>}
     */
    pConfigFile {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A pointer to a null-terminated string that specifies a file name or a full path and file name for the device driver's help file (for example, C:\\DRIVERS\\Pscrptui.hlp).
     * @type {Pointer<PWSTR>}
     */
    pHelpFile {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * A pointer to a MultiSZ buffer that contains a sequence of null-terminated strings. Each null-terminated string in the buffer contains the name of a file the driver depends on. The sequence of strings is terminated by an empty, zero-length string. If **pDependentFiles** is not **NULL** and does not contain any file names, it will point to a buffer that contains two empty strings.
     * @type {Pointer<PWSTR>}
     */
    pDependentFiles {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * A pointer to a null-terminated string that specifies a language monitor (for example, "PJL monitor"). This member can be **NULL** and should be specified only for printers capable of bidirectional communication.
     * @type {Pointer<PWSTR>}
     */
    pMonitorName {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * A pointer to a null-terminated string that specifies the default data type of the print job (for example, "EMF").
     * @type {Pointer<PWSTR>}
     */
    pDefaultDataType {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * A pointer to a null-terminated string that specifies previous printer driver names that are compatible with this driver. For example, OldName1\\0OldName2\\0\\0.
     * @type {Pointer<PWSTR>}
     */
    pszzPreviousNames {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * The date of the driver package, as coded in the driver files.
     * @type {FILETIME}
     */
    ftDriverDate{
        get {
            if(!this.HasProp("__ftDriverDate"))
                this.__ftDriverDate := FILETIME(this.ptr + 88)
            return this.__ftDriverDate
        }
    }

    /**
     * The version number of the driver. This comes from the version structure of the driver.
     * @type {Integer}
     */
    dwlDriverVersion {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * A pointer to a null-terminated string that specifies the manufacturer's name.
     * @type {Pointer<PWSTR>}
     */
    pszMfgName {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * A pointer to a null-terminated string that specifies the URL for the manufacturer.
     * @type {Pointer<PWSTR>}
     */
    pszOEMUrl {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * A pointer to a null-terminated string that specifies the hardware ID for the printer driver.
     * @type {Pointer<PWSTR>}
     */
    pszHardwareID {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * A pointer to a null-terminated string that specifies the provider of the printer driver (for example, "Microsoft Windows 2000").
     * @type {Pointer<PWSTR>}
     */
    pszProvider {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * A pointer to a null-terminated string that specifies the print processor (for example, "WinPrint").
     * @type {Pointer<PWSTR>}
     */
    pszPrintProcessor {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * A pointer to a null-terminated string that specifies the vendor's driver setup DLL and entry point.
     * @type {Pointer<PWSTR>}
     */
    pszVendorSetup {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * A pointer to a null-terminated string that specifies the color profiles associated with the driver.
     * @type {Pointer<PWSTR>}
     */
    pszzColorProfiles {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * A pointer to a null-terminated string that specifies the path to the driver's .inf file in the driver store. (See Remarks.) This must be **NULL** if the DRIVER\_INFO\_8 is being passed to [**AddPrinterDriver**](addprinterdriver.md) or [**AddPrinterDriverEx**](addprinterdriverex.md).
     * @type {Pointer<PWSTR>}
     */
    pszInfPath {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

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
     * @type {Integer}
     */
    dwPrinterDriverAttributes {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * A pointer to a null-terminated multi-string that specifies all the core printer drivers that the driver depends on. This must be **NULL** if the **DRIVER\_INFO\_8** is being passed to [**AddPrinterDriver**](addprinterdriver.md) or [**AddPrinterDriverEx**](addprinterdriverex.md).
     * @type {Pointer<PWSTR>}
     */
    pszzCoreDriverDependencies {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * The earliest allowed date of any drivers that shipped with Windows and on which this driver depends.
     * @type {FILETIME}
     */
    ftMinInboxDriverVerDate{
        get {
            if(!this.HasProp("__ftMinInboxDriverVerDate"))
                this.__ftMinInboxDriverVerDate := FILETIME(this.ptr + 184)
            return this.__ftMinInboxDriverVerDate
        }
    }

    /**
     * The earliest allowed version of any drivers that shipped with Windows and on which this driver depends.
     * @type {Integer}
     */
    dwlMinInboxDriverVerVersion {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }
}
