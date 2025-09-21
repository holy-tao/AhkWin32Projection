#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Mapi
 * @version v4.0.30319
 */
class Mapi {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_OLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_OLE_STATIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_ORIG => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_TO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_CC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_BCC => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_UNREAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_RECEIPT_REQUESTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_SENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_LOGON_UI => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_PASSWORD_UI => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_NEW_SESSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_FORCE_DOWNLOAD => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_EXTENDED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_DIALOG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_FORCE_UNICODE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_UNREAD_ONLY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_GUARANTEE_FIFO => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_LONG_MSGID => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_PEEK => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_SUPPRESS_ATTACH => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_ENVELOPE_ONLY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_BODY_AS_FILE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_AB_NOMODIFY => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SUCCESS_SUCCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_USER_ABORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_E_USER_ABORT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_E_FAILURE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_E_LOGON_FAILURE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_E_LOGIN_FAILURE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_E_DISK_FULL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_E_INSUFFICIENT_MEMORY => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_E_ACCESS_DENIED => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_E_TOO_MANY_SESSIONS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_E_TOO_MANY_FILES => 9

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_E_TOO_MANY_RECIPIENTS => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_E_ATTACHMENT_NOT_FOUND => 11

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_E_ATTACHMENT_OPEN_FAILURE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_E_ATTACHMENT_WRITE_FAILURE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_E_UNKNOWN_RECIPIENT => 14

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_E_BAD_RECIPTYPE => 15

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_E_NO_MESSAGES => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_E_INVALID_MESSAGE => 17

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_E_TEXT_TOO_LARGE => 18

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_E_INVALID_SESSION => 19

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_E_TYPE_NOT_SUPPORTED => 20

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_E_AMBIGUOUS_RECIPIENT => 21

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_E_AMBIG_RECIP => 21

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_E_MESSAGE_IN_USE => 22

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_E_NETWORK_FAILURE => 23

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_E_INVALID_EDITFIELDS => 24

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_E_INVALID_RECIPS => 25

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_E_NOT_SUPPORTED => 26

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_E_UNICODE_NOT_SUPPORTED => 27

    /**
     * @type {Integer (UInt32)}
     */
    static MAPI_E_ATTACHMENT_TOO_LARGE => 28
;@endregion Constants

;@region Methods
    /**
     * Describes the MAPIFreeBuffer function and provides syntax, parameters, return value, and additional remarks.
     * @remarks
     * Usually, when a client application or service provider calls [MAPIAllocateBuffer](mapiallocatebuffer.md) or [MAPIAllocateMore](mapiallocatemore.md), the operating system constructs in one contiguous memory buffer one or more complex structures with multiple levels of pointers. When a MAPI function or method creates a buffer with such contents, a client can later free all the structures contained in the buffer by passing to **MAPIFreeBuffer** the pointer to the buffer returned by the MAPI function that created the buffer. For a service provider to free a memory buffer using **MAPIFreeBuffer**, it must pass the pointer to that buffer returned with the provider's support object. 
     *   
     * The call to **MAPIFreeBuffer** to free a particular buffer must be made as soon as a client or provider is finished using this buffer. Simply calling the [IMAPISession::Logoff](imapisession-logoff.md) method at the end of a MAPI session does not automatically release memory buffers. 
     *   
     * A client or service provider should operate on the assumption that the pointer passed in  _lpBuffer_ is invalid after a successful return from **MAPIFreeBuffer**. If the pointer indicates either a memory block not allocated by the messaging system through **MAPIAllocateBuffer** or **MAPIAllocateMore** or a free memory block, the behavior of **MAPIFreeBuffer** is undefined. 
     *   
     * > [!NOTE]
     * > Passing a null pointer to **MAPIFreeBuffer** makes application cleanup code simpler and smaller because **MAPIFreeBuffer** can initialize pointers to NULL and then free them in the cleanup code without having to test them first.
     * @param {Pointer<Void>} pv 
     * @returns {Integer} S_OK 
     *   
     * > The call succeeded and freed the memory requested. **MAPIFreeBuffer** can also return S_OK on already freed locations or if memory block is not allocated with **MAPIAllocateBuffer** and **MAPIAllocateMore**.
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/mapifreebuffer
     */
    static MAPIFreeBuffer(pv) {
        result := DllCall("MAPI32.dll\MAPIFreeBuffer", "ptr", pv, "uint")
        return result
    }

;@endregion Methods
}
