#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrinterScriptableSequentialStream extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinterScriptableSequentialStream
     * @type {Guid}
     */
    static IID => Guid("{2072838a-316f-467a-a949-27f68c44a854}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Read", "Write"]

    /**
     * 
     * @param {Integer} cbRead 
     * @param {Pointer<IDispatch>} ppArray 
     * @returns {HRESULT} 
     */
    Read(cbRead, ppArray) {
        result := ComCall(7, this, "int", cbRead, "ptr*", ppArray, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} pArray 
     * @param {Pointer<Integer>} pcbWritten 
     * @returns {HRESULT} 
     */
    Write(pArray, pcbWritten) {
        result := ComCall(8, this, "ptr", pArray, "int*", pcbWritten, "HRESULT")
        return result
    }
}
