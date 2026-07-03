#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Is used by the NCryptStreamOpenToProtect and NCryptStreamOpenToUnprotect functions to pass blocks of processed data to your application.
 * @see https://learn.microsoft.com/windows/win32/api/ncryptprotect/ns-ncryptprotect-ncrypt_protect_stream_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCRYPT_PROTECT_STREAM_INFO {
    #StructPack 8

    /**
     * Address of a callback function that accepts data from the stream encryption or decryption process. for more information, see <a href="https://docs.microsoft.com/windows/desktop/api/ncryptprotect/nc-ncryptprotect-pfncryptstreamoutputcallback">PFNCryptStreamOutputCallback</a>.
     */
    pfnStreamOutput : IntPtr

    /**
     * Pointer to a buffer supplied the caller. The buffer is not modified by the data protection API. You can use the buffer to keep track of your application.
     */
    pvCallbackCtxt : IntPtr

}
