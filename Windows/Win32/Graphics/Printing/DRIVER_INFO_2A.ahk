#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * The DRIVER\_INFO\_2 structure identifies a printer driver, the driver version number, the environment for which the driver was written, the name of the file in which the driver is stored, and so on.
 * @see https://learn.microsoft.com/windows/win32/printdocs/driver-info-2
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset ANSI
 */
class DRIVER_INFO_2A extends Win32Struct
{
    static sizeof => 48

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
     * A pointer to null-terminated string that specifies a file name or full path and file name for the file that contains the device driver (for example, "c:\\drivers\\pscript.dll").
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
     * A pointer to a null-terminated string that specifies a file name or a full path and file name for the file that contains driver data (for example, "c:\\drivers\\Qms810.ppd").
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
     * A pointer to a null-terminated string that specifies a file name or a full path and file name for the device-driver's configuration .dll (for example, "c:\\drivers\\Pscrptui.dll").
     * @type {PSTR}
     */
    pConfigFile{
        get {
            if(!this.HasProp("__pConfigFile"))
                this.__pConfigFile := PSTR(this.ptr + 40)
            return this.__pConfigFile
        }
    }
}
