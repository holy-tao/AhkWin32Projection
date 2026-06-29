#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSD_HEADER_RELATESTO.ahk" { WSD_HEADER_RELATESTO }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WSDXML_ELEMENT.ahk" { WSDXML_ELEMENT }
#Import ".\WSDXML_NAME.ahk" { WSDXML_NAME }
#Import ".\WSD_APP_SEQUENCE.ahk" { WSD_APP_SEQUENCE }
#Import ".\WSD_ENDPOINT_REFERENCE.ahk" { WSD_ENDPOINT_REFERENCE }

/**
 * Provides SOAP header data for the WSD_SOAP_MESSAGE structure.
 * @see https://learn.microsoft.com/windows/win32/api/wsdtypes/ns-wsdtypes-wsd_soap_header
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_SOAP_HEADER {
    #StructPack 8

    /**
     * The URI to which the SOAP message is addressed.
     */
    To : PWSTR

    /**
     * The action encoded by the SOAP message.
     */
    Action : PWSTR

    /**
     * An identifier that distinguishes the message from others from the same sender.
     */
    MessageID : PWSTR

    /**
     * In response messages, specifies the message ID of the matching request message.
     */
    RelatesTo : WSD_HEADER_RELATESTO

    /**
     * In request messages, a reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_endpoint_reference">WSD_ENDPOINT_REFERENCE</a> structure that specifies to the endpoint to which responses should be sent.
     */
    ReplyTo : WSD_ENDPOINT_REFERENCE.Ptr

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_endpoint_reference">WSD_ENDPOINT_REFERENCE</a> structure that specifies the endpoint from which the SOAP message was sent.
     */
    From : WSD_ENDPOINT_REFERENCE.Ptr

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_endpoint_reference">WSD_ENDPOINT_REFERENCE</a> structure that specifies to the endpoint to which fault messages should be sent.
     */
    FaultTo : WSD_ENDPOINT_REFERENCE.Ptr

    /**
     * In discovery messages, a reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdtypes/ns-wsdtypes-wsd_app_sequence">WSD_APP_SEQUENCE</a> structure that helps the recipient determine the order in which messages were issued by the sender.
     */
    AppSequence : WSD_APP_SEQUENCE.Ptr

    /**
     * Reference to a <a href="https://docs.microsoft.com/windows/desktop/api/wsdxmldom/ns-wsdxmldom-wsdxml_element">WSDXML_ELEMENT</a> structure that specifies additional headers not encoded by the other members.
     */
    AnyHeaders : WSDXML_ELEMENT.Ptr

}
