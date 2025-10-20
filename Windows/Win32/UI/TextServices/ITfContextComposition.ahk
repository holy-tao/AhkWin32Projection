#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfContextComposition interface is implemented by the TSF manager and is used by a text service to create and manipulate compositions. An instance of this interface is provided by ITfContext::QueryInterface with IID_ITfContextComposition.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfcontextcomposition
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfContextComposition extends IUnknown{
    /**
     * The interface identifier for ITfContextComposition
     * @type {Guid}
     */
    static IID => Guid("{d40c8aae-ac92-4fc7-9a11-0ee0e23aa39b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} ecWrite 
     * @param {Pointer<ITfRange>} pCompositionRange 
     * @param {Pointer<ITfCompositionSink>} pSink 
     * @param {Pointer<ITfComposition>} ppComposition 
     * @returns {HRESULT} 
     */
    StartComposition(ecWrite, pCompositionRange, pSink, ppComposition) {
        result := ComCall(3, this, "uint", ecWrite, "ptr", pCompositionRange, "ptr", pSink, "ptr", ppComposition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumITfCompositionView>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumCompositions(ppEnum) {
        result := ComCall(4, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ecRead 
     * @param {Pointer<ITfRange>} pTestRange 
     * @param {Pointer<IEnumITfCompositionView>} ppEnum 
     * @returns {HRESULT} 
     */
    FindComposition(ecRead, pTestRange, ppEnum) {
        result := ComCall(5, this, "uint", ecRead, "ptr", pTestRange, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ecWrite 
     * @param {Pointer<ITfCompositionView>} pComposition 
     * @param {Pointer<ITfCompositionSink>} pSink 
     * @param {Pointer<ITfComposition>} ppComposition 
     * @returns {HRESULT} 
     */
    TakeOwnership(ecWrite, pComposition, pSink, ppComposition) {
        result := ComCall(6, this, "uint", ecWrite, "ptr", pComposition, "ptr", pSink, "ptr", ppComposition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
