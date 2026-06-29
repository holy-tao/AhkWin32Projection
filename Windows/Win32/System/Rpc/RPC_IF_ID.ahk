#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The RPC_IF_ID structure contains the interface UUID and major and minor version numbers of an interface.
 * @remarks
 * An interface identification is a subset of the data contained in the interface-specification structure. Routines that require an interface identification structure show a data type of 
 * <b>RPC_IF_ID</b>. In those routines, the application is responsible for providing memory for the structure.
 * @see https://learn.microsoft.com/windows/win32/api/rpcdce/ns-rpcdce-rpc_if_id
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_IF_ID {
    #StructPack 4

    /**
     * Specifies the interface 
     * <a href="https://msdn.microsoft.com/">UUID</a>.
     */
    Uuid : Guid

    /**
     * Major version number, an integer from 0 to 65535, inclusive.
     */
    VersMajor : UInt16

    /**
     * Minor version number, an integer from 0 to 65535, inclusive.
     */
    VersMinor : UInt16

}
