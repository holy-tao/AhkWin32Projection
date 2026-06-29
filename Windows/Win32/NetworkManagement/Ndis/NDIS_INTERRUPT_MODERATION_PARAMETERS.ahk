#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import ".\NDIS_INTERRUPT_MODERATION.ahk" { NDIS_INTERRUPT_MODERATION }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_INTERRUPT_MODERATION_PARAMETERS {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    Flags : UInt32

    InterruptModeration : NDIS_INTERRUPT_MODERATION

}
