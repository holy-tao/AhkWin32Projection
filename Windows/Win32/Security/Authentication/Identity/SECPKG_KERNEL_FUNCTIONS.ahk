#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_KERNEL_FUNCTIONS extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Pointer<PLSA_ALLOCATE_LSA_HEAP>}
     */
    AllocateHeap {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<PLSA_FREE_LSA_HEAP>}
     */
    FreeHeap {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PKSEC_CREATE_CONTEXT_LIST>}
     */
    CreateContextList {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<PKSEC_INSERT_LIST_ENTRY>}
     */
    InsertListEntry {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<PKSEC_REFERENCE_LIST_ENTRY>}
     */
    ReferenceListEntry {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PKSEC_DEREFERENCE_LIST_ENTRY>}
     */
    DereferenceListEntry {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<PKSEC_SERIALIZE_WINNT_AUTH_DATA>}
     */
    SerializeWinntAuthData {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<PKSEC_SERIALIZE_SCHANNEL_AUTH_DATA>}
     */
    SerializeSchannelAuthData {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<PKSEC_LOCATE_PKG_BY_ID>}
     */
    LocatePackageById {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
