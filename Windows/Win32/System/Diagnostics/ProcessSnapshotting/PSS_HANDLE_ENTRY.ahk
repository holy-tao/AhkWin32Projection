#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HANDLE.ahk
#Include ..\..\..\Foundation\FILETIME.ahk
#Include ..\..\..\Foundation\PWSTR.ahk

/**
 * Holds information about a handle returned by PssWalkSnapshot.
 * @remarks
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-psswalksnapshot">PssWalkSnapshot</a> returns a <b>PSS_HANDLE_ENTRY</b> structure when the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ne-processsnapshot-pss_walk_information_class">PSS_WALK_INFORMATION_CLASS</a> member that the caller provides it is <b>PSS_WALK_HANDLES</b>.
 * @see https://learn.microsoft.com/windows/win32/api/processsnapshot/ns-processsnapshot-pss_handle_entry
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 * @version v4.0.30319
 */
class PSS_HANDLE_ENTRY extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * The handle value.
     * @type {HANDLE}
     */
    Handle{
        get {
            if(!this.HasProp("__Handle"))
                this.__Handle := HANDLE(this.ptr + 0)
            return this.__Handle
        }
    }

    /**
     * Flags that indicate what parts of this structure are valid. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ne-processsnapshot-pss_handle_flags">PSS_HANDLE_FLAGS</a>.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The type of the object that the handle references. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ne-processsnapshot-pss_object_type">PSS_OBJECT_TYPE</a>.
     * @type {Integer}
     */
    ObjectType {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * The capture time of this information. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     * @type {FILETIME}
     */
    CaptureTime{
        get {
            if(!this.HasProp("__CaptureTime"))
                this.__CaptureTime := FILETIME(this.ptr + 16)
            return this.__CaptureTime
        }
    }

    /**
     * Attributes.
     * @type {Integer}
     */
    Attributes {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Reserved for use by the operating system.
     * @type {Integer}
     */
    GrantedAccess {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Reserved for use by the operating system.
     * @type {Integer}
     */
    HandleCount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Reserved for use by the operating system.
     * @type {Integer}
     */
    PointerCount {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Reserved for use by the operating system.
     * @type {Integer}
     */
    PagedPoolCharge {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Reserved for use by the operating system.
     * @type {Integer}
     */
    NonPagedPoolCharge {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Reserved for use by the operating system.
     * @type {FILETIME}
     */
    CreationTime{
        get {
            if(!this.HasProp("__CreationTime"))
                this.__CreationTime := FILETIME(this.ptr + 48)
            return this.__CreationTime
        }
    }

    /**
     * The length of <b>TypeName</b>, in bytes.
     * @type {Integer}
     */
    TypeNameLength {
        get => NumGet(this, 56, "ushort")
        set => NumPut("ushort", value, this, 56)
    }

    /**
     * The type name of the object referenced by this handle. The buffer may not terminated by a <b>NULL</b> character. The pointer is valid for the lifetime of the walk marker passed to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-psswalksnapshot">PssWalkSnapshot</a>.
     * @type {PWSTR}
     */
    TypeName{
        get {
            if(!this.HasProp("__TypeName"))
                this.__TypeName := PWSTR(this.ptr + 64)
            return this.__TypeName
        }
    }

    /**
     * The length of <b>ObjectName</b>, in bytes.
     * @type {Integer}
     */
    ObjectNameLength {
        get => NumGet(this, 72, "ushort")
        set => NumPut("ushort", value, this, 72)
    }

    /**
     * Specifies the name of the object referenced by this handle. The buffer may not terminated by a <b>NULL</b> character. The pointer is valid for the lifetime of the walk marker passed to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-psswalksnapshot">PssWalkSnapshot</a>.
     * @type {PWSTR}
     */
    ObjectName{
        get {
            if(!this.HasProp("__ObjectName"))
                this.__ObjectName := PWSTR(this.ptr + 80)
            return this.__ObjectName
        }
    }

    /**
     * @type {Integer}
     */
    ExitStatus {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Pointer<Void>}
     */
    PebBaseAddress {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer}
     */
    AffinityMask {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    BasePriority {
        get => NumGet(this, 112, "int")
        set => NumPut("int", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    ProcessId {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * @type {Integer}
     */
    ParentProcessId {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * @type {Integer}
     */
    Flags1 {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * @type {Pointer<Void>}
     */
    TebBaseAddress {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    ProcessId1 {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    ThreadId {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * @type {Pointer}
     */
    AffinityMask1 {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    Priority {
        get => NumGet(this, 120, "int")
        set => NumPut("int", value, this, 120)
    }

    /**
     * @type {Integer}
     */
    BasePriority1 {
        get => NumGet(this, 124, "int")
        set => NumPut("int", value, this, 124)
    }

    /**
     * @type {Pointer<Void>}
     */
    Win32StartAddress {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    CurrentCount {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    Abandoned {
        get => NumGet(this, 92, "int")
        set => NumPut("int", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    OwnerProcessId {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    OwnerThreadId {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * @type {Integer}
     */
    ManualReset {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    Signaled {
        get => NumGet(this, 92, "int")
        set => NumPut("int", value, this, 92)
    }

    /**
     * @type {Pointer<Void>}
     */
    BaseAddress {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    AllocationAttributes {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    MaximumSize {
        get => NumGet(this, 104, "int64")
        set => NumPut("int64", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    MaximumCount {
        get => NumGet(this, 92, "int")
        set => NumPut("int", value, this, 92)
    }
}
