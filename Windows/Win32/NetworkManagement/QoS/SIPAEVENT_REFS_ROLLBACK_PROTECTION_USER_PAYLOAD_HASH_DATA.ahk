#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct SIPAEVENT_REFS_ROLLBACK_PROTECTION_USER_PAYLOAD_HASH_DATA {
    #StructPack 2

    ChecksumType : UInt16

    ChecksumBuffer : Int8[1]

}
