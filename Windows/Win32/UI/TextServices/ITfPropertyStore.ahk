#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfPropertyStore interface is implemented by a text service and used by the TSF manager to provide non-static property values. An instance of this interface is passed to ITfProperty::SetValueStore.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfpropertystore
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfPropertyStore extends IUnknown{
    /**
     * The interface identifier for ITfPropertyStore
     * @type {Guid}
     */
    static IID => Guid("{6834b120-88cb-11d2-bf45-00105a2799b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} pguid 
     * @returns {HRESULT} 
     */
    GetType(pguid) {
        result := ComCall(3, this, "ptr", pguid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwReserved 
     * @returns {HRESULT} 
     */
    GetDataType(pdwReserved) {
        result := ComCall(4, this, "uint*", pdwReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     */
    GetData(pvarValue) {
        result := ComCall(5, this, "ptr", pvarValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<ITfRange>} pRangeNew 
     * @param {Pointer<BOOL>} pfAccept 
     * @returns {HRESULT} 
     */
    OnTextUpdated(dwFlags, pRangeNew, pfAccept) {
        result := ComCall(6, this, "uint", dwFlags, "ptr", pRangeNew, "ptr", pfAccept, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITfRange>} pRangeNew 
     * @param {Pointer<BOOL>} pfFree 
     * @returns {HRESULT} 
     */
    Shrink(pRangeNew, pfFree) {
        result := ComCall(7, this, "ptr", pRangeNew, "ptr", pfFree, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITfRange>} pRangeThis 
     * @param {Pointer<ITfRange>} pRangeNew 
     * @param {Pointer<ITfPropertyStore>} ppPropStore 
     * @returns {HRESULT} 
     */
    Divide(pRangeThis, pRangeNew, ppPropStore) {
        result := ComCall(8, this, "ptr", pRangeThis, "ptr", pRangeNew, "ptr", ppPropStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITfPropertyStore>} pPropStore 
     * @returns {HRESULT} 
     */
    Clone(pPropStore) {
        result := ComCall(9, this, "ptr", pPropStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pclsid 
     * @returns {HRESULT} 
     */
    GetPropertyRangeCreator(pclsid) {
        result := ComCall(10, this, "ptr", pclsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} pStream 
     * @param {Pointer<UInt32>} pcb 
     * @returns {HRESULT} 
     */
    Serialize(pStream, pcb) {
        result := ComCall(11, this, "ptr", pStream, "uint*", pcb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
