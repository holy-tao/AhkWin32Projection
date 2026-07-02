#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\pHalMirrorPhysicalMemory.ahk" { pHalMirrorPhysicalMemory }
#Import ".\pHalGetInterruptTranslator.ahk" { pHalGetInterruptTranslator }
#Import ".\pHalQuerySystemInformation.ahk" { pHalQuerySystemInformation }
#Import ".\pHalSetSystemInformation.ahk" { pHalSetSystemInformation }
#Import ".\pHalInitPnpDriver.ahk" { pHalInitPnpDriver }
#Import ".\pHalIoReadPartitionTable.ahk" { pHalIoReadPartitionTable }
#Import ".\pHalExamineMBR.ahk" { pHalExamineMBR }
#Import ".\pHalEndMirroring.ahk" { pHalEndMirroring }
#Import ".\pHalGetPrmCache.ahk" { pHalGetPrmCache }
#Import ".\pHalHandlerForBus.ahk" { pHalHandlerForBus }
#Import ".\pHalIoWritePartitionTable.ahk" { pHalIoWritePartitionTable }
#Import ".\pHalStartMirroring.ahk" { pHalStartMirroring }
#Import ".\pHalMirrorVerify.ahk" { pHalMirrorVerify }
#Import ".\pHalGetDmaAdapter.ahk" { pHalGetDmaAdapter }
#Import ".\pHalSetPciErrorHandlerCallback.ahk" { pHalSetPciErrorHandlerCallback }
#Import ".\pHalIoSetPartitionInformation.ahk" { pHalIoSetPartitionInformation }
#Import ".\pHalReferenceBusHandler.ahk" { pHalReferenceBusHandler }
#Import ".\pHalInitPowerManagement.ahk" { pHalInitPowerManagement }
#Import ".\pHalQueryBusSlots.ahk" { pHalQueryBusSlots }
#Import ".\pHalEndOfBoot.ahk" { pHalEndOfBoot }
#Import ".\pHalGetAcpiTable.ahk" { pHalGetAcpiTable }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct HAL_DISPATCH {
    #StructPack 8

    Version : UInt32

    HalQuerySystemInformation : pHalQuerySystemInformation

    HalSetSystemInformation : pHalSetSystemInformation

    HalQueryBusSlots : pHalQueryBusSlots

    Spare1 : UInt32

    HalExamineMBR : pHalExamineMBR

    HalIoReadPartitionTable : pHalIoReadPartitionTable

    HalIoSetPartitionInformation : pHalIoSetPartitionInformation

    HalIoWritePartitionTable : pHalIoWritePartitionTable

    HalReferenceHandlerForBus : pHalHandlerForBus

    HalReferenceBusHandler : pHalReferenceBusHandler

    HalDereferenceBusHandler : pHalReferenceBusHandler

    HalInitPnpDriver : pHalInitPnpDriver

    HalInitPowerManagement : pHalInitPowerManagement

    HalGetDmaAdapter : pHalGetDmaAdapter

    HalGetInterruptTranslator : pHalGetInterruptTranslator

    HalStartMirroring : pHalStartMirroring

    HalEndMirroring : pHalEndMirroring

    HalMirrorPhysicalMemory : pHalMirrorPhysicalMemory

    HalEndOfBoot : pHalEndOfBoot

    HalMirrorVerify : pHalMirrorVerify

    HalGetCachedAcpiTable : pHalGetAcpiTable

    HalSetPciErrorHandlerCallback : pHalSetPciErrorHandlerCallback

    HalGetPrmCache : pHalGetPrmCache

}
