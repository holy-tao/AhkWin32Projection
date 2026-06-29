#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\PFLT_VOLUME.ahk
#Include .\FLT_FILE_NAME_INFORMATION.ahk
#Include .\PFLT_INSTANCE.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
class FLT_CREATEFILE_TARGET_ECP_CONTEXT extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {PFLT_INSTANCE}
     */
    Instance {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {PFLT_VOLUME}
     */
    Volume {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<FLT_FILE_NAME_INFORMATION>}
     */
    FileNameInformation {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }
}
