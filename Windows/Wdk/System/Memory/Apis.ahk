#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\OBJECT_ATTRIBUTES.ahk" { OBJECT_ATTRIBUTES }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\SECTION_INHERIT.ahk" { SECTION_INHERIT }

/**
 * @namespace Windows.Wdk.System.Memory
 */

;@region Functions
/**
 * 
 * @param {Pointer<HANDLE>} SectionHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @returns {NTSTATUS} 
 */
export NtOpenSection(SectionHandle, DesiredAccess, ObjectAttributes) {
    result := DllCall("ntdll.dll\NtOpenSection", HANDLE.Ptr, SectionHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
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
 * @param {SECTION_INHERIT} InheritDisposition 
 * @param {Integer} AllocationType 
 * @param {Integer} Win32Protect 
 * @returns {NTSTATUS} 
 */
export NtMapViewOfSection(SectionHandle, ProcessHandle, BaseAddress, ZeroBits, CommitSize, SectionOffset, ViewSize, InheritDisposition, AllocationType, Win32Protect) {
    BaseAddressMarshal := BaseAddress is VarRef ? "ptr*" : "ptr"
    SectionOffsetMarshal := SectionOffset is VarRef ? "int64*" : "ptr"
    ViewSizeMarshal := ViewSize is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntdll.dll\NtMapViewOfSection", HANDLE, SectionHandle, HANDLE, ProcessHandle, BaseAddressMarshal, BaseAddress, "ptr", ZeroBits, "ptr", CommitSize, SectionOffsetMarshal, SectionOffset, ViewSizeMarshal, ViewSize, SECTION_INHERIT, InheritDisposition, "uint", AllocationType, "uint", Win32Protect, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ProcessHandle 
 * @param {Pointer<Void>} BaseAddress 
 * @returns {NTSTATUS} 
 */
export NtUnmapViewOfSection(ProcessHandle, BaseAddress) {
    BaseAddressMarshal := BaseAddress is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\NtUnmapViewOfSection", HANDLE, ProcessHandle, BaseAddressMarshal, BaseAddress, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<HANDLE>} SectionHandle 
 * @param {Integer} DesiredAccess 
 * @param {Pointer<OBJECT_ATTRIBUTES>} ObjectAttributes 
 * @returns {NTSTATUS} 
 */
export ZwOpenSection(SectionHandle, DesiredAccess, ObjectAttributes) {
    result := DllCall("ntdll.dll\ZwOpenSection", HANDLE.Ptr, SectionHandle, "uint", DesiredAccess, OBJECT_ATTRIBUTES.Ptr, ObjectAttributes, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
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
 * @param {SECTION_INHERIT} InheritDisposition 
 * @param {Integer} AllocationType 
 * @param {Integer} Win32Protect 
 * @returns {NTSTATUS} 
 */
export ZwMapViewOfSection(SectionHandle, ProcessHandle, BaseAddress, ZeroBits, CommitSize, SectionOffset, ViewSize, InheritDisposition, AllocationType, Win32Protect) {
    BaseAddressMarshal := BaseAddress is VarRef ? "ptr*" : "ptr"
    SectionOffsetMarshal := SectionOffset is VarRef ? "int64*" : "ptr"
    ViewSizeMarshal := ViewSize is VarRef ? "ptr*" : "ptr"

    result := DllCall("ntdll.dll\ZwMapViewOfSection", HANDLE, SectionHandle, HANDLE, ProcessHandle, BaseAddressMarshal, BaseAddress, "ptr", ZeroBits, "ptr", CommitSize, SectionOffsetMarshal, SectionOffset, ViewSizeMarshal, ViewSize, SECTION_INHERIT, InheritDisposition, "uint", AllocationType, "uint", Win32Protect, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} ProcessHandle 
 * @param {Pointer<Void>} BaseAddress 
 * @returns {NTSTATUS} 
 */
export ZwUnmapViewOfSection(ProcessHandle, BaseAddress) {
    BaseAddressMarshal := BaseAddress is VarRef ? "ptr" : "ptr"

    result := DllCall("ntdll.dll\ZwUnmapViewOfSection", HANDLE, ProcessHandle, BaseAddressMarshal, BaseAddress, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

;@endregion Functions
