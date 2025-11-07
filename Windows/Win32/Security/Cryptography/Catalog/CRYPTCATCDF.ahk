#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HANDLE.ahk

/**
 * Contains information used to create a signed catalog file (.cat) from a catalog definition file (CDF).
 * @remarks
 * 
 * A parser can update <i>dwCurFilePos</i> and <i>dwLastMemberOffset</i> as it reads the CDF. A user-defined callback function can use this information for recoverable parse errors in the CDF.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mscat/ns-mscat-cryptcatcdf
 * @namespace Windows.Win32.Security.Cryptography.Catalog
 * @version v4.0.30319
 */
class CRYPTCATCDF extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A handle to the catalog definition file (.cdf).
     * @type {HANDLE}
     */
    hFile{
        get {
            if(!this.HasProp("__hFile"))
                this.__hFile := HANDLE(8, this)
            return this.__hFile
        }
    }

    /**
     * A value that specifies the current position of the parser measured in bytes from the beginning of the catalog definition file.
     * @type {Integer}
     */
    dwCurFilePos {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A value that specifies the number of bytes to the position of the last member parsed in the catalog definition file.
     * @type {Integer}
     */
    dwLastMemberOffset {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * An integer that indicates whether the parser finished reading the file. <b>TRUE</b> indicates that the last read operation returned zero bytes.
     * @type {BOOL}
     */
    fEOF {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * A pointer to a null-terminated string that contains the name of a directory where the catalog file (.cat) will be written.
     * @type {PWSTR}
     */
    pwszResultDir {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A handle to the catalog file (.cat).
     * @type {HANDLE}
     */
    hCATStore{
        get {
            if(!this.HasProp("__hCATStore"))
                this.__hCATStore := HANDLE(40, this)
            return this.__hCATStore
        }
    }
}
