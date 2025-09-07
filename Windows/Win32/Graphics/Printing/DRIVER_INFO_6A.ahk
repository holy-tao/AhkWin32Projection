#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
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
 * @charset ANSI
 */
class DRIVER_INFO_6A extends Win32Struct
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
     * Pointer to a null-terminated string that specifies the environment for which the driver was written (for example, Windows NT x86, Windows IA64, and Windows x64.
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
     * Pointer to a null-terminated string that specifies a file name or a full path and file name for the file that contains the device driver (for example, C:\\DRIVERS\\Pscript.dll).
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
     * Pointer to a null-terminated string that specifies a file name or a full path and file name for the file that contains driver data (for example, C:\\DRIVERS\\Qms810.ppd).
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
     * Pointer to a null-terminated string that specifies a file name or a full path and file name for the device driver's configuration dynamic-link library (for example, C:\\DRIVERS\\Pscrptui.dll).
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
     * Pointer to a null-terminated string that specifies a file name or a full path and file name for the device driver's help file (for example, C:\\DRIVERS\\Pscrptui.hlp).
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
     * Version number of the driver. This comes out of the version structure of the driver.
     * @type {Integer}
     */
    dwlDriverVersion {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Pointer to a null-terminated string that specifies the manufacturer's name.
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
     * Pointer to a null-terminated string that specifies the URL for the manufacturer.
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
     * Pointer to a null-terminated string that specifies the hardware ID for the printer driver.
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
     * Pointer to a null-terminated string that specifies the provider of the printer driver (for example, "Microsoft Windows 2000")
     * @type {PSTR}
     */
    pszProvider{
        get {
            if(!this.HasProp("__pszProvider"))
                this.__pszProvider := PSTR(this.ptr + 128)
            return this.__pszProvider
        }
    }
}
