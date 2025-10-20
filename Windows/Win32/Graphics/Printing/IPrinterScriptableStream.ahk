#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrinterScriptableSequentialStream.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrinterScriptableStream extends IPrinterScriptableSequentialStream{
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
     * 
     * @returns {HRESULT} 
     */
    Commit() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lOffset 
     * @param {Integer} streamSeek 
     * @param {Pointer<Int32>} plPosition 
     * @returns {HRESULT} 
     */
    Seek(lOffset, streamSeek, plPosition) {
        result := ComCall(10, this, "int", lOffset, "uint", streamSeek, "int*", plPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lSize 
     * @returns {HRESULT} 
     */
    SetSize(lSize) {
        result := ComCall(11, this, "int", lSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
