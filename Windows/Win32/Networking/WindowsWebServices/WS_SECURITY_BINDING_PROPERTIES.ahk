#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_SECURITY_BINDING_PROPERTY.ahk" { WS_SECURITY_BINDING_PROPERTY }

/**
 * Specifies an array of security binding settings.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_binding_properties
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SECURITY_BINDING_PROPERTIES {
    #StructPack 8

    /**
     * An array of properties.  The number of elements in the array is specified
     *           using the propertyCount parameter.  This field may be <b>NULL</b> if the propertyCount
     *           is 0.
     */
    properties : WS_SECURITY_BINDING_PROPERTY.Ptr

    /**
     * The number of elements in the properties array.
     */
    propertyCount : UInt32

}
