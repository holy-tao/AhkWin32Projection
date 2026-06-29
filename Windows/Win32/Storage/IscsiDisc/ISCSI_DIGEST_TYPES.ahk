#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * ISCSI_DIGEST_TYPES enumeration indicates the digest type.
 * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/ne-iscsidsc-iscsi_digest_types
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct ISCSI_DIGEST_TYPES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
