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
     * ITfPropertyStore::GetType method
     * @returns {Guid} Pointer to a <b>GUID</b> value that receives the property identifier.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfpropertystore-gettype
     */
    GetType() {
        pguid := Guid()
        result := ComCall(3, this, "ptr", pguid, "HRESULT")
        return pguid
    }

    /**
     * ITfPropertyStore::GetDataType method
     * @returns {Integer} Pointer to a <b>DWORD</b> value the receives the data type. This parameter is reserved and must be set to zero.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfpropertystore-getdatatype
     */
    GetDataType() {
        result := ComCall(4, this, "uint*", &pdwReserved := 0, "HRESULT")
        return pdwReserved
    }

    /**
     * ITfPropertyStore::GetData method
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> value that receives property data.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfpropertystore-getdata
     */
    GetData() {
        pvarValue := VARIANT()
        result := ComCall(5, this, "ptr", pvarValue, "HRESULT")
        return pvarValue
    }

    /**
     * ITfPropertyStore::OnTextUpdated method
     * @param {Integer} dwFlags Contains a set of flags that provide additional information about the text change. This can be zero or the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_TU_CORRECTION"></a><a id="tf_tu_correction"></a><dl>
     * <dt><b>TF_TU_CORRECTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The text change is the result of a correction. This implies that the semantics of the text have not changed. An example of this is when the spelling checker corrects a misspelled word.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {ITfRange} pRangeNew Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> interface that contains the range of text modified.
     * @returns {BOOL} Pointer to a <b>BOOL</b> variable that receives a value that indicates if the property store should be retained. Receives a nonzero value if the property store should be retained or zero if the property store should be discarded. If the property store is discarded, the TSF manager will set the property value to VT_EMPTY and release the property store.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfpropertystore-ontextupdated
     */
    OnTextUpdated(dwFlags, pRangeNew) {
        result := ComCall(6, this, "uint", dwFlags, "ptr", pRangeNew, "int*", &pfAccept := 0, "HRESULT")
        return pfAccept
    }

    /**
     * ITfPropertyStore::Shrink method
     * @param {ITfRange} pRangeNew Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> interface that contains the truncated range.
     * @returns {BOOL} Pointer to a <b>BOOL</b> variable that receives a value that indicates if the property store should be retained. Receives a nonzero value if the property store should be retained or zero if the property store should be discarded. If the property store is discarded, the TSF manager will set the property value to VT_EMPTY and release the property store.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfpropertystore-shrink
     */
    Shrink(pRangeNew) {
        result := ComCall(7, this, "ptr", pRangeNew, "int*", &pfFree := 0, "HRESULT")
        return pfFree
    }

    /**
     * ITfPropertyStore::Divide method
     * @param {ITfRange} pRangeThis Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that contains the range that the property store now covers. This will be the range of text closest to the beginning of the context.
     * @param {ITfRange} pRangeNew Pointer to an <i>ITfRange</i> object that contains the range that the new property store will cover. This will be the range of text closest to the end of the context.
     * @returns {ITfPropertyStore} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfpropertystore">ITfPropertyStore</a> interface pointer that receives a new property store object that will cover the range specified by <i>pRangeNew</i>.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfpropertystore-divide
     */
    Divide(pRangeThis, pRangeNew) {
        result := ComCall(8, this, "ptr", pRangeThis, "ptr", pRangeNew, "ptr*", &ppPropStore := 0, "HRESULT")
        return ITfPropertyStore(ppPropStore)
    }

    /**
     * ITfPropertyStore::Clone method
     * @returns {ITfPropertyStore} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfpropertystore">ITfPropertyStore</a> interface pointer that receives the new property store object.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfpropertystore-clone
     */
    Clone() {
        result := ComCall(9, this, "ptr*", &pPropStore := 0, "HRESULT")
        return ITfPropertyStore(pPropStore)
    }

    /**
     * ITfPropertyStore::GetPropertyRangeCreator method
     * @returns {Guid} Pointer to a <b>CLSID</b> that receives the class identifier of the registered text service that implements <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcreatepropertystore">ITfCreatePropertyStore</a>. The method can return CLSID_NULL for this parameter if property store persistence is unsupported.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfpropertystore-getpropertyrangecreator
     */
    GetPropertyRangeCreator() {
        pclsid := Guid()
        result := ComCall(10, this, "ptr", pclsid, "HRESULT")
        return pclsid
    }

    /**
     * ITfPropertyStore::Serialize method
     * @param {IStream} pStream Pointer to an <b>IStream</b> object that the property store data is written to.
     * @returns {Integer} Pointer to a <b>ULONG</b> value that receives the number of bytes written to the stream.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfpropertystore-serialize
     */
    Serialize(pStream) {
        result := ComCall(11, this, "ptr", pStream, "uint*", &pcb := 0, "HRESULT")
        return pcb
    }
}
