#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit


/**
 * @namespace Windows.Win32.System.Mapi
 */

;@region Functions
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
export MAPIFreeBuffer(pv) {
    pvMarshal := pv is VarRef ? "ptr" : "ptr"

    result := DllCall("MAPI32.dll\MAPIFreeBuffer", pvMarshal, pv, UInt32)
    return result
}

;@endregion Functions
