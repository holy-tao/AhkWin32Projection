#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WSMAN_DATA_TEXT.ahk
#Include .\WSMAN_DATA_BINARY.ahk

/**
 * Contains inbound and outbound data used in the Windows Remote Management (WinRM) API.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_data
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_DATA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Specifies the type of data currently stored in the union.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {WSMAN_DATA_TEXT}
     */
    text{
        get {
            if(!this.HasProp("__text"))
                this.__text := WSMAN_DATA_TEXT(8, this)
            return this.__text
        }
    }

    /**
     * @type {WSMAN_DATA_BINARY}
     */
    binaryData{
        get {
            if(!this.HasProp("__binaryData"))
                this.__binaryData := WSMAN_DATA_BINARY(8, this)
            return this.__binaryData
        }
    }

    /**
     * @type {Integer}
     */
    number {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
