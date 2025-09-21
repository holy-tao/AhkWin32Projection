#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HTTP_SERVICE_BINDING_BASE.ahk

/**
 * HTTP_SERVICE_BINDING_A.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_service_binding_a
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 * @charset ANSI
 */
class HTTP_SERVICE_BINDING_A extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_binding_base">HTTP_SERVICE_BINDING_BASE</a> value,  the <b>Type</b> member of which must be set to <b>HttpServiceBindingTypeA</b>.
     * @type {HTTP_SERVICE_BINDING_BASE}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := HTTP_SERVICE_BINDING_BASE(this.ptr + 0)
            return this.__Base
        }
    }

    /**
     * A pointer to a buffer that represents the SPN.
     * @type {Pointer<Byte>}
     */
    Buffer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The length, in bytes, of the string in <b>Buffer</b>.
     * @type {Integer}
     */
    BufferSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
