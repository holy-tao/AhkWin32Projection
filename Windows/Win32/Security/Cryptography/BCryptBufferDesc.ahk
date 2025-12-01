#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes how the BCryptBufferDesc structure contains a set of generic Cryptography API: Next Generation (CNG) buffers.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-bcryptbufferdesc
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class BCryptBufferDesc extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The version of the structure. This must be the following value.
     * 
     * | Value | Meaning |
     * | ----- | ------- |
     * | BCRYPTBUFFER_VERSION | The default version number. |
     * @type {Integer}
     */
    ulVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of elements in the *pBuffers* array.
     * @type {Integer}
     */
    cBuffers {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The address of an array of **BCryptBuffer** structures that contain the buffers. *cBuffers* contains the number of elements in this array.
     * @type {Pointer<BCryptBuffer>}
     */
    pBuffers {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
