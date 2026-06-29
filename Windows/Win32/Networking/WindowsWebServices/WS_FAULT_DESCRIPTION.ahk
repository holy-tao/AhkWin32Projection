#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_ENVELOPE_VERSION.ahk" { WS_ENVELOPE_VERSION }

/**
 * Information about a mapping between a WS_FAULT and an XML element.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_fault_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_FAULT_DESCRIPTION {
    #StructPack 4

    /**
     * The SOAP version to use when serializing the fault.
     */
    envelopeVersion : WS_ENVELOPE_VERSION

}
