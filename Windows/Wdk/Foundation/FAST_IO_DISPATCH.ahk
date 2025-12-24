#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Foundation
 * @version v4.0.30319
 */
class FAST_IO_DISPATCH extends Win32Struct
{
    static sizeof => 224

    static packingSize => 8

    /**
     * @type {Integer}
     */
    SizeOfFastIoDispatch {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<FAST_IO_CHECK_IF_POSSIBLE>}
     */
    FastIoCheckIfPossible {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<FAST_IO_READ>}
     */
    FastIoRead {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<FAST_IO_WRITE>}
     */
    FastIoWrite {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<FAST_IO_QUERY_BASIC_INFO>}
     */
    FastIoQueryBasicInfo {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<FAST_IO_QUERY_STANDARD_INFO>}
     */
    FastIoQueryStandardInfo {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<FAST_IO_LOCK>}
     */
    FastIoLock {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<FAST_IO_UNLOCK_SINGLE>}
     */
    FastIoUnlockSingle {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<FAST_IO_UNLOCK_ALL>}
     */
    FastIoUnlockAll {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<FAST_IO_UNLOCK_ALL_BY_KEY>}
     */
    FastIoUnlockAllByKey {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<FAST_IO_DEVICE_CONTROL>}
     */
    FastIoDeviceControl {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer<FAST_IO_ACQUIRE_FILE>}
     */
    AcquireFileForNtCreateSection {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<FAST_IO_RELEASE_FILE>}
     */
    ReleaseFileForNtCreateSection {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<FAST_IO_DETACH_DEVICE>}
     */
    FastIoDetachDevice {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Pointer<FAST_IO_QUERY_NETWORK_OPEN_INFO>}
     */
    FastIoQueryNetworkOpenInfo {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer<FAST_IO_ACQUIRE_FOR_MOD_WRITE>}
     */
    AcquireForModWrite {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<FAST_IO_MDL_READ>}
     */
    MdlRead {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * @type {Pointer<FAST_IO_MDL_READ_COMPLETE>}
     */
    MdlReadComplete {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * @type {Pointer<FAST_IO_PREPARE_MDL_WRITE>}
     */
    PrepareMdlWrite {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * @type {Pointer<FAST_IO_MDL_WRITE_COMPLETE>}
     */
    MdlWriteComplete {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * @type {Pointer<FAST_IO_READ_COMPRESSED>}
     */
    FastIoReadCompressed {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * @type {Pointer<FAST_IO_WRITE_COMPRESSED>}
     */
    FastIoWriteCompressed {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * @type {Pointer<FAST_IO_MDL_READ_COMPLETE_COMPRESSED>}
     */
    MdlReadCompleteCompressed {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * @type {Pointer<FAST_IO_MDL_WRITE_COMPLETE_COMPRESSED>}
     */
    MdlWriteCompleteCompressed {
        get => NumGet(this, 184, "ptr")
        set => NumPut("ptr", value, this, 184)
    }

    /**
     * @type {Pointer<FAST_IO_QUERY_OPEN>}
     */
    FastIoQueryOpen {
        get => NumGet(this, 192, "ptr")
        set => NumPut("ptr", value, this, 192)
    }

    /**
     * @type {Pointer<FAST_IO_RELEASE_FOR_MOD_WRITE>}
     */
    ReleaseForModWrite {
        get => NumGet(this, 200, "ptr")
        set => NumPut("ptr", value, this, 200)
    }

    /**
     * @type {Pointer<FAST_IO_ACQUIRE_FOR_CCFLUSH>}
     */
    AcquireForCcFlush {
        get => NumGet(this, 208, "ptr")
        set => NumPut("ptr", value, this, 208)
    }

    /**
     * @type {Pointer<FAST_IO_RELEASE_FOR_CCFLUSH>}
     */
    ReleaseForCcFlush {
        get => NumGet(this, 216, "ptr")
        set => NumPut("ptr", value, this, 216)
    }
}
