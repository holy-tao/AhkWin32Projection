#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\ITfPropertyStore.ahk
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
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfpropertystore-gettype
     */
    GetType() {
        pguid := Guid()
        result := ComCall(3, this, "ptr", pguid, "HRESULT")
        return pguid
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfpropertystore-getdatatype
     */
    GetDataType() {
        result := ComCall(4, this, "uint*", &pdwReserved := 0, "HRESULT")
        return pdwReserved
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfpropertystore-getdata
     */
    GetData() {
        pvarValue := VARIANT()
        result := ComCall(5, this, "ptr", pvarValue, "HRESULT")
        return pvarValue
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {ITfRange} pRangeNew 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfpropertystore-ontextupdated
     */
    OnTextUpdated(dwFlags, pRangeNew) {
        result := ComCall(6, this, "uint", dwFlags, "ptr", pRangeNew, "int*", &pfAccept := 0, "HRESULT")
        return pfAccept
    }

    /**
     * 
     * @param {ITfRange} pRangeNew 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfpropertystore-shrink
     */
    Shrink(pRangeNew) {
        result := ComCall(7, this, "ptr", pRangeNew, "int*", &pfFree := 0, "HRESULT")
        return pfFree
    }

    /**
     * 
     * @param {ITfRange} pRangeThis 
     * @param {ITfRange} pRangeNew 
     * @returns {ITfPropertyStore} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfpropertystore-divide
     */
    Divide(pRangeThis, pRangeNew) {
        result := ComCall(8, this, "ptr", pRangeThis, "ptr", pRangeNew, "ptr*", &ppPropStore := 0, "HRESULT")
        return ITfPropertyStore(ppPropStore)
    }

    /**
     * 
     * @returns {ITfPropertyStore} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfpropertystore-clone
     */
    Clone() {
        result := ComCall(9, this, "ptr*", &pPropStore := 0, "HRESULT")
        return ITfPropertyStore(pPropStore)
    }

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfpropertystore-getpropertyrangecreator
     */
    GetPropertyRangeCreator() {
        pclsid := Guid()
        result := ComCall(10, this, "ptr", pclsid, "HRESULT")
        return pclsid
    }

    /**
     * 
     * @param {IStream} pStream 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfpropertystore-serialize
     */
    Serialize(pStream) {
        result := ComCall(11, this, "ptr", pStream, "uint*", &pcb := 0, "HRESULT")
        return pcb
    }
}
