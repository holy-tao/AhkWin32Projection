#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The RPC_IF_ID structure contains the interface UUID and major and minor version numbers of an interface.
 * @remarks
 * An interface identification is a subset of the data contained in the interface-specification structure. Routines that require an interface identification structure show a data type of 
 * <b>RPC_IF_ID</b>. In those routines, the application is responsible for providing memory for the structure.
 * @see https://learn.microsoft.com/windows/win32/api/rpcdce/ns-rpcdce-rpc_if_id
 * @namespace Windows.Win32.System.Rpc
 */
class RPC_IF_ID extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * Specifies the interface 
     * <a href="https://msdn.microsoft.com/">UUID</a>.
     * @type {Guid}
     */
    Uuid {
        get {
            if(!this.HasProp("__Uuid"))
                this.__Uuid := Guid(0, this)
            return this.__Uuid
        }
    }

    /**
     * Major version number, an integer from 0 to 65535, inclusive.
     * @type {Integer}
     */
    VersMajor {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * Minor version number, an integer from 0 to 65535, inclusive.
     * @type {Integer}
     */
    VersMinor {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }
}
