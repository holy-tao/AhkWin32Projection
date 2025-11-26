#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfPropertyStore.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfCreatePropertyStore interface is implemented by a text service to support persistence of property store data.
 * @remarks
 * 
 * When a property store is unserialized, the TSF manager creates an object from the CLSID obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfpropertystore-gettype">ITfPropertyStore::GetPropertyRangeCreator</a> and obtain an <b>ITfCreatePropertyStore</b> interface pointer from it. The manager then uses <b>ITfCreatePropertyStore::CreatePropertyStore</b> to create the property store object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfcreatepropertystore
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfCreatePropertyStore extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfCreatePropertyStore
     * @type {Guid}
     */
    static IID => Guid("{2463fbf0-b0af-11d2-afc5-00105a2799b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsStoreSerializable", "CreatePropertyStore"]

    /**
     * ITfCreatePropertyStore::IsStoreSerializable method
     * @param {Pointer<Guid>} guidProp Contains the type identifier of the property. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfpropertystore-gettype">ITfPropertyStore::GetType</a>.
     * @param {ITfRange} pRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that contains the text covered by the property store.
     * @param {ITfPropertyStore} pPropStore Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfpropertystore">ITfPropertyStore</a> object.
     * @returns {BOOL} Pointer to a <b>BOOL</b> that receives a flag that indicates if the property store can be serialized. Receives nonzero if the property store can be serialized or zero otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcreatepropertystore-isstoreserializable
     */
    IsStoreSerializable(guidProp, pRange, pPropStore) {
        result := ComCall(3, this, "ptr", guidProp, "ptr", pRange, "ptr", pPropStore, "int*", &pfSerializable := 0, "HRESULT")
        return pfSerializable
    }

    /**
     * ITfCreatePropertyStore::CreatePropertyStore method
     * @param {Pointer<Guid>} guidProp Contains the type identifier of the property. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfpropertystore-gettype">ITfPropertyStore::GetType</a>.
     * @param {ITfRange} pRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that contains the text to be covered by the property store.
     * @param {Integer} cb Contains the size, in bytes, of the property store data contained in <i>pStream</i>.
     * @param {IStream} pStream Pointer to an <b>IStream</b> object that contains the property store data.
     * @returns {ITfPropertyStore} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfpropertystore">ITfPropertyStore</a> interface pointer that receives the property store object created by this method.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcreatepropertystore-createpropertystore
     */
    CreatePropertyStore(guidProp, pRange, cb, pStream) {
        result := ComCall(4, this, "ptr", guidProp, "ptr", pRange, "uint", cb, "ptr", pStream, "ptr*", &ppStore := 0, "HRESULT")
        return ITfPropertyStore(ppStore)
    }
}
