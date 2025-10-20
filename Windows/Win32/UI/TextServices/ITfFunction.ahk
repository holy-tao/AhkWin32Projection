#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfFunction interface is the base interface for the individual function interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itffunction
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfFunction extends IUnknown{
    /**
     * The interface identifier for ITfFunction
     * @type {Guid}
     */
    static IID => Guid("{db593490-098f-11d3-8df0-00105a2799b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    GetDisplayName(pbstrName) {
        result := ComCall(3, this, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
