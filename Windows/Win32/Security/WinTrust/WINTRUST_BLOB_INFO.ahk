#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Used when calling WinVerifyTrust to verify a memory BLOB.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-wintrust_blob_info
 * @namespace Windows.Win32.Security.WinTrust
 */
class WINTRUST_BLOB_INFO extends Win32Struct {
    static sizeof => 64

    static packingSize => 8

    /**
     * The number of bytes in this structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The <b>GUID</b> of the SIP to load.
     * @type {Guid}
     */
    gSubject {
        get {
            if(!this.HasProp("__gSubject"))
                this.__gSubject := Guid(4, this)
            return this.__gSubject
        }
    }

    /**
     * A string that contains the name of the memory object pointed to by <b>pbMem</b>.
     * @type {PWSTR}
     */
    pcwszDisplayName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The length, in bytes, of the memory BLOB to be verified.
     * @type {Integer}
     */
    cbMemObject {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * A pointer to a memory BLOB to be verified.
     * @type {Pointer<Integer>}
     */
    pbMemObject {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * This member is reserved. Do not use it.
     * @type {Integer}
     */
    cbMemSignedMsg {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * This member is reserved. Do not use it.
     * @type {Pointer<Integer>}
     */
    pbMemSignedMsg {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
