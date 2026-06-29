#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_HEAP_PROPERTY.ahk" { WS_HEAP_PROPERTY }

/**
 * A structure that is used to specify a set of WS_HEAP_PROPERTYs.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_heap_properties
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_HEAP_PROPERTIES {
    #StructPack 8

    /**
     * An array of properties.  The number of elements in the array is specified
     *                     using the propertyCount parameter.  This field may be <b>NULL</b> if the propertyCount
     *                     is 0.
     */
    properties : WS_HEAP_PROPERTY.Ptr

    /**
     * The number of elements in the properties array.
     */
    propertyCount : UInt32

}
