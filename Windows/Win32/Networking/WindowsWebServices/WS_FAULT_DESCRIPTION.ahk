#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_ENVELOPE_VERSION.ahk

/**
 * Information about a mapping between a WS_FAULT and an XML element.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_fault_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
class WS_FAULT_DESCRIPTION extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * The SOAP version to use when serializing the fault.
     * @type {WS_ENVELOPE_VERSION}
     */
    envelopeVersion {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
