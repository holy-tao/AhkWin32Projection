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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Clone", "Next", "Reset", "Skip"]

    /**
     * 
     * @param {Pointer<IEnumITfCompositionView>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-ienumitfcompositionview-clone
     */
    Clone(ppEnum) {
        result := ComCall(3, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @param {Pointer<ITfCompositionView>} rgCompositionView 
     * @param {Pointer<Integer>} pcFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-ienumitfcompositionview-next
     */
    Next(ulCount, rgCompositionView, pcFetched) {
        result := ComCall(4, this, "uint", ulCount, "ptr*", rgCompositionView, "uint*", pcFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-ienumitfcompositionview-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-ienumitfcompositionview-skip
     */
    Skip(ulCount) {
        result := ComCall(6, this, "uint", ulCount, "HRESULT")
        return result
    }
}
