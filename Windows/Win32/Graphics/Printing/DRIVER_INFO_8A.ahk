#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Contains printer driver information.
 * @remarks
 * The strings for these members are contained in the .inf file that is used to add the driver.
 * @see https://learn.microsoft.com/windows/win32/printdocs/driver-info-8
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset ANSI
 */
class DRIVER_INFO_8A extends Win32Struct
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
     * @type {PSTR}
     */
    pName{
        get {
            if(!this.HasProp("__pName"))
                this.__pName := PSTR(this.ptr + 8)
            return this.__pName
        }
    }

    /**
     * A pointer to a null-terminated string that specifies the environment for which the driver was written (for example, Windows x86, Windows IA64, and Windows x64.
     * @type {PSTR}
     */
    pEnvironment{
        get {
            if(!this.HasProp("__pEnvironment"))
                this.__pEnvironment := PSTR(this.ptr + 16)
            return this.__pEnvironment
        }
    }

    /**
     * A pointer to a null-terminated string that specifies a file name or a full path and file name for the file that contains the device driver (for example, C:\\DRIVERS\\Pscript.dll).
     * @type {PSTR}
     */
    pDriverPath{
        get {
            if(!this.HasProp("__pDriverPath"))
                this.__pDriverPath := PSTR(this.ptr + 24)
            return this.__pDriverPath
        }
    }

    /**
     * A pointer to a null-terminated string that specifies a file name or a full path and file name for the file that contains driver data (for example, C:\\DRIVERS\\Qms810.ppd).
     * @type {PSTR}
     */
    pDataFile{
        get {
            if(!this.HasProp("__pDataFile"))
                this.__pDataFile := PSTR(this.ptr + 32)
            return this.__pDataFile
        }
    }

    /**
     * A pointer to a null-terminated string that specifies a file name or a full path and file name for the device driver's configuration dynamic-link library (for example, C:\\DRIVERS\\Pscrptui.dll).
     * @type {PSTR}
     */
    pConfigFile{
        get {
            if(!this.HasProp("__pConfigFile"))
                this.__pConfigFile := PSTR(this.ptr + 40)
            return this.__pConfigFile
        }
    }

    /**
     * A pointer to a null-terminated string that specifies a file name or a full path and file name for the device driver's help file (for example, C:\\DRIVERS\\Pscrptui.hlp).
     * @type {PSTR}
     */
    pHelpFile{
        get {
            if(!this.HasProp("__pHelpFile"))
                this.__pHelpFile := PSTR(this.ptr + 48)
            return this.__pHelpFile
        }
    }

    /**
     * A pointer to a MultiSZ buffer that contains a sequence of null-terminated strings. Each null-terminated string in the buffer contains the name of a file the driver depends on. The sequence of strings is terminated by an empty, zero-length string. If **pDependentFiles** is not **NULL** and does not contain any file names, it will point to a buffer that contains two empty strings.
     * @type {PSTR}
     */
    pDependentFiles{
        get {
            if(!this.HasProp("__pDependentFiles"))
                this.__pDependentFiles := PSTR(this.ptr + 56)
            return this.__pDependentFiles
        }
    }

    /**
     * A pointer to a null-terminated string that specifies a language monitor (for example, "PJL monitor"). This member can be **NULL** and should be specified only for printers capable of bidirectional communication.
     * @type {PSTR}
     */
    pMonitorName{
        get {
            if(!this.HasProp("__pMonitorName"))
                this.__pMonitorName := PSTR(this.ptr + 64)
            return this.__pMonitorName
        }
    }

    /**
     * A pointer to a null-terminated string that specifies the default data type of the print job (for example, "EMF").
     * @type {PSTR}
     */
    pDefaultDataType{
        get {
            if(!this.HasProp("__pDefaultDataType"))
                this.__pDefaultDataType := PSTR(this.ptr + 72)
            return this.__pDefaultDataType
        }
    }

    /**
     * A pointer to a null-terminated string that specifies previous printer driver names that are compatible with this driver. For example, OldName1\\0OldName2\\0\\0.
     * @type {PSTR}
     */
    pszzPreviousNames{
        get {
            if(!this.HasProp("__pszzPreviousNames"))
                this.__pszzPreviousNames := PSTR(this.ptr + 80)
            return this.__pszzPreviousNames
        }
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
     * @type {PSTR}
     */
    pszMfgName{
        get {
            if(!this.HasProp("__pszMfgName"))
                this.__pszMfgName := PSTR(this.ptr + 104)
            return this.__pszMfgName
        }
    }

    /**
     * A pointer to a null-terminated string that specifies the URL for the manufacturer.
     * @type {PSTR}
     */
    pszOEMUrl{
        get {
            if(!this.HasProp("__pszOEMUrl"))
                this.__pszOEMUrl := PSTR(this.ptr + 112)
            return this.__pszOEMUrl
        }
    }

    /**
     * A pointer to a null-terminated string that specifies the hardware ID for the printer driver.
     * @type {PSTR}
     */
    pszHardwareID{
        get {
            if(!this.HasProp("__pszHardwareID"))
                this.__pszHardwareID := PSTR(this.ptr + 120)
            return this.__pszHardwareID
        }
    }

    /**
     * A pointer to a null-terminated string that specifies the provider of the printer driver (for example, "Microsoft Windows 2000").
     * @type {PSTR}
     */
    pszProvider{
        get {
            if(!this.HasProp("__pszProvider"))
                this.__pszProvider := PSTR(this.ptr + 128)
            return this.__pszProvider
        }
    }

    /**
     * A pointer to a null-terminated string that specifies the print processor (for example, "WinPrint").
     * @type {PSTR}
     */
    pszPrintProcessor{
        get {
            if(!this.HasProp("__pszPrintProcessor"))
                this.__pszPrintProcessor := PSTR(this.ptr + 136)
            return this.__pszPrintProcessor
        }
    }

    /**
     * A pointer to a null-terminated string that specifies the vendor's driver setup DLL and entry point.
     * @type {PSTR}
     */
    pszVendorSetup{
        get {
            if(!this.HasProp("__pszVendorSetup"))
                this.__pszVendorSetup := PSTR(this.ptr + 144)
            return this.__pszVendorSetup
        }
    }

    /**
     * A pointer to a null-terminated string that specifies the color profiles associated with the driver.
     * @type {PSTR}
     */
    pszzColorProfiles{
        get {
            if(!this.HasProp("__pszzColorProfiles"))
                this.__pszzColorProfiles := PSTR(this.ptr + 152)
            return this.__pszzColorProfiles
        }
    }

    /**
     * A pointer to a null-terminated string that specifies the path to the driver's .inf file in the driver store. (See Remarks.) This must be **NULL** if the DRIVER\_INFO\_8 is being passed to [**AddPrinterDriver**](addprinterdriver.md) or [**AddPrinterDriverEx**](addprinterdriverex.md).
     * @type {PSTR}
     */
    pszInfPath{
        get {
            if(!this.HasProp("__pszInfPath"))
                this.__pszInfPath := PSTR(this.ptr + 160)
            return this.__pszInfPath
        }
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
     * @type {PSTR}
     */
    pszzCoreDriverDependencies{
        get {
            if(!this.HasProp("__pszzCoreDriverDependencies"))
                this.__pszzCoreDriverDependencies := PSTR(this.ptr + 176)
            return this.__pszzCoreDriverDependencies
        }
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
