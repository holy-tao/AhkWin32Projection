#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The CERT_SYSTEM_STORE_INFO structure contains information used by functions that work with system stores. Currently, no essential information is contained in this structure.
 * @remarks
 * Currently, no system store information is persisted.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_system_store_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_SYSTEM_STORE_INFO {
    #StructPack 4

    /**
     * Size of this structure in bytes.
     */
    cbSize : UInt32 := this.Size

}
