#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class HAL_DISPATCH extends Win32Struct
{
    static sizeof => 192

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<pHalQuerySystemInformation>}
     */
    HalQuerySystemInformation {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<pHalSetSystemInformation>}
     */
    HalSetSystemInformation {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<pHalQueryBusSlots>}
     */
    HalQueryBusSlots {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Spare1 {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Pointer<pHalExamineMBR>}
     */
    HalExamineMBR {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<pHalIoReadPartitionTable>}
     */
    HalIoReadPartitionTable {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<pHalIoSetPartitionInformation>}
     */
    HalIoSetPartitionInformation {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<pHalIoWritePartitionTable>}
     */
    HalIoWritePartitionTable {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<pHalHandlerForBus>}
     */
    HalReferenceHandlerForBus {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<pHalReferenceBusHandler>}
     */
    HalReferenceBusHandler {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer<pHalReferenceBusHandler>}
     */
    HalDereferenceBusHandler {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<pHalInitPnpDriver>}
     */
    HalInitPnpDriver {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<pHalInitPowerManagement>}
     */
    HalInitPowerManagement {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Pointer<pHalGetDmaAdapter>}
     */
    HalGetDmaAdapter {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<pHalGetInterruptTranslator>}
     */
    HalGetInterruptTranslator {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<pHalStartMirroring>}
     */
    HalStartMirroring {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * @type {Pointer<pHalEndMirroring>}
     */
    HalEndMirroring {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * @type {Pointer<pHalMirrorPhysicalMemory>}
     */
    HalMirrorPhysicalMemory {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * @type {Pointer<pHalEndOfBoot>}
     */
    HalEndOfBoot {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * @type {Pointer<pHalMirrorVerify>}
     */
    HalMirrorVerify {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * @type {Pointer<pHalGetAcpiTable>}
     */
    HalGetCachedAcpiTable {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * @type {Pointer<pHalSetPciErrorHandlerCallback>}
     */
    HalSetPciErrorHandlerCallback {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * @type {Pointer<pHalGetPrmCache>}
     */
    HalGetPrmCache {
        get => NumGet(this, 184, "ptr")
        set => NumPut("ptr", value, this, 184)
    }
}
