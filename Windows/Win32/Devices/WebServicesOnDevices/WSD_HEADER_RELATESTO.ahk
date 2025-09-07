#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Represents a RelatesTo SOAP envelope header block, as specified by the WS-Addressing specification.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_header_relatesto
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_HEADER_RELATESTO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_name">WSDXML_NAME</a> structure that contains the relationship type as a qualified name.
     * @type {Pointer<WSDXML_NAME>}
     */
    RelationshipType {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The identifier of the related message.
     * @type {PWSTR}
     */
    MessageID{
        get {
            if(!this.HasProp("__MessageID"))
                this.__MessageID := PWSTR(this.ptr + 8)
            return this.__MessageID
        }
    }
}
