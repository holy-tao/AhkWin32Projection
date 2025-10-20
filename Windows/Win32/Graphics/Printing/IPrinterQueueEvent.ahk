#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrinterQueueEvent extends IDispatch{
    /**
     * The interface identifier for IPrinterQueueEvent
     * @type {Guid}
     */
    static IID => Guid("{214685f6-7b78-4681-87e0-495f739273d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {BSTR} bstrResponse 
     * @param {HRESULT} hrStatus 
     * @returns {HRESULT} 
     */
    OnBidiResponseReceived(bstrResponse, hrStatus) {
        bstrResponse := bstrResponse is String ? BSTR.Alloc(bstrResponse).Value : bstrResponse

        result := ComCall(7, this, "ptr", bstrResponse, "int", hrStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
