#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Kernel\LIST_ENTRY.ahk" { LIST_ENTRY }

/**
 * Contains information about the loaded modules for the process.
 * @remarks
 * The <b>LIST_ENTRY</b> structure is defined as follows: 
 * 
 * 
 * ``` syntax
 * typedef struct _LIST_ENTRY {
 *    struct _LIST_ENTRY *Flink;
 *    struct _LIST_ENTRY *Blink;
 * } LIST_ENTRY, *PLIST_ENTRY, *RESTRICTED_POINTER PRLIST_ENTRY;
 * ```
 * 
 * The <b>LDR_DATA_TABLE_ENTRY</b> structure is defined as follows: 
 * 
 * 
 * ``` syntax
 * typedef struct _LDR_DATA_TABLE_ENTRY {
 *     PVOID Reserved1[2];
 *     LIST_ENTRY InMemoryOrderLinks;
 *     PVOID Reserved2[2];
 *     PVOID DllBase;
 *     PVOID EntryPoint;
 *     PVOID Reserved3;
 *     UNICODE_STRING FullDllName;
 *     BYTE Reserved4[8];
 *     PVOID Reserved5[3];
 *     union {
 *         ULONG CheckSum;
 *         PVOID Reserved6;
 *     };
 *     ULONG TimeDateStamp;
 * } LDR_DATA_TABLE_ENTRY, *PLDR_DATA_TABLE_ENTRY;
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/winternl/ns-winternl-peb_ldr_data
 * @namespace Windows.Win32.System.Threading
 */
export default struct PEB_LDR_DATA {
    #StructPack 8

    /**
     * Reserved for internal use by the operating system.
     */
    Reserved1 : Int8[8]

    /**
     * Reserved for internal use by the operating system.
     */
    Reserved2 : IntPtr[3]

    /**
     * The head of a doubly-linked list that contains the loaded modules for the process. Each item in the list is a pointer to an <b>LDR_DATA_TABLE_ENTRY</b> structure. For more information, see Remarks.
     */
    InMemoryOrderModuleList : LIST_ENTRY

}
