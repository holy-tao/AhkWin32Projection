#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * ISCSI_DIGEST_TYPES enumeration indicates the digest type.
 * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/ne-iscsidsc-iscsi_digest_types
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 */
class ISCSI_DIGEST_TYPES extends Win32Enum{

    /**
     * No digest is in use for guaranteeing data integrity.
     * @type {Integer (Int32)}
     */
    static ISCSI_DIGEST_TYPE_NONE => 0

    /**
     * The digest for guaranteeing data integrity uses a 32-bit cyclic redundancy check.
     * @type {Integer (Int32)}
     */
    static ISCSI_DIGEST_TYPE_CRC32C => 1
}
