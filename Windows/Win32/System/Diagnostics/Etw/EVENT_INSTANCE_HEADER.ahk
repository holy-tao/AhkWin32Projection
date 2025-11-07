#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The EVENT_INSTANCE_HEADER structure contains standard event tracing information common to all events.
 * @remarks
 * 
 * Be sure to initialize the memory for this structure to zero before setting any members.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//evntrace/ns-evntrace-event_instance_header
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class EVENT_INSTANCE_HEADER extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Total number of bytes of the event. <b>Size</b> must include the size of the 
     * <b>EVENT_INSTANCE_HEADER</b> structure, plus the size of any event-specific data appended to this structure. The size must be less than the size of the event tracing session's buffer minus 72 (0x48).
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    FieldTypeFlags {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    HeaderType {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    MarkerFlags {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    class _Class extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * @type {Integer}
         */
        Type {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Level {
            get => NumGet(this, 1, "char")
            set => NumPut("char", value, this, 1)
        }
    
        /**
         * @type {Integer}
         */
        Version {
            get => NumGet(this, 2, "ushort")
            set => NumPut("ushort", value, this, 2)
        }
    
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {_Class}
     */
    Class{
        get {
            if(!this.HasProp("__Class"))
                this.__Class := %this.__Class%._Class(4, this)
            return this.__Class
        }
    }

    /**
     * On output, identifies the thread that generated the event. 
     * 
     * Note that on Windows 2000, <b>ThreadId</b> was a <b>ULONGLONG</b> value.
     * @type {Integer}
     */
    ThreadId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * On output, identifies  the process that generated the event.
     * 
     * <b>Windows 2000:  </b>This member is not supported.
     * @type {Integer}
     */
    ProcessId {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * On output, contains the time the event occurred, in 100-nanosecond intervals since midnight, January 1, 1601.
     * @type {Integer}
     */
    TimeStamp {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * Handle to a registered event trace class. Set this property before calling the <a href="https://docs.microsoft.com/windows/desktop/ETW/traceeventinstance">TraceEventInstance</a> function.
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/ETW/registertraceguids">RegisterTraceGuids</a> function creates this handle (see the <i>TraceGuidReg</i> parameter).
     * @type {Integer}
     */
    RegHandle {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * On output, contains the event trace instance identifier associated with <b>RegHandle</b>.
     * @type {Integer}
     */
    InstanceId {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * On output, contains the event trace instance identifier associated with <b>ParentRegHandle</b>.
     * @type {Integer}
     */
    ParentInstanceId {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    KernelTime {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    UserTime {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    ProcessorTime {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    EventId {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Handle to a registered event trace class of a parent event. Set this property before calling the <a href="https://docs.microsoft.com/windows/desktop/ETW/traceeventinstance">TraceEventInstance</a> function if you want to trace a hierarchical relationship (parent element/child element) between related events.
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/ETW/registertraceguids">RegisterTraceGuids</a> function creates this handle (see the <i>TraceGuidReg</i> parameter).
     * @type {Integer}
     */
    ParentRegHandle {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
