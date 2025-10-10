#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The SecBufferDesc structure describes an array of SecBuffer structures to pass from a transport application to a security package.
 * @see https://docs.microsoft.com/windows/win32/api//sspi/ns-sspi-secbufferdesc
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecBufferDesc extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the version number of this structure. This member must be SECBUFFER_VERSION.
     * @type {Integer}
     */
    ulVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Indicates the number of <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structures in the <b>pBuffers</b> array.
     * @type {Integer}
     */
    cBuffers {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/sspi/ns-sspi-secbuffer">SecBuffer</a> structures.
     * @type {Pointer<SecBuffer>}
     */
    pBuffers {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
