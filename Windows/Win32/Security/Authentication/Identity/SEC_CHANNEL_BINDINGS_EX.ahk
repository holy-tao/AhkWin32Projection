#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SEC_CHANNEL_BINDINGS_EX {
    #StructPack 4

    magicNumber : UInt32

    flags : UInt32

    cbHeaderLength : UInt32

    cbStructureLength : UInt32

    dwInitiatorAddrType : UInt32

    cbInitiatorLength : UInt32

    dwInitiatorOffset : UInt32

    dwAcceptorAddrType : UInt32

    cbAcceptorLength : UInt32

    dwAcceptorOffset : UInt32

    cbApplicationDataLength : UInt32

    dwApplicationDataOffset : UInt32

}
