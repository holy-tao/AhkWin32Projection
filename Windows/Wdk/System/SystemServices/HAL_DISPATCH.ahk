#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\pHalEndMirroring.ahk" { pHalEndMirroring }
#Import ".\pHalEndOfBoot.ahk" { pHalEndOfBoot }
#Import ".\pHalExamineMBR.ahk" { pHalExamineMBR }
#Import ".\pHalGetAcpiTable.ahk" { pHalGetAcpiTable }
#Import ".\pHalGetDmaAdapter.ahk" { pHalGetDmaAdapter }
#Import ".\pHalGetInterruptTranslator.ahk" { pHalGetInterruptTranslator }
#Import ".\pHalGetPrmCache.ahk" { pHalGetPrmCache }
#Import ".\pHalHandlerForBus.ahk" { pHalHandlerForBus }
#Import ".\pHalInitPnpDriver.ahk" { pHalInitPnpDriver }
#Import ".\pHalInitPowerManagement.ahk" { pHalInitPowerManagement }
#Import ".\pHalIoReadPartitionTable.ahk" { pHalIoReadPartitionTable }
#Import ".\pHalIoSetPartitionInformation.ahk" { pHalIoSetPartitionInformation }
#Import ".\pHalIoWritePartitionTable.ahk" { pHalIoWritePartitionTable }
#Import ".\pHalMirrorPhysicalMemory.ahk" { pHalMirrorPhysicalMemory }
#Import ".\pHalMirrorVerify.ahk" { pHalMirrorVerify }
#Import ".\pHalQueryBusSlots.ahk" { pHalQueryBusSlots }
#Import ".\pHalQuerySystemInformation.ahk" { pHalQuerySystemInformation }
#Import ".\pHalReferenceBusHandler.ahk" { pHalReferenceBusHandler }
#Import ".\pHalSetPciErrorHandlerCallback.ahk" { pHalSetPciErrorHandlerCallback }
#Import ".\pHalSetSystemInformation.ahk" { pHalSetSystemInformation }
#Import ".\pHalStartMirroring.ahk" { pHalStartMirroring }

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
