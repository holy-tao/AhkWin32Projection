#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrinterScriptableSequentialStream extends IDispatch{
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
     * 
     * @param {Integer} cbRead 
     * @param {Pointer<IDispatch>} ppArray 
     * @returns {HRESULT} 
     */
    Read(cbRead, ppArray) {
        result := ComCall(7, this, "int", cbRead, "ptr", ppArray, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} pArray 
     * @param {Pointer<Int32>} pcbWritten 
     * @returns {HRESULT} 
     */
    Write(pArray, pcbWritten) {
        result := ComCall(8, this, "ptr", pArray, "int*", pcbWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
