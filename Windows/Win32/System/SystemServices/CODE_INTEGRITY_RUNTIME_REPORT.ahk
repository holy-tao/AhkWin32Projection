#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RUNTIME_REPORT_HEADER.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class CODE_INTEGRITY_RUNTIME_REPORT extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {RUNTIME_REPORT_HEADER}
     */
    Header {
        get {
            if(!this.HasProp("__Header"))
                this.__Header := RUNTIME_REPORT_HEADER(0, this)
            return this.__Header
        }
    }

    /**
     * @type {Integer}
     */
    CurrentGeneration {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    NumberOfGenerations {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
