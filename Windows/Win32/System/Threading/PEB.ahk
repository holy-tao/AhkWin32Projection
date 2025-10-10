#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains process information.
 * @remarks
 * 
  * The syntax for this structure on 64-bit Windows is as follows:
  * 
  * <pre class="syntax" xml:space="preserve"><code>typedef struct _PEB {
  *     BYTE Reserved1[2];
  *     BYTE BeingDebugged;
  *     BYTE Reserved2[21];
  *     PPEB_LDR_DATA LoaderData;
  *     PRTL_USER_PROCESS_PARAMETERS ProcessParameters;
  *     BYTE Reserved3[520];
  *     PPS_POST_PROCESS_INIT_ROUTINE PostProcessInitRoutine;
  *     BYTE Reserved4[136];
  *     ULONG SessionId;
  * } PEB;</code></pre>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winternl/ns-winternl-peb
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class PEB extends Win32Struct
{
    static sizeof => 712

    static packingSize => 8

    /**
     * Reserved for internal use by the operating system.
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 0, 2, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * Indicates whether the specified process is currently being debugged. The <b>PEB</b> structure, however, is an internal operating-system structure whose layout may change in the future. It is best to use the <a href="https://docs.microsoft.com/windows/desktop/api/debugapi/nf-debugapi-checkremotedebuggerpresent">CheckRemoteDebuggerPresent</a> function instead.
     * @type {Integer}
     */
    BeingDebugged {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * Reserved for internal use by the operating system.
     * @type {Array<Byte>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 3, 1, Primitive, "char")
            return this.__Reserved2ProxyArray
        }
    }

    /**
     * Reserved for internal use by the operating system.
     * @type {Array<Void>}
     */
    Reserved3{
        get {
            if(!this.HasProp("__Reserved3ProxyArray"))
                this.__Reserved3ProxyArray := Win32FixedArray(this.ptr + 8, 2, Primitive, "ptr")
            return this.__Reserved3ProxyArray
        }
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winternl/ns-winternl-peb_ldr_data">PEB_LDR_DATA</a> structure that contains information about the loaded modules for the process.
     * @type {Pointer<PEB_LDR_DATA>}
     */
    Ldr {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winternl/ns-winternl-rtl_user_process_parameters">RTL_USER_PROCESS_PARAMETERS</a> structure that contains process parameter information such as the command line.
     * @type {Pointer<RTL_USER_PROCESS_PARAMETERS>}
     */
    ProcessParameters {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Reserved for internal use by the operating system.
     * @type {Array<Void>}
     */
    Reserved4{
        get {
            if(!this.HasProp("__Reserved4ProxyArray"))
                this.__Reserved4ProxyArray := Win32FixedArray(this.ptr + 40, 3, Primitive, "ptr")
            return this.__Reserved4ProxyArray
        }
    }

    /**
     * 
     * @type {Pointer<Void>}
     */
    AtlThunkSListPtr {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Reserved for internal use by the operating system.
     * @type {Pointer<Void>}
     */
    Reserved5 {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Reserved for internal use by the operating system.
     * @type {Integer}
     */
    Reserved6 {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Reserved for internal use by the operating system.
     * @type {Pointer<Void>}
     */
    Reserved7 {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * 
     * @type {Integer}
     */
    Reserved8 {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * 
     * @type {Integer}
     */
    AtlThunkSListPtr32 {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * 
     * @type {Array<Void>}
     */
    Reserved9{
        get {
            if(!this.HasProp("__Reserved9ProxyArray"))
                this.__Reserved9ProxyArray := Win32FixedArray(this.ptr + 104, 45, Primitive, "ptr")
            return this.__Reserved9ProxyArray
        }
    }

    /**
     * 
     * @type {Array<Byte>}
     */
    Reserved10{
        get {
            if(!this.HasProp("__Reserved10ProxyArray"))
                this.__Reserved10ProxyArray := Win32FixedArray(this.ptr + 464, 96, Primitive, "char")
            return this.__Reserved10ProxyArray
        }
    }

    /**
     * Not supported.
     * @type {Pointer<PPS_POST_PROCESS_INIT_ROUTINE>}
     */
    PostProcessInitRoutine {
        get => NumGet(this, 560, "ptr")
        set => NumPut("ptr", value, this, 560)
    }

    /**
     * 
     * @type {Array<Byte>}
     */
    Reserved11{
        get {
            if(!this.HasProp("__Reserved11ProxyArray"))
                this.__Reserved11ProxyArray := Win32FixedArray(this.ptr + 568, 128, Primitive, "char")
            return this.__Reserved11ProxyArray
        }
    }

    /**
     * 
     * @type {Array<Void>}
     */
    Reserved12{
        get {
            if(!this.HasProp("__Reserved12ProxyArray"))
                this.__Reserved12ProxyArray := Win32FixedArray(this.ptr + 696, 1, Primitive, "ptr")
            return this.__Reserved12ProxyArray
        }
    }

    /**
     * The Terminal Services session identifier associated with the current process.
     * @type {Integer}
     */
    SessionId {
        get => NumGet(this, 704, "uint")
        set => NumPut("uint", value, this, 704)
    }
}
