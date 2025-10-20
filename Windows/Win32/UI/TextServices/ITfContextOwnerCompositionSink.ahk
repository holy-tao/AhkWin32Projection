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
     * 
     * @param {Pointer<ITfCompositionView>} pComposition 
     * @param {Pointer<BOOL>} pfOk 
     * @returns {HRESULT} 
     */
    OnStartComposition(pComposition, pfOk) {
        result := ComCall(3, this, "ptr", pComposition, "ptr", pfOk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITfCompositionView>} pComposition 
     * @param {Pointer<ITfRange>} pRangeNew 
     * @returns {HRESULT} 
     */
    OnUpdateComposition(pComposition, pRangeNew) {
        result := ComCall(4, this, "ptr", pComposition, "ptr", pRangeNew, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITfCompositionView>} pComposition 
     * @returns {HRESULT} 
     */
    OnEndComposition(pComposition) {
        result := ComCall(5, this, "ptr", pComposition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
