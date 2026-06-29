#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_INTERRUPT_MODERATION.ahk" { NDIS_INTERRUPT_MODERATION }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_INTERRUPT_MODERATION_PARAMETERS {
    #StructPack 8

    Header : IntPtr

    Flags : UInt32

    InterruptModeration : NDIS_INTERRUPT_MODERATION

}
