#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumTfContexts interface is implemented by the TSF manager to provide an enumeration of context objects.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-ienumtfcontexts
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class IEnumTfContexts extends IUnknown{
    /**
     * The interface identifier for IEnumTfContexts
     * @type {Guid}
     */
    static IID => Guid("{8f1a7ea6-1654-4502-a86e-b2902344d507}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IEnumTfContexts>} ppEnum 
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
     * @param {Pointer<ITfContext>} rgContext 
     * @param {Pointer<UInt32>} pcFetched 
     * @returns {HRESULT} 
     */
    Next(ulCount, rgContext, pcFetched) {
        result := ComCall(4, this, "uint", ulCount, "ptr", rgContext, "uint*", pcFetched, "int")
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
