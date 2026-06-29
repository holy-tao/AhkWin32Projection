#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a custom mapping between a C data type and an XML element.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_custom_type_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_CUSTOM_TYPE_DESCRIPTION {
    #StructPack 8

    /**
     * The size of the custom type, in bytes.
     */
    size : UInt32

    /**
     * The alignment requirement of the custom type.  This must be a
     *                     power of two between 1 and 8.
     */
    alignment : UInt32

    /**
     * A pointer to a callback which is invoked to read the type.
     */
    readCallback : IntPtr

    /**
     * A pointer to a callback which is invoked to write the type.
     */
    writeCallback : IntPtr

    /**
     * This can be used to point to additional user-defined data
     *                     specific to the type.  It is optional and may be <b>NULL</b>.
     *                 
     * 
     * The pointer to this data is passed
     *                     to the <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_read_type_callback">WS_READ_TYPE_CALLBACK</a> and the
     *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nc-webservices-ws_write_type_callback">WS_WRITE_TYPE_CALLBACK</a>.  This allows the
     *                     callback to access information that is specific to this
     *                     particular usage of the callback.
     */
    descriptionData : IntPtr

    isDefaultValueCallback : IntPtr

}
