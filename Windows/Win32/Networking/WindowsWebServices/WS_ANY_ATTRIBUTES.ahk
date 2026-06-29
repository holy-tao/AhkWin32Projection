#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_ANY_ATTRIBUTE.ahk" { WS_ANY_ATTRIBUTE }

/**
 * This type is used to store a set of attributes that have not been directly mapped to field of a structure.
 * @remarks
 * This structure is typically used to preserve unknown attributes
 *                 when deserializing a structure.
 *                 See <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_field_mapping">WS_ANY_ATTRIBUTES_FIELD_MAPPING</a> and <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_type">WS_ANY_ATTRIBUTES_TYPE</a> for more
 *                 information.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_any_attributes
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_ANY_ATTRIBUTES {
    #StructPack 8

    /**
     * An array of attributes.  This field may
     *                     be <b>NULL</b> if attributeCount is zero.
     */
    attributes : WS_ANY_ATTRIBUTE.Ptr

    /**
     * The number of attributes in the array.
     */
    attributeCount : UInt32

}
