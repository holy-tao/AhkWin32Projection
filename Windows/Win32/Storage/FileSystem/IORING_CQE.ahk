#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a completed I/O ring queue entry.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/ioringapi/ns-ioringapi-ioring_cqe
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class IORING_CQE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A **UINT_PTR** representing the user data associated with the entry. This is the same value provided as the *UserData* parameter when building the operation's submission queue entry. Applications can use this value to correlate the completion with the original operation request.
     * @type {Pointer}
     */
    UserData {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A **HRESULT** indicating the result code of the associated I/O ring operation.
     * @type {Integer}
     */
    ResultCode {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A **ULONG_PTR** representing information about the completed queue operation.
     * @type {Pointer}
     */
    Information {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
