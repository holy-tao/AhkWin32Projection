#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RPC_IF_ID structure contains the interface UUID and major and minor version numbers of an interface.
 * @remarks
 * An interface identification is a subset of the data contained in the interface-specification structure. Routines that require an interface identification structure show a data type of 
  * <b>RPC_IF_ID</b>. In those routines, the application is responsible for providing memory for the structure.
 * @see https://learn.microsoft.com/windows/win32/api/rpcdce/ns-rpcdce-rpc_if_id
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_IF_ID extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the interface 
     * <a href="https://msdn.microsoft.com/">UUID</a>.
     * @type {Pointer<Guid>}
     */
    Uuid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Major version number, an integer from 0 to 65535, inclusive.
     * @type {Integer}
     */
    VersMajor {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Minor version number, an integer from 0 to 65535, inclusive.
     * @type {Integer}
     */
    VersMinor {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }
}
