#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_TRANSFER_SYNTAX {
    #StructPack 4

    Uuid : Guid

    VersMajor : UInt16

    VersMinor : UInt16

}
