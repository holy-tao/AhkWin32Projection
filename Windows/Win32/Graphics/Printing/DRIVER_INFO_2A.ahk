#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The DRIVER\_INFO\_2 structure identifies a printer driver, the driver version number, the environment for which the driver was written, the name of the file in which the driver is stored, and so on.
 * @see https://learn.microsoft.com/windows/win32/printdocs/driver-info-2
 * @namespace Windows.Win32.Graphics.Printing
 * @charset ANSI
 */
export default struct DRIVER_INFO_2A {
    #StructPack 8

    /**
     * The operating system version for which the driver was written. The supported value is 3.
     */
    cVersion : UInt32

    /**
     * A pointer to a null-terminated string that specifies the name of the driver (for example, "QMS 810").
     */
    pName : PSTR

    /**
     * A pointer to a null-terminated string that specifies the environment for which the driver was written (for example, Windows x86, Windows IA64, and Windows x64).
     */
    pEnvironment : PSTR

    /**
     * A pointer to null-terminated string that specifies a file name or full path and file name for the file that contains the device driver (for example, "c:\\drivers\\pscript.dll").
     */
    pDriverPath : PSTR

    /**
     * A pointer to a null-terminated string that specifies a file name or a full path and file name for the file that contains driver data (for example, "c:\\drivers\\Qms810.ppd").
     */
    pDataFile : PSTR

    /**
     * A pointer to a null-terminated string that specifies a file name or a full path and file name for the device-driver's configuration .dll (for example, "c:\\drivers\\Pscrptui.dll").
     */
    pConfigFile : PSTR

}
