#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_STRING.ahk" { WS_XML_STRING }

/**
 * Provides serialization information about a single value that is part of an enumeration (WS_ENUM_DESCRIPTION).
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_enum_value
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_ENUM_VALUE {
    #StructPack 8

    /**
     * The numeric enum value.
     */
    value : Int32

    /**
     * The serialized form of the value.
     */
    name : WS_XML_STRING.Ptr

}
