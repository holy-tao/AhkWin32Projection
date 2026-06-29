#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PSS_HANDLE_FLAGS.ahk" { PSS_HANDLE_FLAGS }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PSS_OBJECT_TYPE.ahk" { PSS_OBJECT_TYPE }
#Import "..\..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Holds information about a handle returned by PssWalkSnapshot.
 * @remarks
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-psswalksnapshot">PssWalkSnapshot</a> returns a <b>PSS_HANDLE_ENTRY</b> structure when the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ne-processsnapshot-pss_walk_information_class">PSS_WALK_INFORMATION_CLASS</a> member that the caller provides it is <b>PSS_WALK_HANDLES</b>.
 * @see https://learn.microsoft.com/windows/win32/api/processsnapshot/ns-processsnapshot-pss_handle_entry
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 */
export default struct PSS_HANDLE_ENTRY {
    #StructPack 8


    struct _TypeSpecificInformation {

        struct _Process {
            ExitStatus : UInt32

            PebBaseAddress : IntPtr

            AffinityMask : IntPtr

            BasePriority : Int32

            ProcessId : UInt32

            ParentProcessId : UInt32

            Flags : UInt32

        }

        struct _Thread {
            ExitStatus : UInt32

            TebBaseAddress : IntPtr

            ProcessId : UInt32

            ThreadId : UInt32

            AffinityMask : IntPtr

            Priority : Int32

            BasePriority : Int32

            Win32StartAddress : IntPtr

        }

        struct _Mutant {
            CurrentCount : Int32

            Abandoned : BOOL

            OwnerProcessId : UInt32

            OwnerThreadId : UInt32

        }

        struct _Event {
            ManualReset : BOOL

            Signaled : BOOL

        }

        struct _Section {
            BaseAddress : IntPtr

            AllocationAttributes : UInt32

            MaximumSize : Int64

        }

        struct _Semaphore {
            CurrentCount : Int32

            MaximumCount : Int32

        }

        Process : PSS_HANDLE_ENTRY._TypeSpecificInformation._Process

        static __New() {
            DefineProp(this.Prototype, 'Thread', { type: PSS_HANDLE_ENTRY._TypeSpecificInformation._Thread, offset: 0 })
            DefineProp(this.Prototype, 'Mutant', { type: PSS_HANDLE_ENTRY._TypeSpecificInformation._Mutant, offset: 0 })
            DefineProp(this.Prototype, 'Event', { type: PSS_HANDLE_ENTRY._TypeSpecificInformation._Event, offset: 0 })
            DefineProp(this.Prototype, 'Section', { type: PSS_HANDLE_ENTRY._TypeSpecificInformation._Section, offset: 0 })
            DefineProp(this.Prototype, 'Semaphore', { type: PSS_HANDLE_ENTRY._TypeSpecificInformation._Semaphore, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * The handle value.
     */
    Handle : HANDLE

    /**
     * Flags that indicate what parts of this structure are valid. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ne-processsnapshot-pss_handle_flags">PSS_HANDLE_FLAGS</a>.
     */
    Flags : PSS_HANDLE_FLAGS

    /**
     * The type of the object that the handle references. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ne-processsnapshot-pss_object_type">PSS_OBJECT_TYPE</a>.
     */
    ObjectType : PSS_OBJECT_TYPE

    /**
     * The capture time of this information. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     */
    CaptureTime : FILETIME

    /**
     * Attributes.
     */
    Attributes : UInt32

    /**
     * Reserved for use by the operating system.
     */
    GrantedAccess : UInt32

    /**
     * Reserved for use by the operating system.
     */
    HandleCount : UInt32

    /**
     * Reserved for use by the operating system.
     */
    PointerCount : UInt32

    /**
     * Reserved for use by the operating system.
     */
    PagedPoolCharge : UInt32

    /**
     * Reserved for use by the operating system.
     */
    NonPagedPoolCharge : UInt32

    /**
     * Reserved for use by the operating system.
     */
    CreationTime : FILETIME

    /**
     * The length of <b>TypeName</b>, in bytes.
     */
    TypeNameLength : UInt16

    /**
     * The type name of the object referenced by this handle. The buffer may not terminated by a <b>NULL</b> character. The pointer is valid for the lifetime of the walk marker passed to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-psswalksnapshot">PssWalkSnapshot</a>.
     */
    TypeName : PWSTR

    /**
     * The length of <b>ObjectName</b>, in bytes.
     */
    ObjectNameLength : UInt16

    /**
     * Specifies the name of the object referenced by this handle. The buffer may not terminated by a <b>NULL</b> character. The pointer is valid for the lifetime of the walk marker passed to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-psswalksnapshot">PssWalkSnapshot</a>.
     */
    ObjectName : PWSTR

    /**
     * Type-specific information.
     */
    TypeSpecificInformation : PSS_HANDLE_ENTRY._TypeSpecificInformation

}
