#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfCompartment interface is implemented by the TSF manager and is used by clients (applications and text services) to obtain and set data in a TSF compartment.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfcompartment
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfCompartment extends IUnknown{
    /**
     * The interface identifier for ITfCompartment
     * @type {Guid}
     */
    static IID => Guid("{bb08f7a9-607a-4384-8623-056892b64371}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} tid 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     */
    SetValue(tid, pvarValue) {
        result := ComCall(3, this, "uint", tid, "ptr", pvarValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     */
    GetValue(pvarValue) {
        result := ComCall(4, this, "ptr", pvarValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
