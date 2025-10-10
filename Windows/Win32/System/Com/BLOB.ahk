#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The BLOB structure, derived from Binary Large Object, contains information about a block of data.
 * @remarks
 * 
  * The structure name 
  * <b>BLOB</b> comes from the acronym BLOB, which stands for Binary Large Object.
  * 
  * This structure does not describe the nature of the data pointed to by <b>pBlobData</b>.
  * 
  * <div class="alert"><b>Note</b>  Windows Sockets defines a similar 
  * <b>BLOB</b> structure in Wtypes.h. Using both header files in the same source code file creates redefinition–compile time errors.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winsock2/ns-winsock2-blob
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class BLOB extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Size of the block of data pointed to by <b>pBlobData</b>, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a block of data.
     * @type {Pointer<Byte>}
     */
    pBlobData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
