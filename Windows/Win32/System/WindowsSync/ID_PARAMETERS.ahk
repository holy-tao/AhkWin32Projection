#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ID_PARAMETER_PAIR.ahk

/**
 * Represents the format schema for the group of IDs that are used to identify entities in a synchronization session.
 * @remarks
 * To obtain ID parameters, both providers are queried through a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-isyncprovider-getidparameters">ISyncProvider::GetIdParameters</a>. These ID parameters are then compared to verify that both providers use the same ID schema. If this verification fails, the synchronization session is not created, and an error code is returned.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/ns-winsync-id_parameters
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ID_PARAMETERS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The number of bytes in the <b>ID_PARAMETERS</b> structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The ID format that is expected for replica IDs.
     * @type {ID_PARAMETER_PAIR}
     */
    replicaId{
        get {
            if(!this.HasProp("__replicaId"))
                this.__replicaId := ID_PARAMETER_PAIR(8, this)
            return this.__replicaId
        }
    }

    /**
     * The ID format that is expected for item IDs.
     * @type {ID_PARAMETER_PAIR}
     */
    itemId{
        get {
            if(!this.HasProp("__itemId"))
                this.__itemId := ID_PARAMETER_PAIR(16, this)
            return this.__itemId
        }
    }

    /**
     * The ID format that is expected for change unit IDs.
     * @type {ID_PARAMETER_PAIR}
     */
    changeUnitId{
        get {
            if(!this.HasProp("__changeUnitId"))
                this.__changeUnitId := ID_PARAMETER_PAIR(24, this)
            return this.__changeUnitId
        }
    }
}
