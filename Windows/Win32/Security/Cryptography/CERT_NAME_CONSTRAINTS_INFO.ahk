#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CERT_NAME_CONSTRAINTS_INFO structure contains information about certificates that are specifically permitted or excluded from trust.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_name_constraints_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_NAME_CONSTRAINTS_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * <b>DWORD</b> indicating the number of subtrees in the <b>rgPermittedSubtree</b> array.
     * @type {Integer}
     */
    cPermittedSubtree {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_general_subtree">CERT_GENERAL_SUBTREE</a> structures, each identifying a permitted certificate name.
     * @type {Pointer<CERT_GENERAL_SUBTREE>}
     */
    rgPermittedSubtree {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * <b>DWORD</b> indicating the number of subtrees in the <b>rgExcludedSubtree</b> array.
     * @type {Integer}
     */
    cExcludedSubtree {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_general_subtree">CERT_GENERAL_SUBTREE</a> structures, each identifying an excluded certificate name.
     * @type {Pointer<CERT_GENERAL_SUBTREE>}
     */
    rgExcludedSubtree {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
