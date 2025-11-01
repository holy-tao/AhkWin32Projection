#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintReadStream extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintReadStream
     * @type {Guid}
     */
    static IID => Guid("{4d47a67c-66cc-4430-850e-daf466fe5bc4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Seek", "ReadBytes"]

    /**
     * 
     * @param {Integer} dlibMove 
     * @param {Integer} dwOrigin 
     * @param {Pointer<Integer>} plibNewPosition 
     * @returns {HRESULT} 
     */
    Seek(dlibMove, dwOrigin, plibNewPosition) {
        plibNewPositionMarshal := plibNewPosition is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "int64", dlibMove, "uint", dwOrigin, plibNewPositionMarshal, plibNewPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pvBuffer 
     * @param {Integer} cbRequested 
     * @param {Pointer<Integer>} pcbRead 
     * @param {Pointer<BOOL>} pbEndOfFile 
     * @returns {HRESULT} 
     */
    ReadBytes(pvBuffer, cbRequested, pcbRead, pbEndOfFile) {
        pcbReadMarshal := pcbRead is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pvBuffer, "uint", cbRequested, pcbReadMarshal, pcbRead, "ptr", pbEndOfFile, "HRESULT")
        return result
    }
}
