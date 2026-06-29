#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\SLIST_ENTRY.ahk" { SLIST_ENTRY }
#Import ".\SLIST_HEADER.ahk" { SLIST_HEADER }

/**
 * @namespace Windows.Win32.System.Kernel
 */

;@region Functions
/**
 * Initializes the head of a singly linked list. (RtlInitializeSListHead)
 * @remarks
 * Calls to the <a href="https://docs.microsoft.com/windows/desktop/api/interlockedapi/nf-interlockedapi-initializeslisthead">InitializeSListHead</a> function are forwarded to the <b>RtlInitializeSListHead</b> function. Applications should call <b>InitializeSListHead</b> instead of calling this function directly.
 * @param {Pointer<SLIST_HEADER>} ListHead A pointer to an <b>SLIST_HEADER</b> structure that represents the head of a singly linked list. This structure is for system use only.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/winnt/nf-winnt-rtlinitializeslisthead
 * @since windows5.1.2600
 */
export RtlInitializeSListHead(ListHead) {
    DllCall("ntdll.dll\RtlInitializeSListHead", SLIST_HEADER.Ptr, ListHead)
}

/**
 * Retrieves the first entry in a singly linked list. Access to the list is synchronized on a multiprocessor system.
 * @param {Pointer<SLIST_HEADER>} ListHead A pointer to an <b>SLIST_HEADER</b> structure that represents the head of a singly linked list. This structure is for system use only. 
 * 
 * The list must  be previously initialized with the <a href="https://docs.microsoft.com/windows/desktop/api/interlockedapi/nf-interlockedapi-initializeslisthead">InitializeSListHead</a> function.
 * @returns {Pointer<SLIST_ENTRY>} The return value is a pointer to the first entry in the list. If the list is empty, the return value is <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/nf-winnt-rtlfirstentryslist
 * @since windows5.1.2600
 */
export RtlFirstEntrySList(ListHead) {
    result := DllCall("ntdll.dll\RtlFirstEntrySList", SLIST_HEADER.Ptr, ListHead, SLIST_ENTRY.Ptr)
    return result
}

/**
 * Removes an item from the front of a singly linked list. Access to the list is synchronized on a multiprocessor system. (RtlInterlockedPopEntrySList)
 * @remarks
 * Calls to the <a href="https://docs.microsoft.com/windows/desktop/api/interlockedapi/nf-interlockedapi-interlockedpopentryslist">InterlockedPopEntrySList</a> function are forwarded to the <b>RtlInterlockedPopEntrySList</b> function. Applications should call <b>InterlockedPopEntrySList</b> instead of calling this function directly.
 * @param {Pointer<SLIST_HEADER>} ListHead A pointer to an <b>SLIST_HEADER</b> structure that represents the head of a singly linked list.
 * @returns {Pointer<SLIST_ENTRY>} The return value is a pointer to the item removed from the list. If the list is empty, the return value is <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/nf-winnt-rtlinterlockedpopentryslist
 * @since windows5.1.2600
 */
export RtlInterlockedPopEntrySList(ListHead) {
    result := DllCall("ntdll.dll\RtlInterlockedPopEntrySList", SLIST_HEADER.Ptr, ListHead, SLIST_ENTRY.Ptr)
    return result
}

/**
 * Inserts an item at the front of a singly linked list. Access to the list is synchronized on a multiprocessor system. (RtlInterlockedPushEntrySList)
 * @remarks
 * Calls to the <a href="https://docs.microsoft.com/windows/desktop/api/interlockedapi/nf-interlockedapi-interlockedpushentryslist">InterlockedPushEntrySList</a> function are forwarded to the <b>RtlInterlockedPushEntrySList</b> function. Applications should call <b>InterlockedPushEntrySList</b> instead of calling this function directly.
 * @param {Pointer<SLIST_HEADER>} ListHead A pointer to an <b>SLIST_HEADER</b> structure that represents the head of a singly linked list.
 * @param {Pointer<SLIST_ENTRY>} ListEntry A pointer to an 
 * [SLIST_ENTRY](./ns-winnt-slist_entry.md) structure that represents an item in a singly linked list.
 * @returns {Pointer<SLIST_ENTRY>} The return value is the previous first item in the list. If the list was previously empty, the return value is <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/nf-winnt-rtlinterlockedpushentryslist
 * @since windows5.1.2600
 */
export RtlInterlockedPushEntrySList(ListHead, ListEntry) {
    result := DllCall("ntdll.dll\RtlInterlockedPushEntrySList", SLIST_HEADER.Ptr, ListHead, SLIST_ENTRY.Ptr, ListEntry, SLIST_ENTRY.Ptr)
    return result
}

/**
 * 
 * @param {Pointer<SLIST_HEADER>} ListHead 
 * @param {Pointer<SLIST_ENTRY>} List 
 * @param {Pointer<SLIST_ENTRY>} ListEnd 
 * @param {Integer} Count 
 * @returns {Pointer<SLIST_ENTRY>} 
 */
export RtlInterlockedPushListSListEx(ListHead, List, ListEnd, Count) {
    result := DllCall("ntdll.dll\RtlInterlockedPushListSListEx", SLIST_HEADER.Ptr, ListHead, SLIST_ENTRY.Ptr, List, SLIST_ENTRY.Ptr, ListEnd, "uint", Count, SLIST_ENTRY.Ptr)
    return result
}

/**
 * Removes all items from a singly linked list. Access to the list is synchronized on a multiprocessor system. (RtlInterlockedFlushSList)
 * @remarks
 * Calls to the <a href="https://docs.microsoft.com/windows/desktop/api/interlockedapi/nf-interlockedapi-interlockedflushslist">InterlockedFlushSList</a> function are forwarded to the <b>RtlInterlockedFlushSList</b> function. Applications should call <b>InterlockedFlushSList</b> instead of calling this function directly.
 * @param {Pointer<SLIST_HEADER>} ListHead A pointer to an <b>SLIST_HEADER</b> structure that represents the head of the singly linked list. This structure is for system use only.
 * @returns {Pointer<SLIST_ENTRY>} The return value is a pointer to the items removed from the list. If the list is empty, the return value is <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/nf-winnt-rtlinterlockedflushslist
 * @since windows5.1.2600
 */
export RtlInterlockedFlushSList(ListHead) {
    result := DllCall("ntdll.dll\RtlInterlockedFlushSList", SLIST_HEADER.Ptr, ListHead, SLIST_ENTRY.Ptr)
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
export RtlQueryDepthSList(ListHead) {
    result := DllCall("ntdll.dll\RtlQueryDepthSList", SLIST_HEADER.Ptr, ListHead, UInt16)
    return result
}

;@endregion Functions
