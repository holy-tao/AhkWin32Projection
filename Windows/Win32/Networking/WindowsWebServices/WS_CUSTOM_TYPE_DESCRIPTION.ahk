#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a custom mapping between a C data type and an XML element.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_custom_type_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_CUSTOM_TYPE_DESCRIPTION extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The size of the custom type, in bytes.
     * @type {Integer}
     */
    size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The alignment requirement of the custom type.  This must be a
     *                     power of two between 1 and 8.
     * @type {Integer}
     */
    alignment {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to a callback which is invoked to read the type.
     * @type {Pointer<Ptr>}
     */
    readCallback {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a callback which is invoked to write the type.
     * @type {Pointer<Ptr>}
     */
    writeCallback {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

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
     * @type {Pointer<Void>}
     */
    descriptionData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * 
     * @type {Pointer<Ptr>}
     */
    isDefaultValueCallback {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
