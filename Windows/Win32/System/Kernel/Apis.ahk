#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Kernel
 * @version v4.0.30319
 */
class Kernel {

;@region Constants

    /**
     * @type {Integer (Int32)}
     */
    static OBJ_HANDLE_TAGBITS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_BALANCED_NODE_RESERVED_PARENT_MASK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static NULL64 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MAXUCHAR => 255

    /**
     * @type {Integer (UInt32)}
     */
    static MAXUSHORT => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static MAXULONG => 4294967295
;@endregion Constants

;@region Methods
    /**
     * Initializes the head of a singly linked list. (RtlInitializeSListHead)
     * @remarks
     * Calls to the <a href="https://docs.microsoft.com/windows/desktop/api/interlockedapi/nf-interlockedapi-initializeslisthead">InitializeSListHead</a> function are forwarded to the <b>RtlInitializeSListHead</b> function. Applications should call <b>InitializeSListHead</b> instead of calling this function directly.
     * @param {Pointer<SLIST_HEADER>} ListHead A pointer to an <b>SLIST_HEADER</b> structure that represents the head of a singly linked list. This structure is for system use only.
     * @returns {Pointer} This function does not return a value.
     * @see https://learn.microsoft.com/windows/win32/api/winnt/nf-winnt-rtlinitializeslisthead
     * @since windows5.1.2600
     */
    static RtlInitializeSListHead(ListHead) {
        result := DllCall("ntdll.dll\RtlInitializeSListHead", "ptr", ListHead)
        return result
    }

    /**
     * Retrieves the first entry in a singly linked list. Access to the list is synchronized on a multiprocessor system.
     * @param {Pointer<SLIST_HEADER>} ListHead A pointer to an <b>SLIST_HEADER</b> structure that represents the head of a singly linked list. This structure is for system use only. 
     * 
     * The list must  be previously initialized with the <a href="https://docs.microsoft.com/windows/desktop/api/interlockedapi/nf-interlockedapi-initializeslisthead">InitializeSListHead</a> function.
     * @returns {Pointer<TypeHandle>} The return value is a pointer to the first entry in the list. If the list is empty, the return value is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winnt/nf-winnt-rtlfirstentryslist
     * @since windows5.1.2600
     */
    static RtlFirstEntrySList(ListHead) {
        result := DllCall("ntdll.dll\RtlFirstEntrySList", "ptr", ListHead, "ptr")
        return result
    }

    /**
     * Removes an item from the front of a singly linked list. Access to the list is synchronized on a multiprocessor system. (RtlInterlockedPopEntrySList)
     * @remarks
     * Calls to the <a href="https://docs.microsoft.com/windows/desktop/api/interlockedapi/nf-interlockedapi-interlockedpopentryslist">InterlockedPopEntrySList</a> function are forwarded to the <b>RtlInterlockedPopEntrySList</b> function. Applications should call <b>InterlockedPopEntrySList</b> instead of calling this function directly.
     * @param {Pointer<SLIST_HEADER>} ListHead A pointer to an <b>SLIST_HEADER</b> structure that represents the head of a singly linked list.
     * @returns {Pointer<TypeHandle>} The return value is a pointer to the item removed from the list. If the list is empty, the return value is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winnt/nf-winnt-rtlinterlockedpopentryslist
     * @since windows5.1.2600
     */
    static RtlInterlockedPopEntrySList(ListHead) {
        result := DllCall("ntdll.dll\RtlInterlockedPopEntrySList", "ptr", ListHead, "ptr")
        return result
    }

    /**
     * Inserts an item at the front of a singly linked list. Access to the list is synchronized on a multiprocessor system. (RtlInterlockedPushEntrySList)
     * @remarks
     * Calls to the <a href="https://docs.microsoft.com/windows/desktop/api/interlockedapi/nf-interlockedapi-interlockedpushentryslist">InterlockedPushEntrySList</a> function are forwarded to the <b>RtlInterlockedPushEntrySList</b> function. Applications should call <b>InterlockedPushEntrySList</b> instead of calling this function directly.
     * @param {Pointer<SLIST_HEADER>} ListHead A pointer to an <b>SLIST_HEADER</b> structure that represents the head of a singly linked list.
     * @param {Pointer<TypeHandle>} ListEntry A pointer to an 
     * [SLIST_ENTRY](./ns-winnt-slist_entry.md) structure that represents an item in a singly linked list.
     * @returns {Pointer<TypeHandle>} The return value is the previous first item in the list. If the list was previously empty, the return value is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winnt/nf-winnt-rtlinterlockedpushentryslist
     * @since windows5.1.2600
     */
    static RtlInterlockedPushEntrySList(ListHead, ListEntry) {
        result := DllCall("ntdll.dll\RtlInterlockedPushEntrySList", "ptr", ListHead, "ptr", ListEntry, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<SLIST_HEADER>} ListHead 
     * @param {Pointer<TypeHandle>} List 
     * @param {Pointer<TypeHandle>} ListEnd 
     * @param {Integer} Count 
     * @returns {Pointer<TypeHandle>} 
     */
    static RtlInterlockedPushListSListEx(ListHead, List, ListEnd, Count) {
        result := DllCall("ntdll.dll\RtlInterlockedPushListSListEx", "ptr", ListHead, "ptr", List, "ptr", ListEnd, "uint", Count, "ptr")
        return result
    }

    /**
     * Removes all items from a singly linked list. Access to the list is synchronized on a multiprocessor system. (RtlInterlockedFlushSList)
     * @remarks
     * Calls to the <a href="https://docs.microsoft.com/windows/desktop/api/interlockedapi/nf-interlockedapi-interlockedflushslist">InterlockedFlushSList</a> function are forwarded to the <b>RtlInterlockedFlushSList</b> function. Applications should call <b>InterlockedFlushSList</b> instead of calling this function directly.
     * @param {Pointer<SLIST_HEADER>} ListHead A pointer to an <b>SLIST_HEADER</b> structure that represents the head of the singly linked list. This structure is for system use only.
     * @returns {Pointer<TypeHandle>} The return value is a pointer to the items removed from the list. If the list is empty, the return value is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winnt/nf-winnt-rtlinterlockedflushslist
     * @since windows5.1.2600
     */
    static RtlInterlockedFlushSList(ListHead) {
        result := DllCall("ntdll.dll\RtlInterlockedFlushSList", "ptr", ListHead, "ptr")
        return result
    }

    /**
     * Retrieves the number of entries in the specified singly linked list. (RtlQueryDepthSList)
     * @remarks
     * Calls to the <a href="https://docs.microsoft.com/windows/desktop/api/interlockedapi/nf-interlockedapi-querydepthslist">QueryDepthSList</a> function are forwarded to the <b>RtlQueryDepthSList</b> function. Applications should call <b>QueryDepthSList</b> instead of calling this function directly.
     * @param {Pointer<SLIST_HEADER>} ListHead A pointer to an <b>SLIST_HEADER</b> structure that represents the head of a singly linked list. This structure is for system use only. 
     * 
     * The list must  be previously initialized with the <a href="https://docs.microsoft.com/windows/desktop/api/interlockedapi/nf-interlockedapi-initializeslisthead">InitializeSListHead</a> function.
     * @returns {Integer} The function returns the number of entries in the list.
     * @see https://learn.microsoft.com/windows/win32/api/winnt/nf-winnt-rtlquerydepthslist
     * @since windows5.1.2600
     */
    static RtlQueryDepthSList(ListHead) {
        result := DllCall("ntdll.dll\RtlQueryDepthSList", "ptr", ListHead, "ushort")
        return result
    }

;@endregion Methods
}
