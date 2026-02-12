#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRdcFileReader.ahk

/**
 * Abstract interface to read from and write to a file.
 * @see https://learn.microsoft.com/windows/win32/api//content/msrdc/nn-msrdc-irdcfilewriter
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class IRdcFileWriter extends IRdcFileReader{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRdcFileWriter
     * @type {Guid}
     */
    static IID => Guid("{96236a75-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Write", "Truncate", "DeleteOnClose"]

    /**
     * Write bytes to a file starting at a given offset.
     * @param {Integer} offsetFileStart Starting offset.
     * @param {Integer} bytesToWrite Number of bytes to be written to the file.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/msrdc/nf-msrdc-irdcfilewriter-write
     */
    Write(offsetFileStart, bytesToWrite) {
        result := ComCall(6, this, "uint", offsetFileStart, "uint", bytesToWrite, "char*", &buffer_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return buffer_
    }

    /**
     * Truncates a file to zero length.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/msrdc/nf-msrdc-irdcfilewriter-truncate
     */
    Truncate() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets a file to be deleted (or truncated) on close.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/msrdc/nf-msrdc-irdcfilewriter-deleteonclose
     */
    DeleteOnClose() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
