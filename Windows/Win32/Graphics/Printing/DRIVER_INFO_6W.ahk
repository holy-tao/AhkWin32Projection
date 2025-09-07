#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * The DRIVER\_INFO\_6 structure contains printer driver information.
 * @remarks
 * The strings for these members are contained in the .inf file that is used to add the driver.
  * 
  * If you call [**AddPrinterDriver**](addprinterdriver.md) or [**AddPrinterDriverEx**](addprinterdriverex.md) with *Level* not equal to 6, and then you call [**GetPrinterDriver**](getprinterdriver.md) or [**EnumPrinterDrivers**](enumprinterdrivers.md) with *Level* equal to 6, the **DRIVER\_INFO\_6** structure is returned with **pszMfgName**, **pszOEMUrl**, **pszHardwareID**, and **pszProvider** set to **NULL**, **dwlDriverVersion** set to 0, and **ftDriverDate** set to (0,0).
 * @see https://learn.microsoft.com/windows/win32/printdocs/driver-info-6
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset Unicode
 */
class DRIVER_INFO_6W extends Win32Struct
{
    static sizeof => 136

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
     * Pointer to a null-terminated string that specifies the name of the driver (for example, QMS 810).
     * @type {PWSTR}
     */
    pName{
        get {
            if(!this.HasProp("__pName"))
                this.__pName := PWSTR(this.ptr + 8)
            return this.__pName
        }
    }

    /**
     * Pointer to a null-terminated string that specifies the environment for which the driver was written (for example, Windows NT x86, Windows IA64, and Windows x64.
     * @type {PWSTR}
     */
    pEnvironment{
        get {
            if(!this.HasProp("__pEnvironment"))
                this.__pEnvironment := PWSTR(this.ptr + 16)
            return this.__pEnvironment
        }
    }

    /**
     * Pointer to a null-terminated string that specifies a file name or a full path and file name for the file that contains the device driver (for example, C:\\DRIVERS\\Pscript.dll).
     * @type {PWSTR}
     */
    pDriverPath{
        get {
            if(!this.HasProp("__pDriverPath"))
                this.__pDriverPath := PWSTR(this.ptr + 24)
            return this.__pDriverPath
        }
    }

    /**
     * Pointer to a null-terminated string that specifies a file name or a full path and file name for the file that contains driver data (for example, C:\\DRIVERS\\Qms810.ppd).
     * @type {PWSTR}
     */
    pDataFile{
        get {
            if(!this.HasProp("__pDataFile"))
                this.__pDataFile := PWSTR(this.ptr + 32)
            return this.__pDataFile
        }
    }

    /**
     * Pointer to a null-terminated string that specifies a file name or a full path and file name for the device driver's configuration dynamic-link library (for example, C:\\DRIVERS\\Pscrptui.dll).
     * @type {PWSTR}
     */
    pConfigFile{
        get {
            if(!this.HasProp("__pConfigFile"))
                this.__pConfigFile := PWSTR(this.ptr + 40)
            return this.__pConfigFile
        }
    }

    /**
     * Pointer to a null-terminated string that specifies a file name or a full path and file name for the device driver's help file (for example, C:\\DRIVERS\\Pscrptui.hlp).
     * @type {PWSTR}
     */
    pHelpFile{
        get {
            if(!this.HasProp("__pHelpFile"))
                this.__pHelpFile := PWSTR(this.ptr + 48)
            return this.__pHelpFile
        }
    }

    /**
     * A pointer to a MultiSZ buffer that contains a sequence of null-terminated strings. Each null-terminated string in the buffer contains the name of a file the driver depends on. The sequence of strings is terminated by an empty, zero-length string. If **pDependentFiles** is not **NULL** and does not contain any file names, it will point to a buffer that contains two empty strings.
     * @type {PWSTR}
     */
    pDependentFiles{
        get {
            if(!this.HasProp("__pDependentFiles"))
                this.__pDependentFiles := PWSTR(this.ptr + 56)
            return this.__pDependentFiles
        }
    }

    /**
     * A pointer to a null-terminated string that specifies a language monitor (for example, "PJL monitor"). This member can be **NULL** and should be specified only for printers capable of bidirectional communication.
     * @type {PWSTR}
     */
    pMonitorName{
        get {
            if(!this.HasProp("__pMonitorName"))
                this.__pMonitorName := PWSTR(this.ptr + 64)
            return this.__pMonitorName
        }
    }

    /**
     * A pointer to a null-terminated string that specifies the default data type of the print job (for example, "EMF").
     * @type {PWSTR}
     */
    pDefaultDataType{
        get {
            if(!this.HasProp("__pDefaultDataType"))
                this.__pDefaultDataType := PWSTR(this.ptr + 72)
            return this.__pDefaultDataType
        }
    }

    /**
     * A pointer to a null-terminated string that specifies previous printer driver names that are compatible with this driver. For example, OldName1\\0OldName2\\0\\0.
     * @type {PWSTR}
     */
    pszzPreviousNames{
        get {
            if(!this.HasProp("__pszzPreviousNames"))
                this.__pszzPreviousNames := PWSTR(this.ptr + 80)
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
     * Version number of the driver. This comes out of the version structure of the driver.
     * @type {Integer}
     */
    dwlDriverVersion {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Pointer to a null-terminated string that specifies the manufacturer's name.
     * @type {PWSTR}
     */
    pszMfgName{
        get {
            if(!this.HasProp("__pszMfgName"))
                this.__pszMfgName := PWSTR(this.ptr + 104)
            return this.__pszMfgName
        }
    }

    /**
     * Pointer to a null-terminated string that specifies the URL for the manufacturer.
     * @type {PWSTR}
     */
    pszOEMUrl{
        get {
            if(!this.HasProp("__pszOEMUrl"))
                this.__pszOEMUrl := PWSTR(this.ptr + 112)
            return this.__pszOEMUrl
        }
    }

    /**
     * Pointer to a null-terminated string that specifies the hardware ID for the printer driver.
     * @type {PWSTR}
     */
    pszHardwareID{
        get {
            if(!this.HasProp("__pszHardwareID"))
                this.__pszHardwareID := PWSTR(this.ptr + 120)
            return this.__pszHardwareID
        }
    }

    /**
     * Pointer to a null-terminated string that specifies the provider of the printer driver (for example, "Microsoft Windows 2000")
     * @type {PWSTR}
     */
    pszProvider{
        get {
            if(!this.HasProp("__pszProvider"))
                this.__pszProvider := PWSTR(this.ptr + 128)
            return this.__pszProvider
        }
    }
}
