#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_XML_STRING.ahk
#Include .\WS_XML_QNAME.ahk

/**
 * Represents a fault code.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_fault_code
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_FAULT_CODE extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * The local name and namespace URI that identify the fault code.
     * @type {WS_XML_QNAME}
     */
    value{
        get {
            if(!this.HasProp("__value"))
                this.__value := WS_XML_QNAME(this.ptr + 0)
            return this.__value
        }
    }

    /**
     * Pointer to the next fault code in the list.
     * @type {Pointer<WS_FAULT_CODE>}
     */
    subCode {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
