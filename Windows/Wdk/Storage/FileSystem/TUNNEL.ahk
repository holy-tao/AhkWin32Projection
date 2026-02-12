#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\System\Kernel\LIST_ENTRY.ahk

/**
 * The TUNNEL_TYPE enumeration type defines the encapsulation method used by a tunnel, as described by the Internet Assigned Names Authority (IANA).
 * @remarks
 * For more information about the tunnel type as described by the Internet Assigned Names Authority
 *     (IANA) see 
 *     <a href="https://www.iana.org/assignments/ianaiftype-mib">"IANAifType-MIB DEFINITIONS"</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/ifdef/ne-ifdef-tunnel_type
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class TUNNEL extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Pointer<FAST_MUTEX>}
     */
    Mutex {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<RTL_SPLAY_LINKS>}
     */
    Cache {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {LIST_ENTRY}
     */
    TimerQueue{
        get {
            if(!this.HasProp("__TimerQueue"))
                this.__TimerQueue := LIST_ENTRY(16, this)
            return this.__TimerQueue
        }
    }

    /**
     * @type {Integer}
     */
    NumEntries {
        get => NumGet(this, 32, "ushort")
        set => NumPut("ushort", value, this, 32)
    }
}
