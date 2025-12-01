#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WSD_HEADER_RELATESTO.ahk
#Include .\WSD_SOAP_HEADER.ahk

/**
 * The contents of a WSD SOAP message.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_soap_message
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_SOAP_MESSAGE extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_soap_header">WSD_SOAP_HEADER</a> structure that specifies the header of the SOAP message.
     * @type {WSD_SOAP_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := WSD_SOAP_HEADER(0, this)
            return this.__Header
        }
    }

    /**
     * The body of the SOAP message.
     * @type {Pointer<Void>}
     */
    Body {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_type">WSDXML_TYPE</a> structure that specifies the type of the SOAP message body.
     * @type {Pointer<WSDXML_TYPE>}
     */
    BodyType {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }
}
