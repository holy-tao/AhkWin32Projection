#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WSAPROTOCOLCHAIN structure contains a counted list of Catalog Entry identifiers that comprise a protocol chain.
 * @remarks
 * 
 * If the length of the chain is larger than 1, this structure represents a protocol chain which consists of one or more layered protocols on top of a base protocol. The corresponding Catalog Entry IDs are in the ProtocolChain.ChainEntries array starting with the layered protocol at the top (the zeroth element in the ProtocolChain.ChainEntries array) and ending with the base protocol. Refer to Windows Sockets 2 Service Provider Interface for more information on protocol chains.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsock2/ns-winsock2-wsaprotocolchain
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class WSAPROTOCOLCHAIN extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * Length of the chain, in bytes. The following settings apply: 
     * 
     * 
     * 
     * 
     * Setting <b>ChainLen</b> to zero indicates a layered protocol
     * 
     * Setting <b>ChainLen</b> to one indicates a base protocol
     * 
     * Setting <b>ChainLen</b> to greater than one indicates a protocol chain
     * @type {Integer}
     */
    ChainLen {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Array of protocol chain entries.
     * @type {Array<UInt32>}
     */
    ChainEntries{
        get {
            if(!this.HasProp("__ChainEntriesProxyArray"))
                this.__ChainEntriesProxyArray := Win32FixedArray(this.ptr + 4, 7, Primitive, "uint")
            return this.__ChainEntriesProxyArray
        }
    }
}
