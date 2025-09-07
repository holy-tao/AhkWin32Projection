#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The DRIVER\_INFO\_3 structure contains printer driver information.
 * @see https://learn.microsoft.com/windows/win32/printdocs/driver-info-3
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset Unicode
 */
class DRIVER_INFO_3W extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * The operating system version for which the driver was written. The supported values are 3 and 4, which represent the V3 and V4 drivers, respectively.
     * @type {Integer}
     */
    cVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a null-terminated string that specifies the name of the driver (for example, "QMS 810").
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
     * A pointer to a null-terminated string that specifies the environment for which the driver was written (for example, Windows x86, Windows IA64, and Windows x64).
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
     * A pointer to a null-terminated string that specifies a file name or full path and file name for the file that contains the device driver (for example, "C:\\DRIVERS\\Pscript.dll").
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
     * A pointer to a null-terminated string that specifies a file name or a full path and file name for the file that contains driver data (for example, "C:\\DRIVERS\\Qms810.ppd").
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
     * A pointer to a null-terminated string that specifies a file name or a full path and file name for the device driver's configuration dynamic-link library (for example, "C:\\DRIVERS\\Pscrptui.dll").
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
     * A pointer to a null-terminated string that specifies a file name or a full path and file name for the device driver's help file.
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
}
