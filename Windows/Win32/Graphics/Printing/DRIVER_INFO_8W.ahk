#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset Unicode
 */
class DRIVER_INFO_8W extends Win32Struct
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
     * @type {PWSTR}
     */
    pDefaultDataType{
        get {
            if(!this.HasProp("__pDefaultDataType"))
                this.__pDefaultDataType := PWSTR(this.ptr + 72)
            return this.__pDefaultDataType
        }
    }

    /**
     * @type {PWSTR}
     */
    pszzPreviousNames{
        get {
            if(!this.HasProp("__pszzPreviousNames"))
                this.__pszzPreviousNames := PWSTR(this.ptr + 80)
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
     * @type {PWSTR}
     */
    pszMfgName{
        get {
            if(!this.HasProp("__pszMfgName"))
                this.__pszMfgName := PWSTR(this.ptr + 104)
            return this.__pszMfgName
        }
    }

    /**
     * @type {PWSTR}
     */
    pszOEMUrl{
        get {
            if(!this.HasProp("__pszOEMUrl"))
                this.__pszOEMUrl := PWSTR(this.ptr + 112)
            return this.__pszOEMUrl
        }
    }

    /**
     * @type {PWSTR}
     */
    pszHardwareID{
        get {
            if(!this.HasProp("__pszHardwareID"))
                this.__pszHardwareID := PWSTR(this.ptr + 120)
            return this.__pszHardwareID
        }
    }

    /**
     * @type {PWSTR}
     */
    pszProvider{
        get {
            if(!this.HasProp("__pszProvider"))
                this.__pszProvider := PWSTR(this.ptr + 128)
            return this.__pszProvider
        }
    }

    /**
     * @type {PWSTR}
     */
    pszPrintProcessor{
        get {
            if(!this.HasProp("__pszPrintProcessor"))
                this.__pszPrintProcessor := PWSTR(this.ptr + 136)
            return this.__pszPrintProcessor
        }
    }

    /**
     * @type {PWSTR}
     */
    pszVendorSetup{
        get {
            if(!this.HasProp("__pszVendorSetup"))
                this.__pszVendorSetup := PWSTR(this.ptr + 144)
            return this.__pszVendorSetup
        }
    }

    /**
     * @type {PWSTR}
     */
    pszzColorProfiles{
        get {
            if(!this.HasProp("__pszzColorProfiles"))
                this.__pszzColorProfiles := PWSTR(this.ptr + 152)
            return this.__pszzColorProfiles
        }
    }

    /**
     * @type {PWSTR}
     */
    pszInfPath{
        get {
            if(!this.HasProp("__pszInfPath"))
                this.__pszInfPath := PWSTR(this.ptr + 160)
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
     * @type {PWSTR}
     */
    pszzCoreDriverDependencies{
        get {
            if(!this.HasProp("__pszzCoreDriverDependencies"))
                this.__pszzCoreDriverDependencies := PWSTR(this.ptr + 176)
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
