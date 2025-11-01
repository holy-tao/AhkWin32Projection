#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * 
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
     * @type {Integer}
     */
    cVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PSTR}
     */
    pName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {PSTR}
     */
    pEnvironment {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {PSTR}
     */
    pDriverPath {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {PSTR}
     */
    pDataFile {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {PSTR}
     */
    pConfigFile {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {PSTR}
     */
    pHelpFile {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {PSTR}
     */
    pDependentFiles {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {PSTR}
     */
    pMonitorName {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {PSTR}
     */
    pDefaultDataType {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {PSTR}
     */
    pszzPreviousNames {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {FILETIME}
     */
    ftDriverDate{
        get {
            if(!this.HasProp("__ftDriverDate"))
                this.__ftDriverDate := FILETIME(88, this)
            return this.__ftDriverDate
        }
    }

    /**
     * @type {Integer}
     */
    dwlDriverVersion {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {PSTR}
     */
    pszMfgName {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {PSTR}
     */
    pszOEMUrl {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {PSTR}
     */
    pszHardwareID {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {PSTR}
     */
    pszProvider {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }
}
