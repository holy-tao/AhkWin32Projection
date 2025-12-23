#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Kernel\LIST_ENTRY.ahk

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
 * @version v4.0.30319
 */
class PEB_LDR_DATA extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Reserved for internal use by the operating system.
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 0, 8, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * Reserved for internal use by the operating system.
     * @type {Array<Void>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 8, 3, Primitive, "ptr")
            return this.__Reserved2ProxyArray
        }
    }

    /**
     * The head of a doubly-linked list that contains the loaded modules for the process. Each item in the list is a pointer to an <b>LDR_DATA_TABLE_ENTRY</b> structure. For more information, see Remarks.
     * @type {LIST_ENTRY}
     */
    InMemoryOrderModuleList{
        get {
            if(!this.HasProp("__InMemoryOrderModuleList"))
                this.__InMemoryOrderModuleList := LIST_ENTRY(32, this)
            return this.__InMemoryOrderModuleList
        }
    }
}
