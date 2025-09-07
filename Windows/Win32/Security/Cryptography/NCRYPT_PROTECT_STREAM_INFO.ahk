#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Is used by the NCryptStreamOpenToProtect and NCryptStreamOpenToUnprotect functions to pass blocks of processed data to your application.
 * @see https://learn.microsoft.com/windows/win32/api/ncryptprotect/ns-ncryptprotect-ncrypt_protect_stream_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class NCRYPT_PROTECT_STREAM_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Address of a callback function that accepts data from the stream encryption or decryption process. for more information, see <a href="https://docs.microsoft.com/windows/desktop/api/ncryptprotect/nc-ncryptprotect-pfncryptstreamoutputcallback">PFNCryptStreamOutputCallback</a>.
     * @type {Pointer<Ptr>}
     */
    pfnStreamOutput {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a buffer supplied the caller. The buffer is not modified by the data protection API. You can use the buffer to keep track of your application.
     * @type {Pointer<Void>}
     */
    pvCallbackCtxt {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
