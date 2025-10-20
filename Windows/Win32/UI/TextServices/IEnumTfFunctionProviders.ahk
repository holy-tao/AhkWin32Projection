#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumTfFunctionProviders interface is implemented by the TSF manager to provide an enumeration of function provider objects.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-ienumtffunctionproviders
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class IEnumTfFunctionProviders extends IUnknown{
    /**
     * The interface identifier for IEnumTfFunctionProviders
     * @type {Guid}
     */
    static IID => Guid("{e4b24db0-0990-11d3-8df0-00105a2799b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IEnumTfFunctionProviders>} ppEnum 
     * @returns {HRESULT} 
     */
    Clone(ppEnum) {
        result := ComCall(3, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @param {Pointer<ITfFunctionProvider>} ppCmdobj 
     * @param {Pointer<UInt32>} pcFetch 
     * @returns {HRESULT} 
     */
    Next(ulCount, ppCmdobj, pcFetch) {
        result := ComCall(4, this, "uint", ulCount, "ptr", ppCmdobj, "uint*", pcFetch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @returns {HRESULT} 
     */
    Skip(ulCount) {
        result := ComCall(6, this, "uint", ulCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
