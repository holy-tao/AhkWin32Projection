#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * The DRIVER\_INFO\_5 structure contains printer driver information.
 * @see https://learn.microsoft.com/windows/win32/printdocs/driver-info-5
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset ANSI
 */
class DRIVER_INFO_5A extends Win32Struct
{
    static sizeof => 64

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
     * Pointer to a null-terminated string that specifies the environment for which the driver was written (for example, Windows x86, Windows IA64, and Windows x64).
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
     * Driver attributes, like UMPD/KMPD.
     * @type {Integer}
     */
    dwDriverAttributes {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Number of times the configuration file for this driver has been upgraded or downgraded since the last spooler restart.
     * @type {Integer}
     */
    dwConfigVersion {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Number of times the driver file for this driver has been upgraded or downgraded since the last spooler restart.
     * @type {Integer}
     */
    dwDriverVersion {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
