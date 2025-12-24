#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Wdk.System.Memory
 * @version v4.0.30319
 */
class Memory {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Pointer<HANDLE>} SectionHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @returns {NTSTATUS} 
     */
    static NtOpenSection(SectionHandle, DesiredAccess, ObjectAttributes) {
        result := DllCall("ntdll.dll\NtOpenSection", "ptr", SectionHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} SectionHandle 
     * @param {HANDLE} ProcessHandle 
     * @param {Pointer<Pointer<Void>>} BaseAddress 
     * @param {Pointer} ZeroBits 
     * @param {Pointer} CommitSize 
     * @param {Pointer<Integer>} SectionOffset 
     * @param {Pointer<Pointer>} ViewSize 
     * @param {Integer} InheritDisposition 
     * @param {Integer} AllocationType 
     * @param {Integer} Win32Protect 
     * @returns {NTSTATUS} 
     */
    static NtMapViewOfSection(SectionHandle, ProcessHandle, BaseAddress, ZeroBits, CommitSize, SectionOffset, ViewSize, InheritDisposition, AllocationType, Win32Protect) {
        SectionHandle := SectionHandle is Win32Handle ? NumGet(SectionHandle, "ptr") : SectionHandle
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        BaseAddressMarshal := BaseAddress is VarRef ? "ptr*" : "ptr"
        SectionOffsetMarshal := SectionOffset is VarRef ? "int64*" : "ptr"
        ViewSizeMarshal := ViewSize is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntdll.dll\NtMapViewOfSection", "ptr", SectionHandle, "ptr", ProcessHandle, BaseAddressMarshal, BaseAddress, "ptr", ZeroBits, "ptr", CommitSize, SectionOffsetMarshal, SectionOffset, ViewSizeMarshal, ViewSize, "int", InheritDisposition, "uint", AllocationType, "uint", Win32Protect, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ProcessHandle 
     * @param {Pointer<Void>} BaseAddress 
     * @returns {NTSTATUS} 
     */
    static NtUnmapViewOfSection(ProcessHandle, BaseAddress) {
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        BaseAddressMarshal := BaseAddress is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\NtUnmapViewOfSection", "ptr", ProcessHandle, BaseAddressMarshal, BaseAddress, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} SectionHandle 
     * @param {Integer} DesiredAccess 
     * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
     * @returns {NTSTATUS} 
     */
    static ZwOpenSection(SectionHandle, DesiredAccess, ObjectAttributes) {
        result := DllCall("ntdll.dll\ZwOpenSection", "ptr", SectionHandle, "uint", DesiredAccess, "ptr", ObjectAttributes, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} SectionHandle 
     * @param {HANDLE} ProcessHandle 
     * @param {Pointer<Pointer<Void>>} BaseAddress 
     * @param {Pointer} ZeroBits 
     * @param {Pointer} CommitSize 
     * @param {Pointer<Integer>} SectionOffset 
     * @param {Pointer<Pointer>} ViewSize 
     * @param {Integer} InheritDisposition 
     * @param {Integer} AllocationType 
     * @param {Integer} Win32Protect 
     * @returns {NTSTATUS} 
     */
    static ZwMapViewOfSection(SectionHandle, ProcessHandle, BaseAddress, ZeroBits, CommitSize, SectionOffset, ViewSize, InheritDisposition, AllocationType, Win32Protect) {
        SectionHandle := SectionHandle is Win32Handle ? NumGet(SectionHandle, "ptr") : SectionHandle
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        BaseAddressMarshal := BaseAddress is VarRef ? "ptr*" : "ptr"
        SectionOffsetMarshal := SectionOffset is VarRef ? "int64*" : "ptr"
        ViewSizeMarshal := ViewSize is VarRef ? "ptr*" : "ptr"

        result := DllCall("ntdll.dll\ZwMapViewOfSection", "ptr", SectionHandle, "ptr", ProcessHandle, BaseAddressMarshal, BaseAddress, "ptr", ZeroBits, "ptr", CommitSize, SectionOffsetMarshal, SectionOffset, ViewSizeMarshal, ViewSize, "int", InheritDisposition, "uint", AllocationType, "uint", Win32Protect, "int")
        return result
    }

    /**
     * 
     * @param {HANDLE} ProcessHandle 
     * @param {Pointer<Void>} BaseAddress 
     * @returns {NTSTATUS} 
     */
    static ZwUnmapViewOfSection(ProcessHandle, BaseAddress) {
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        BaseAddressMarshal := BaseAddress is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\ZwUnmapViewOfSection", "ptr", ProcessHandle, BaseAddressMarshal, BaseAddress, "int")
        return result
    }

;@endregion Methods
}
