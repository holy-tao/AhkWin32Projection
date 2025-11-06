#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfContextOwnerCompositionSink interface is implemented by an application to receive composition-related notifications.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfcontextownercompositionsink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfContextOwnerCompositionSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfContextOwnerCompositionSink
     * @type {Guid}
     */
    static IID => Guid("{5f20aa40-b57a-4f34-96ab-3576f377cc79}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnStartComposition", "OnUpdateComposition", "OnEndComposition"]

    /**
     * 
     * @param {ITfCompositionView} pComposition 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextownercompositionsink-onstartcomposition
     */
    OnStartComposition(pComposition) {
        result := ComCall(3, this, "ptr", pComposition, "int*", &pfOk := 0, "HRESULT")
        return pfOk
    }

    /**
     * 
     * @param {ITfCompositionView} pComposition 
     * @param {ITfRange} pRangeNew 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextownercompositionsink-onupdatecomposition
     */
    OnUpdateComposition(pComposition, pRangeNew) {
        result := ComCall(4, this, "ptr", pComposition, "ptr", pRangeNew, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITfCompositionView} pComposition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextownercompositionsink-onendcomposition
     */
    OnEndComposition(pComposition) {
        result := ComCall(5, this, "ptr", pComposition, "HRESULT")
        return result
    }
}
