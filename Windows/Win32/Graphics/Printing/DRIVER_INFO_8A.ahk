#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset ANSI
 */
class DRIVER_INFO_8A extends Win32Struct
{
    static sizeof => 200

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
    pName{
        get {
            if(!this.HasProp("__pName"))
                this.__pName := PSTR(this.ptr + 8)
            return this.__pName
        }
    }

    /**
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
     * @type {Integer}
     */
    dwlDriverVersion {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
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
     * @type {PSTR}
     */
    pszProvider{
        get {
            if(!this.HasProp("__pszProvider"))
                this.__pszProvider := PSTR(this.ptr + 128)
            return this.__pszProvider
        }
    }

    /**
     * @type {PSTR}
     */
    pszPrintProcessor{
        get {
            if(!this.HasProp("__pszPrintProcessor"))
                this.__pszPrintProcessor := PSTR(this.ptr + 136)
            return this.__pszPrintProcessor
        }
    }

    /**
     * @type {PSTR}
     */
    pszVendorSetup{
        get {
            if(!this.HasProp("__pszVendorSetup"))
                this.__pszVendorSetup := PSTR(this.ptr + 144)
            return this.__pszVendorSetup
        }
    }

    /**
     * @type {PSTR}
     */
    pszzColorProfiles{
        get {
            if(!this.HasProp("__pszzColorProfiles"))
                this.__pszzColorProfiles := PSTR(this.ptr + 152)
            return this.__pszzColorProfiles
        }
    }

    /**
     * @type {PSTR}
     */
    pszInfPath{
        get {
            if(!this.HasProp("__pszInfPath"))
                this.__pszInfPath := PSTR(this.ptr + 160)
            return this.__pszInfPath
        }
    }

    /**
     * @type {Integer}
     */
    dwPrinterDriverAttributes {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * @type {PSTR}
     */
    pszzCoreDriverDependencies{
        get {
            if(!this.HasProp("__pszzCoreDriverDependencies"))
                this.__pszzCoreDriverDependencies := PSTR(this.ptr + 176)
            return this.__pszzCoreDriverDependencies
        }
    }

    /**
     * @type {FILETIME}
     */
    ftMinInboxDriverVerDate{
        get {
            if(!this.HasProp("__ftMinInboxDriverVerDate"))
                this.__ftMinInboxDriverVerDate := FILETIME(this.ptr + 184)
            return this.__ftMinInboxDriverVerDate
        }
    }

    /**
     * @type {Integer}
     */
    dwlMinInboxDriverVerVersion {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }
}
