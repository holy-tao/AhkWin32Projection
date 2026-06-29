#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Used when calling WinVerifyTrust to verify a memory BLOB.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-wintrust_blob_info
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct WINTRUST_BLOB_INFO {
    #StructPack 8

    /**
     * The number of bytes in this structure.
     */
    cbStruct : UInt32

    /**
     * The <b>GUID</b> of the SIP to load.
     */
    gSubject : Guid

    /**
     * A string that contains the name of the memory object pointed to by <b>pbMem</b>.
     */
    pcwszDisplayName : PWSTR

    /**
     * The length, in bytes, of the memory BLOB to be verified.
     */
    cbMemObject : UInt32

    /**
     * A pointer to a memory BLOB to be verified.
     */
    pbMemObject : IntPtr

    /**
     * This member is reserved. Do not use it.
     */
    cbMemSignedMsg : UInt32

    /**
     * This member is reserved. Do not use it.
     */
    pbMemSignedMsg : IntPtr

}
