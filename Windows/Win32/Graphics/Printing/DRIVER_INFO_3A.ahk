#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The DRIVER\_INFO\_3 structure contains printer driver information.
 * @see https://learn.microsoft.com/windows/win32/printdocs/driver-info-3
 * @namespace Windows.Win32.Graphics.Printing
 * @charset ANSI
 */
export default struct DRIVER_INFO_3A {
    #StructPack 8

    /**
     * The operating system version for which the driver was written. The supported values are 3 and 4, which represent the V3 and V4 drivers, respectively.
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
     * A pointer to a null-terminated string that specifies a file name or full path and file name for the file that contains the device driver (for example, "C:\\DRIVERS\\Pscript.dll").
     */
    pDriverPath : PSTR

    /**
     * A pointer to a null-terminated string that specifies a file name or a full path and file name for the file that contains driver data (for example, "C:\\DRIVERS\\Qms810.ppd").
     */
    pDataFile : PSTR

    /**
     * A pointer to a null-terminated string that specifies a file name or a full path and file name for the device driver's configuration dynamic-link library (for example, "C:\\DRIVERS\\Pscrptui.dll").
     */
    pConfigFile : PSTR

    /**
     * A pointer to a null-terminated string that specifies a file name or a full path and file name for the device driver's help file.
     */
    pHelpFile : PSTR

    /**
     * A pointer to a MultiSZ buffer that contains a sequence of null-terminated strings. Each null-terminated string in the buffer contains the name of a file the driver depends on. The sequence of strings is terminated by an empty, zero-length string. If **pDependentFiles** is not **NULL** and does not contain any file names, it will point to a buffer that contains two empty strings.
     */
    pDependentFiles : PSTR

    /**
     * A pointer to a null-terminated string that specifies a language monitor (for example, "PJL monitor"). This member can be **NULL** and should be specified only for printers capable of bidirectional communication.
     */
    pMonitorName : PSTR

    /**
     * A pointer to a null-terminated string that specifies the default data type of the print job (for example, "EMF").
     */
    pDefaultDataType : PSTR

}
