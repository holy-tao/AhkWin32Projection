#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrinterBidiSetRequestCallback extends IUnknown{
    /**
     * The interface identifier for IPrinterBidiSetRequestCallback
     * @type {Guid}
     */
    static IID => Guid("{c52d32dd-f2b4-4052-8502-ec4305ecb71f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {BSTR} bstrResponse 
     * @param {HRESULT} hrStatus 
     * @returns {HRESULT} 
     */
    Completed(bstrResponse, hrStatus) {
        bstrResponse := bstrResponse is String ? BSTR.Alloc(bstrResponse).Value : bstrResponse

        result := ComCall(3, this, "ptr", bstrResponse, "int", hrStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
