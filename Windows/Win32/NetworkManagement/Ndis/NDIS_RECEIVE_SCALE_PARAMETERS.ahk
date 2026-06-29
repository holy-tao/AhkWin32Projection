#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_RECEIVE_SCALE_PARAMETERS {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    Flags : UInt16

    BaseCpuNumber : UInt16

    HashInformation : UInt32

    IndirectionTableSize : UInt16

    IndirectionTableOffset : UInt32

    HashSecretKeySize : UInt16

    HashSecretKeyOffset : UInt32

}
