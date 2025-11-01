#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class ISniffStream extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISniffStream
     * @type {Guid}
     */
    static IID => Guid("{4ef17940-30e0-11d0-b724-00aa006c1a01}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Init", "Peek"]

    /**
     * 
     * @param {IStream} pStream 
     * @returns {HRESULT} 
     */
    Init(pStream) {
        result := ComCall(3, this, "ptr", pStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pBuffer 
     * @param {Integer} nBytes 
     * @param {Pointer<Integer>} pnBytesRead 
     * @returns {HRESULT} 
     */
    Peek(pBuffer, nBytes, pnBytesRead) {
        pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"
        pnBytesReadMarshal := pnBytesRead is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pBufferMarshal, pBuffer, "uint", nBytes, pnBytesReadMarshal, pnBytesRead, "HRESULT")
        return result
    }
}
