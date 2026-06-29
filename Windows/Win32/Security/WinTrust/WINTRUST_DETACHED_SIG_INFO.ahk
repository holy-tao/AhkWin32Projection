#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WINTRUST_DETACHED_SIG_BLOBS.ahk
#Include .\WINTRUST_DETACHED_SIG_FILE_HANDLES.ahk

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
class WINTRUST_DETACHED_SIG_INFO extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwUnionChoice {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<WINTRUST_DETACHED_SIG_FILE_HANDLES>}
     */
    pDetachedSigHandles {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<WINTRUST_DETACHED_SIG_BLOBS>}
     */
    pDetachedSigBlobs {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
