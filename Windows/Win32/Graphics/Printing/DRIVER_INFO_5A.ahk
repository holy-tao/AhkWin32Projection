#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The DRIVER\_INFO\_5 structure contains printer driver information.
 * @see https://learn.microsoft.com/windows/win32/printdocs/driver-info-5
 * @namespace Windows.Win32.Graphics.Printing
 * @charset ANSI
 */
export default struct DRIVER_INFO_5A {
    #StructPack 8

    /**
     * The operating system version for which the driver was written. The supported value is 3.
     */
    cVersion : UInt32

    /**
     * Pointer to a null-terminated string that specifies the name of the driver (for example, QMS 810).
     */
    pName : PSTR

    /**
     * Pointer to a null-terminated string that specifies the environment for which the driver was written (for example, Windows x86, Windows IA64, and Windows x64).
     */
    pEnvironment : PSTR

    /**
     * Pointer to a null-terminated string that specifies a file name or a full path and file name for the file that contains the device driver (for example, C:\\DRIVERS\\Pscript.dll).
     */
    pDriverPath : PSTR

    /**
     * Pointer to a null-terminated string that specifies a file name or a full path and file name for the file that contains driver data (for example, C:\\DRIVERS\\Qms810.ppd).
     */
    pDataFile : PSTR

    /**
     * Pointer to a null-terminated string that specifies a file name or a full path and file name for the device driver's configuration dynamic-link library (for example, C:\\DRIVERS\\Pscrptui.dll).
     */
    pConfigFile : PSTR

    /**
     * Driver attributes, like UMPD/KMPD.
     */
    dwDriverAttributes : UInt32

    /**
     * Number of times the configuration file for this driver has been upgraded or downgraded since the last spooler restart.
     */
    dwConfigVersion : UInt32

    /**
     * Number of times the driver file for this driver has been upgraded or downgraded since the last spooler restart.
     */
    dwDriverVersion : UInt32

}
