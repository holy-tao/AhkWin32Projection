#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrinterScriptableSequentialStream.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrinterScriptableStream extends IPrinterScriptableSequentialStream{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinterScriptableStream
     * @type {Guid}
     */
    static IID => Guid("{7edf9a92-4750-41a5-a17f-879a6f4f7dcb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Commit", "Seek", "SetSize"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Commit() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lOffset 
     * @param {Integer} streamSeek 
     * @param {Pointer<Integer>} plPosition 
     * @returns {HRESULT} 
     */
    Seek(lOffset, streamSeek, plPosition) {
        plPositionMarshal := plPosition is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, "int", lOffset, "uint", streamSeek, plPositionMarshal, plPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lSize 
     * @returns {HRESULT} 
     */
    SetSize(lSize) {
        result := ComCall(11, this, "int", lSize, "HRESULT")
        return result
    }
}
