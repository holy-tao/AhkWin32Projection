#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_SECURITY_ALGORITHM_PROPERTY_ID.ahk" { WS_SECURITY_ALGORITHM_PROPERTY_ID }

/**
 * Specifies a cryptographic algorithm setting.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_algorithm_property
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SECURITY_ALGORITHM_PROPERTY {
    #StructPack 8

    /**
     * Identifies the <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_move_to">WS_SECURITY_ALGORITHM_PROPERTY_ID</a>.
     */
    id : WS_SECURITY_ALGORITHM_PROPERTY_ID

    /**
     * A pointer to the value to set.
     *                 The pointer must have an alignment compatible with the type
     *                 of the property.
     */
    value : IntPtr

    /**
     * The size in bytes of the memory pointed to by value.
     */
    valueSize : UInt32

}
