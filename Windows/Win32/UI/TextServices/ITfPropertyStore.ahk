#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\ITfPropertyStore.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfPropertyStore interface is implemented by a text service and used by the TSF manager to provide non-static property values. An instance of this interface is passed to ITfProperty::SetValueStore.
 * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nn-msctf-itfpropertystore
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
     * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nf-msctf-itfpropertystore-gettype
     */
    GetType() {
        pguid := Guid()
        result := ComCall(3, this, "ptr", pguid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pguid
    }

    /**
     * ITfPropertyStore::GetDataType method
     * @returns {Integer} Pointer to a <b>DWORD</b> value the receives the data type. This parameter is reserved and must be set to zero.
     * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nf-msctf-itfpropertystore-getdatatype
     */
    GetDataType() {
        result := ComCall(4, this, "uint*", &pdwReserved := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwReserved
    }

    /**
     * ITfPropertyStore::GetData method
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> value that receives property data.
     * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nf-msctf-itfpropertystore-getdata
     */
    GetData() {
        pvarValue := VARIANT()
        result := ComCall(5, this, "ptr", pvarValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pvarValue
    }

    /**
     * ITfPropertyStore::OnTextUpdated method
     * @remarks
     * If this method returns any value other than S_OK, the property store is discarded.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nf-msctf-itfpropertystore-ontextupdated
     */
    OnTextUpdated(dwFlags, pRangeNew) {
        result := ComCall(6, this, "uint", dwFlags, "ptr", pRangeNew, "int*", &pfAccept := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfAccept
    }

    /**
     * ITfPropertyStore::Shrink method
     * @remarks
     * If this method returns a value other than S_OK, the property store is discarded.
     * @param {ITfRange} pRangeNew Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> interface that contains the truncated range.
     * @returns {BOOL} Pointer to a <b>BOOL</b> variable that receives a value that indicates if the property store should be retained. Receives a nonzero value if the property store should be retained or zero if the property store should be discarded. If the property store is discarded, the TSF manager will set the property value to VT_EMPTY and release the property store.
     * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nf-msctf-itfpropertystore-shrink
     */
    Shrink(pRangeNew) {
        result := ComCall(7, this, "ptr", pRangeNew, "int*", &pfFree := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfFree
    }

    /**
     * ITfPropertyStore::Divide method
     * @remarks
     * This method creates a new property store object to cover <i>pRangeNew</i> and returns the pointer to this object in <i>ppPropStore</i>. If no new property store is returned, the original property store is discarded and the property store for both ranges is set to empty.
     * 
     * If this method returns any value other than S_OK, the original property store is discarded.
     * @param {ITfRange} pRangeThis Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that contains the range that the property store now covers. This will be the range of text closest to the beginning of the context.
     * @param {ITfRange} pRangeNew Pointer to an <i>ITfRange</i> object that contains the range that the new property store will cover. This will be the range of text closest to the end of the context.
     * @returns {ITfPropertyStore} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfpropertystore">ITfPropertyStore</a> interface pointer that receives a new property store object that will cover the range specified by <i>pRangeNew</i>.
     * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nf-msctf-itfpropertystore-divide
     */
    Divide(pRangeThis, pRangeNew) {
        result := ComCall(8, this, "ptr", pRangeThis, "ptr", pRangeNew, "ptr*", &ppPropStore := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITfPropertyStore(ppPropStore)
    }

    /**
     * ITfPropertyStore::Clone method
     * @remarks
     * This method creates a new property store object and initializes the new object so that it will operate as an exact copy of the original property store object. The new object must be completely independent of the original object.
     * @returns {ITfPropertyStore} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfpropertystore">ITfPropertyStore</a> interface pointer that receives the new property store object.
     * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nf-msctf-itfpropertystore-clone
     */
    Clone() {
        result := ComCall(9, this, "ptr*", &pPropStore := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITfPropertyStore(pPropStore)
    }

    /**
     * ITfPropertyStore::GetPropertyRangeCreator method
     * @remarks
     * When the property store is unserialized, the TSF manager creates an object of this CLSID and obtains an <b>ITfCreatePropertyStore</b> interface pointer from it. The manager then uses the <b>ITfCreatePropertyStore</b> object to create the property store object.
     * @returns {Guid} Pointer to a <b>CLSID</b> that receives the class identifier of the registered text service that implements <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcreatepropertystore">ITfCreatePropertyStore</a>. The method can return CLSID_NULL for this parameter if property store persistence is unsupported.
     * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nf-msctf-itfpropertystore-getpropertyrangecreator
     */
    GetPropertyRangeCreator() {
        pclsid := Guid()
        result := ComCall(10, this, "ptr", pclsid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pclsid
    }

    /**
     * ITfPropertyStore::Serialize method
     * @remarks
     * The method must not move the stream insertion point before writing to the stream. The method must leave the insertion point at the end of the data written by the method.
     * @param {IStream} pStream Pointer to an <b>IStream</b> object that the property store data is written to.
     * @returns {Integer} Pointer to a <b>ULONG</b> value that receives the number of bytes written to the stream.
     * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nf-msctf-itfpropertystore-serialize
     */
    Serialize(pStream) {
        result := ComCall(11, this, "ptr", pStream, "uint*", &pcb := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcb
    }
}
