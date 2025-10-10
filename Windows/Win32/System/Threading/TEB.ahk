#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The Thread Environment Block (TEB structure) describes the state of a thread.
 * @remarks
 * 
  * The definition of this structure may change from one version of Windows to the next. Do not assume a maximum size for this structure. To see the members of this structure, refer to winternal.h.
  * 
  * You should not directly access this structure. To access the values of the <b>TlsSlots</b> and <b>TlsExpansionSlots</b>  members, call <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-tlsgetvalue">TlsGetValue</a>. To access the value of the <b>ReservedForOle</b> member, call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetcontexttoken">CoGetContextToken</a>.
  * 
  * In the following versions of Windows, the offset of the 32-bit TEB address within the 64-bit TEB is 0. This can be used to directly access the 32-bit TEB of a WOW64 thread. This might change in later versions of Windows.
  * 
  * <table>
  * <tr>
  * <td>Windows Vista</td>
  * <td>Windows Server 2008</td>
  * </tr>
  * <tr>
  * <td>Windows 7</td>
  * <td>Windows Server 2008 R2</td>
  * </tr>
  * <tr>
  * <td>Windows 8</td>
  * <td>Windows Server 2012</td>
  * </tr>
  * <tr>
  * <td>Windows 8.1</td>
  * <td>Windows Server 2012 R2</td>
  * </tr>
  * </table>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winternl/ns-winternl-teb
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class TEB extends Win32Struct
{
    static sizeof => 6024

    static packingSize => 8

    /**
     * @type {Array<Void>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 0, 12, Primitive, "ptr")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {Pointer<PEB>}
     */
    ProcessEnvironmentBlock {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Array<Void>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 104, 399, Primitive, "ptr")
            return this.__Reserved2ProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved3{
        get {
            if(!this.HasProp("__Reserved3ProxyArray"))
                this.__Reserved3ProxyArray := Win32FixedArray(this.ptr + 3296, 1952, Primitive, "char")
            return this.__Reserved3ProxyArray
        }
    }

    /**
     * @type {Array<Void>}
     */
    TlsSlots{
        get {
            if(!this.HasProp("__TlsSlotsProxyArray"))
                this.__TlsSlotsProxyArray := Win32FixedArray(this.ptr + 5248, 64, Primitive, "ptr")
            return this.__TlsSlotsProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved4{
        get {
            if(!this.HasProp("__Reserved4ProxyArray"))
                this.__Reserved4ProxyArray := Win32FixedArray(this.ptr + 5760, 8, Primitive, "char")
            return this.__Reserved4ProxyArray
        }
    }

    /**
     * @type {Array<Void>}
     */
    Reserved5{
        get {
            if(!this.HasProp("__Reserved5ProxyArray"))
                this.__Reserved5ProxyArray := Win32FixedArray(this.ptr + 5768, 26, Primitive, "ptr")
            return this.__Reserved5ProxyArray
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    ReservedForOle {
        get => NumGet(this, 5976, "ptr")
        set => NumPut("ptr", value, this, 5976)
    }

    /**
     * @type {Array<Void>}
     */
    Reserved6{
        get {
            if(!this.HasProp("__Reserved6ProxyArray"))
                this.__Reserved6ProxyArray := Win32FixedArray(this.ptr + 5984, 4, Primitive, "ptr")
            return this.__Reserved6ProxyArray
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    TlsExpansionSlots {
        get => NumGet(this, 6016, "ptr")
        set => NumPut("ptr", value, this, 6016)
    }
}
