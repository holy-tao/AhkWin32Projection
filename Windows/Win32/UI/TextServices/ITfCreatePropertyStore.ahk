#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import ".\ITfRange.ahk" { ITfRange }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITfPropertyStore.ahk" { ITfPropertyStore }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfCreatePropertyStore interface is implemented by a text service to support persistence of property store data.
 * @remarks
 * When a property store is unserialized, the TSF manager creates an object from the CLSID obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfpropertystore-gettype">ITfPropertyStore::GetPropertyRangeCreator</a> and obtain an <b>ITfCreatePropertyStore</b> interface pointer from it. The manager then uses <b>ITfCreatePropertyStore::CreatePropertyStore</b> to create the property store object.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfcreatepropertystore
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfCreatePropertyStore extends IUnknown {
    /**
     * The interface identifier for ITfCreatePropertyStore
     * @type {Guid}
     */
    static IID := Guid("{2463fbf0-b0af-11d2-afc5-00105a2799b5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfCreatePropertyStore interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsStoreSerializable : IntPtr
        CreatePropertyStore : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfCreatePropertyStore.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfCreatePropertyStore::IsStoreSerializable method
     * @param {Pointer<Guid>} guidProp Contains the type identifier of the property. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfpropertystore-gettype">ITfPropertyStore::GetType</a>.
     * @param {ITfRange} pRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that contains the text covered by the property store.
     * @param {ITfPropertyStore} pPropStore Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfpropertystore">ITfPropertyStore</a> object.
     * @returns {BOOL} Pointer to a <b>BOOL</b> that receives a flag that indicates if the property store can be serialized. Receives nonzero if the property store can be serialized or zero otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcreatepropertystore-isstoreserializable
     */
    IsStoreSerializable(guidProp, pRange, pPropStore) {
        result := ComCall(3, this, Guid.Ptr, guidProp, "ptr", pRange, "ptr", pPropStore, BOOL.Ptr, &pfSerializable := 0, "HRESULT")
        return pfSerializable
    }

    /**
     * ITfCreatePropertyStore::CreatePropertyStore method
     * @param {Pointer<Guid>} guidProp Contains the type identifier of the property. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfpropertystore-gettype">ITfPropertyStore::GetType</a>.
     * @param {ITfRange} pRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that contains the text to be covered by the property store.
     * @param {Integer} cb Contains the size, in bytes, of the property store data contained in <i>pStream</i>.
     * @param {IStream} pStream Pointer to an <b>IStream</b> object that contains the property store data.
     * @returns {ITfPropertyStore} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfpropertystore">ITfPropertyStore</a> interface pointer that receives the property store object created by this method.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcreatepropertystore-createpropertystore
     */
    CreatePropertyStore(guidProp, pRange, cb, pStream) {
        result := ComCall(4, this, Guid.Ptr, guidProp, "ptr", pRange, "uint", cb, "ptr", pStream, "ptr*", &ppStore := 0, "HRESULT")
        return ITfPropertyStore(ppStore)
    }

    Query(iid) {
        if (ITfCreatePropertyStore.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsStoreSerializable := CallbackCreate(GetMethod(implObj, "IsStoreSerializable"), flags, 5)
        this.vtbl.CreatePropertyStore := CallbackCreate(GetMethod(implObj, "CreatePropertyStore"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsStoreSerializable)
        CallbackFree(this.vtbl.CreatePropertyStore)
    }
}
