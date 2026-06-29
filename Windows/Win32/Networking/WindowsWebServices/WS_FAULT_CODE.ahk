#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_STRING.ahk" { WS_XML_STRING }
#Import ".\WS_XML_DICTIONARY.ahk" { WS_XML_DICTIONARY }
#Import ".\WS_XML_QNAME.ahk" { WS_XML_QNAME }

/**
 * Represents a fault code.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_fault_code
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_FAULT_CODE {
    #StructPack 8

    /**
     * The local name and namespace URI that identify the fault code.
     */
    value : WS_XML_QNAME

    /**
     * Pointer to the next fault code in the list.
     */
    subCode : WS_FAULT_CODE.Ptr

}
