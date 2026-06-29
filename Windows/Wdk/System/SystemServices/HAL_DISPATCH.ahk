#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct HAL_DISPATCH {
    #StructPack 8

    Version : UInt32

    HalQuerySystemInformation : IntPtr

    HalSetSystemInformation : IntPtr

    HalQueryBusSlots : IntPtr

    Spare1 : UInt32

    HalExamineMBR : IntPtr

    HalIoReadPartitionTable : IntPtr

    HalIoSetPartitionInformation : IntPtr

    HalIoWritePartitionTable : IntPtr

    HalReferenceHandlerForBus : IntPtr

    HalReferenceBusHandler : IntPtr

    HalDereferenceBusHandler : IntPtr

    HalInitPnpDriver : IntPtr

    HalInitPowerManagement : IntPtr

    HalGetDmaAdapter : IntPtr

    HalGetInterruptTranslator : IntPtr

    HalStartMirroring : IntPtr

    HalEndMirroring : IntPtr

    HalMirrorPhysicalMemory : IntPtr

    HalEndOfBoot : IntPtr

    HalMirrorVerify : IntPtr

    HalGetCachedAcpiTable : IntPtr

    HalSetPciErrorHandlerCallback : IntPtr

    HalGetPrmCache : IntPtr

}
