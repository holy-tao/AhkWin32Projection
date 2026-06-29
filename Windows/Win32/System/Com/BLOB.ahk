#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The BLOB structure (nspapi.h), which is derived from Binary Large Object, contains information about a block of data.
 * @remarks
 * The structure name 
 * <b>BLOB</b> comes from the acronym BLOB, which stands for Binary Large Object.
 * 
 * This structure does not describe the nature of the data pointed to by <b>pBlobData</b>.
 * 
 * <div class="alert"><b>Note</b>  Windows Sockets defines a similar 
 * <b>BLOB</b> structure in Wtypes.h. Using both header files in the same source code file creates redefinition–compile time errors.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/nspapi/ns-nspapi-blob
 * @namespace Windows.Win32.System.Com
 */
export default struct BLOB {
    #StructPack 8

    /**
     * Size of the block of data pointed to by <b>pBlobData</b>, in bytes.
     */
    cbSize : UInt32

    /**
     * Pointer to a block of data.
     */
    pBlobData : IntPtr

}
