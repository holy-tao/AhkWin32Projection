#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_QUERYSTATSTICS_PAGING_FAULT extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_COUNTER>}
     */
    Faults {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_COUNTER>}
     */
    FaultsFirstTimeAccess {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_COUNTER>}
     */
    FaultsReclaimed {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_COUNTER>}
     */
    FaultsMigration {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_COUNTER>}
     */
    FaultsIncorrectResource {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_COUNTER>}
     */
    FaultsLostContent {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_COUNTER>}
     */
    FaultsEvicted {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_COUNTER>}
     */
    AllocationsMEM_RESET {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_COUNTER>}
     */
    AllocationsUnresetSuccess {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_COUNTER>}
     */
    AllocationsUnresetFail {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    AllocationsUnresetSuccessRead {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    AllocationsUnresetFailRead {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_COUNTER>}
     */
    Evictions {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_COUNTER>}
     */
    EvictionsDueToPreparation {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_COUNTER>}
     */
    EvictionsDueToLock {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_COUNTER>}
     */
    EvictionsDueToClose {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_COUNTER>}
     */
    EvictionsDueToPurge {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_COUNTER>}
     */
    EvictionsDueToSuspendCPUAccess {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }
}
