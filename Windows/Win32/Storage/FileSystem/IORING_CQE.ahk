#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Represents a completed I/O ring queue entry.
 * @see https://learn.microsoft.com/windows/win32/api/ioringapi/ns-ioringapi-ioring_cqe
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct IORING_CQE {
    #StructPack 8

    /**
     * A **UINT_PTR** representing the user data associated with the entry. This is the same value provided as the *UserData* parameter when building the operation's submission queue entry. Applications can use this value to correlate the completion with the original operation request.
     */
    UserData : IntPtr

    /**
     * A **HRESULT** indicating the result code of the associated I/O ring operation.
     */
    ResultCode : HRESULT

    /**
     * A **ULONG_PTR** representing information about the completed queue operation.
     */
    Information : IntPtr

}
