#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Provides additional information for in-memory BLOB subject types.
 * @see https://learn.microsoft.com/windows/win32/api/mssip/ns-mssip-ms_addinfo_blob
 * @namespace Windows.Win32.Security.Cryptography.Sip
 */
export default struct MS_ADDINFO_BLOB {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbStruct : UInt32

    /**
     * The size, in bytes, of the data in the <i>pbMemObject</i> member.
     */
    cbMemObject : UInt32

    /**
     * A pointer to the in-memory BLOB subject.
     */
    pbMemObject : IntPtr

    /**
     * The size, in bytes, of the data in the <i>pbMemSignedMsg</i> member.
     */
    cbMemSignedMsg : UInt32

    /**
     * A pointer to the signed message.
     */
    pbMemSignedMsg : IntPtr

}
