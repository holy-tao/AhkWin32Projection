#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset Unicode
 */
class DRIVER_INFO_4W extends Win32Struct
{
    static sizeof => 88

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
}
