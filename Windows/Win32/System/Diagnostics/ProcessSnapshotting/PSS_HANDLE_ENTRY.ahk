#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HANDLE.ahk
#Include ..\..\..\Foundation\FILETIME.ahk

/**
 * Holds information about a handle returned by PssWalkSnapshot.
 * @remarks
 * 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-psswalksnapshot">PssWalkSnapshot</a> returns a <b>PSS_HANDLE_ENTRY</b> structure when the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ne-processsnapshot-pss_walk_information_class">PSS_WALK_INFORMATION_CLASS</a> member that the caller provides it is <b>PSS_WALK_HANDLES</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//processsnapshot/ns-processsnapshot-pss_handle_entry
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 * @version v4.0.30319
 */
class PSS_HANDLE_ENTRY extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * The handle value.
     * @type {HANDLE}
     */
    Handle{
        get {
            if(!this.HasProp("__Handle"))
                this.__Handle := HANDLE(0, this)
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
                this.__CaptureTime := FILETIME(16, this)
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
                this.__CreationTime := FILETIME(48, this)
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
    TypeName {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
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
    ObjectName {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    class _Process extends Win32Struct {
        static sizeof => 48
        static packingSize => 8

        /**
         * @type {Integer}
         */
        ExitStatus {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Pointer<Void>}
         */
        PebBaseAddress {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
        /**
         * @type {Pointer}
         */
        AffinityMask {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        BasePriority {
            get => NumGet(this, 24, "int")
            set => NumPut("int", value, this, 24)
        }
    
        /**
         * @type {Integer}
         */
        ProcessId {
            get => NumGet(this, 28, "uint")
            set => NumPut("uint", value, this, 28)
        }
    
        /**
         * @type {Integer}
         */
        ParentProcessId {
            get => NumGet(this, 32, "uint")
            set => NumPut("uint", value, this, 32)
        }
    
        /**
         * @type {Integer}
         */
        Flags {
            get => NumGet(this, 36, "uint")
            set => NumPut("uint", value, this, 36)
        }
    
    }

    class _Thread extends Win32Struct {
        static sizeof => 48
        static packingSize => 8

        /**
         * @type {Integer}
         */
        ExitStatus {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Pointer<Void>}
         */
        TebBaseAddress {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        ProcessId {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        ThreadId {
            get => NumGet(this, 20, "uint")
            set => NumPut("uint", value, this, 20)
        }
    
        /**
         * @type {Pointer}
         */
        AffinityMask {
            get => NumGet(this, 24, "ptr")
            set => NumPut("ptr", value, this, 24)
        }
    
        /**
         * @type {Integer}
         */
        Priority {
            get => NumGet(this, 32, "int")
            set => NumPut("int", value, this, 32)
        }
    
        /**
         * @type {Integer}
         */
        BasePriority {
            get => NumGet(this, 36, "int")
            set => NumPut("int", value, this, 36)
        }
    
        /**
         * @type {Pointer<Void>}
         */
        Win32StartAddress {
            get => NumGet(this, 40, "ptr")
            set => NumPut("ptr", value, this, 40)
        }
    
    }

    class _Mutant extends Win32Struct {
        static sizeof => 48
        static packingSize => 8

        /**
         * @type {Integer}
         */
        CurrentCount {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {BOOL}
         */
        Abandoned {
            get => NumGet(this, 4, "int")
            set => NumPut("int", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        OwnerProcessId {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        OwnerThreadId {
            get => NumGet(this, 12, "uint")
            set => NumPut("uint", value, this, 12)
        }
    
    }

    class _Event extends Win32Struct {
        static sizeof => 48
        static packingSize => 8

        /**
         * @type {BOOL}
         */
        ManualReset {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {BOOL}
         */
        Signaled {
            get => NumGet(this, 4, "int")
            set => NumPut("int", value, this, 4)
        }
    
    }

    class _Section extends Win32Struct {
        static sizeof => 48
        static packingSize => 8

        /**
         * @type {Pointer<Void>}
         */
        BaseAddress {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        AllocationAttributes {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        MaximumSize {
            get => NumGet(this, 16, "int64")
            set => NumPut("int64", value, this, 16)
        }
    
    }

    class _Semaphore extends Win32Struct {
        static sizeof => 48
        static packingSize => 8

        /**
         * @type {Integer}
         */
        CurrentCount {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        MaximumCount {
            get => NumGet(this, 4, "int")
            set => NumPut("int", value, this, 4)
        }
    
    }

    /**
     * @type {_Process}
     */
    Process{
        get {
            if(!this.HasProp("__Process"))
                this.__Process := %this.__Class%._Process(88, this)
            return this.__Process
        }
    }

    /**
     * @type {_Thread}
     */
    Thread{
        get {
            if(!this.HasProp("__Thread"))
                this.__Thread := %this.__Class%._Thread(88, this)
            return this.__Thread
        }
    }

    /**
     * @type {_Mutant}
     */
    Mutant{
        get {
            if(!this.HasProp("__Mutant"))
                this.__Mutant := %this.__Class%._Mutant(88, this)
            return this.__Mutant
        }
    }

    /**
     * @type {_Event}
     */
    Event{
        get {
            if(!this.HasProp("__Event"))
                this.__Event := %this.__Class%._Event(88, this)
            return this.__Event
        }
    }

    /**
     * @type {_Section}
     */
    Section{
        get {
            if(!this.HasProp("__Section"))
                this.__Section := %this.__Class%._Section(88, this)
            return this.__Section
        }
    }

    /**
     * @type {_Semaphore}
     */
    Semaphore{
        get {
            if(!this.HasProp("__Semaphore"))
                this.__Semaphore := %this.__Class%._Semaphore(88, this)
            return this.__Semaphore
        }
    }
}
