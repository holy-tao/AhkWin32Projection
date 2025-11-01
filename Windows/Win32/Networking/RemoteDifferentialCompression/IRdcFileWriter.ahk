#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRdcFileReader.ahk

/**
 * Abstract interface to read from and write to a file.
 * @see https://docs.microsoft.com/windows/win32/api//msrdc/nn-msrdc-irdcfilewriter
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
     * 
     * @param {Integer} offsetFileStart 
     * @param {Integer} bytesToWrite 
     * @param {Pointer<Integer>} buffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcfilewriter-write
     */
    Write(offsetFileStart, bytesToWrite, buffer) {
        result := ComCall(6, this, "uint", offsetFileStart, "uint", bytesToWrite, "char*", buffer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcfilewriter-truncate
     */
    Truncate() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msrdc/nf-msrdc-irdcfilewriter-deleteonclose
     */
    DeleteOnClose() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
