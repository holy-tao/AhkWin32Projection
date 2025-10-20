#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrinterExtensionRequest extends IDispatch{
    /**
     * The interface identifier for IPrinterExtensionRequest
     * @type {Guid}
     */
    static IID => Guid("{39843bf3-c4d2-41fd-b4b2-aedbee5e1900}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {HRESULT} hrStatus 
     * @param {BSTR} bstrLogMessage 
     * @returns {HRESULT} 
     */
    Cancel(hrStatus, bstrLogMessage) {
        bstrLogMessage := bstrLogMessage is String ? BSTR.Alloc(bstrLogMessage).Value : bstrLogMessage

        result := ComCall(7, this, "int", hrStatus, "ptr", bstrLogMessage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Complete() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
