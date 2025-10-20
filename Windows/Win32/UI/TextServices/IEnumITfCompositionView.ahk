#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumITfCompositionView interface is implemented by the TSF manager to provide an enumeration of composition view objects.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-ienumitfcompositionview
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class IEnumITfCompositionView extends IUnknown{
    /**
     * The interface identifier for IEnumITfCompositionView
     * @type {Guid}
     */
    static IID => Guid("{5efd22ba-7838-46cb-88e2-cadb14124f8f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IEnumITfCompositionView>} ppEnum 
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
     * @param {Pointer<ITfCompositionView>} rgCompositionView 
     * @param {Pointer<UInt32>} pcFetched 
     * @returns {HRESULT} 
     */
    Next(ulCount, rgCompositionView, pcFetched) {
        result := ComCall(4, this, "uint", ulCount, "ptr", rgCompositionView, "uint*", pcFetched, "int")
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
