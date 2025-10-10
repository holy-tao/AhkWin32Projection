#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a WS-Eventing Unsubscribe request message.
 * @see https://docs.microsoft.com/windows/win32/api//wsdtypes/ns-wsdtypes-requestbody_unsubscribe
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class REQUESTBODY_Unsubscribe extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that specifies extension content allowed by the XML <b>ANY</b> keyword.
     * @type {Pointer<WSDXML_ELEMENT>}
     */
    any {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
