#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class FS_FILTER_CALLBACKS extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * @type {Integer}
     */
    SizeOfFsFilterCallbacks {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<PFS_FILTER_CALLBACK>}
     */
    PreAcquireForSectionSynchronization {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PFS_FILTER_COMPLETION_CALLBACK>}
     */
    PostAcquireForSectionSynchronization {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<PFS_FILTER_CALLBACK>}
     */
    PreReleaseForSectionSynchronization {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<PFS_FILTER_COMPLETION_CALLBACK>}
     */
    PostReleaseForSectionSynchronization {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PFS_FILTER_CALLBACK>}
     */
    PreAcquireForCcFlush {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<PFS_FILTER_COMPLETION_CALLBACK>}
     */
    PostAcquireForCcFlush {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<PFS_FILTER_CALLBACK>}
     */
    PreReleaseForCcFlush {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<PFS_FILTER_COMPLETION_CALLBACK>}
     */
    PostReleaseForCcFlush {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<PFS_FILTER_CALLBACK>}
     */
    PreAcquireForModifiedPageWriter {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<PFS_FILTER_COMPLETION_CALLBACK>}
     */
    PostAcquireForModifiedPageWriter {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer<PFS_FILTER_CALLBACK>}
     */
    PreReleaseForModifiedPageWriter {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<PFS_FILTER_COMPLETION_CALLBACK>}
     */
    PostReleaseForModifiedPageWriter {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<PFS_FILTER_CALLBACK>}
     */
    PreQueryOpen {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Pointer<PFS_FILTER_COMPLETION_CALLBACK>}
     */
    PostQueryOpen {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }
}
