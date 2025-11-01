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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetType", "GetDataType", "GetData", "OnTextUpdated", "Shrink", "Divide", "Clone", "GetPropertyRangeCreator", "Serialize"]

    /**
     * 
     * @param {Pointer<Guid>} pguid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfpropertystore-gettype
     */
    GetType(pguid) {
        result := ComCall(3, this, "ptr", pguid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfpropertystore-getdatatype
     */
    GetDataType(pdwReserved) {
        pdwReservedMarshal := pdwReserved is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwReservedMarshal, pdwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfpropertystore-getdata
     */
    GetData(pvarValue) {
        result := ComCall(5, this, "ptr", pvarValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {ITfRange} pRangeNew 
     * @param {Pointer<BOOL>} pfAccept 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfpropertystore-ontextupdated
     */
    OnTextUpdated(dwFlags, pRangeNew, pfAccept) {
        result := ComCall(6, this, "uint", dwFlags, "ptr", pRangeNew, "ptr", pfAccept, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITfRange} pRangeNew 
     * @param {Pointer<BOOL>} pfFree 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfpropertystore-shrink
     */
    Shrink(pRangeNew, pfFree) {
        result := ComCall(7, this, "ptr", pRangeNew, "ptr", pfFree, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITfRange} pRangeThis 
     * @param {ITfRange} pRangeNew 
     * @param {Pointer<ITfPropertyStore>} ppPropStore 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfpropertystore-divide
     */
    Divide(pRangeThis, pRangeNew, ppPropStore) {
        result := ComCall(8, this, "ptr", pRangeThis, "ptr", pRangeNew, "ptr*", ppPropStore, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITfPropertyStore>} pPropStore 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfpropertystore-clone
     */
    Clone(pPropStore) {
        result := ComCall(9, this, "ptr*", pPropStore, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pclsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfpropertystore-getpropertyrangecreator
     */
    GetPropertyRangeCreator(pclsid) {
        result := ComCall(10, this, "ptr", pclsid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} pStream 
     * @param {Pointer<Integer>} pcb 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfpropertystore-serialize
     */
    Serialize(pStream, pcb) {
        pcbMarshal := pcb is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "ptr", pStream, pcbMarshal, pcb, "HRESULT")
        return result
    }
}
