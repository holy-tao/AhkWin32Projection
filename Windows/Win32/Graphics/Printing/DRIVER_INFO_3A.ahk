#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * The DRIVER\_INFO\_3 structure contains printer driver information.
 * @see https://learn.microsoft.com/windows/win32/printdocs/driver-info-3
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset ANSI
 */
class DRIVER_INFO_3A extends Win32Struct
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
     * A pointer to a null-terminated string that specifies the environment for which the driver was written (for example, Windows x86, Windows IA64, and Windows x64).
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
     * A pointer to a null-terminated string that specifies a file name or full path and file name for the file that contains the device driver (for example, "C:\\DRIVERS\\Pscript.dll").
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
     * A pointer to a null-terminated string that specifies a file name or a full path and file name for the file that contains driver data (for example, "C:\\DRIVERS\\Qms810.ppd").
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
     * A pointer to a null-terminated string that specifies a file name or a full path and file name for the device driver's configuration dynamic-link library (for example, "C:\\DRIVERS\\Pscrptui.dll").
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
     * A pointer to a null-terminated string that specifies a file name or a full path and file name for the device driver's help file.
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
}
