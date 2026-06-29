#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ID_PARAMETER_PAIR.ahk" { ID_PARAMETER_PAIR }

/**
 * Represents the format schema for the group of IDs that are used to identify entities in a synchronization session.
 * @remarks
 * To obtain ID parameters, both providers are queried through a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-isyncprovider-getidparameters">ISyncProvider::GetIdParameters</a>. These ID parameters are then compared to verify that both providers use the same ID schema. If this verification fails, the synchronization session is not created, and an error code is returned.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/ns-winsync-id_parameters
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ID_PARAMETERS {
    #StructPack 4

    /**
     * The number of bytes in the <b>ID_PARAMETERS</b> structure.
     */
    dwSize : UInt32

    /**
     * The ID format that is expected for replica IDs.
     */
    replicaId : ID_PARAMETER_PAIR

    /**
     * The ID format that is expected for item IDs.
     */
    itemId : ID_PARAMETER_PAIR

    /**
     * The ID format that is expected for change unit IDs.
     */
    changeUnitId : ID_PARAMETER_PAIR

}
