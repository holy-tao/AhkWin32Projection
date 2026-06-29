#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * The DRIVER\_INFO\_6 structure contains printer driver information.
 * @remarks
 * The strings for these members are contained in the .inf file that is used to add the driver.
 * 
 * If you call [**AddPrinterDriver**](addprinterdriver.md) or [**AddPrinterDriverEx**](addprinterdriverex.md) with *Level* not equal to 6, and then you call [**GetPrinterDriver**](getprinterdriver.md) or [**EnumPrinterDrivers**](enumprinterdrivers.md) with *Level* equal to 6, the **DRIVER\_INFO\_6** structure is returned with **pszMfgName**, **pszOEMUrl**, **pszHardwareID**, and **pszProvider** set to **NULL**, **dwlDriverVersion** set to 0, and **ftDriverDate** set to (0,0).
 * @see https://learn.microsoft.com/windows/win32/printdocs/driver-info-6
 * @namespace Windows.Win32.Graphics.Printing
 * @charset Unicode
 */
export default struct DRIVER_INFO_6W {
    #StructPack 8

    /**
     * The operating system version for which the driver was written. The supported value is 3.
     */
    cVersion : UInt32

    /**
     * Pointer to a null-terminated string that specifies the name of the driver (for example, QMS 810).
     */
    pName : PWSTR

    /**
     * Pointer to a null-terminated string that specifies the environment for which the driver was written (for example, Windows NT x86, Windows IA64, and Windows x64.
     */
    pEnvironment : PWSTR

    /**
     * Pointer to a null-terminated string that specifies a file name or a full path and file name for the file that contains the device driver (for example, C:\\DRIVERS\\Pscript.dll).
     */
    pDriverPath : PWSTR

    /**
     * Pointer to a null-terminated string that specifies a file name or a full path and file name for the file that contains driver data (for example, C:\\DRIVERS\\Qms810.ppd).
     */
    pDataFile : PWSTR

    /**
     * Pointer to a null-terminated string that specifies a file name or a full path and file name for the device driver's configuration dynamic-link library (for example, C:\\DRIVERS\\Pscrptui.dll).
     */
    pConfigFile : PWSTR

    /**
     * Pointer to a null-terminated string that specifies a file name or a full path and file name for the device driver's help file (for example, C:\\DRIVERS\\Pscrptui.hlp).
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
     * Version number of the driver. This comes out of the version structure of the driver.
     */
    dwlDriverVersion : Int64

    /**
     * Pointer to a null-terminated string that specifies the manufacturer's name.
     */
    pszMfgName : PWSTR

    /**
     * Pointer to a null-terminated string that specifies the URL for the manufacturer.
     */
    pszOEMUrl : PWSTR

    /**
     * Pointer to a null-terminated string that specifies the hardware ID for the printer driver.
     */
    pszHardwareID : PWSTR

    /**
     * Pointer to a null-terminated string that specifies the provider of the printer driver (for example, "Microsoft Windows 2000")
     */
    pszProvider : PWSTR

}
