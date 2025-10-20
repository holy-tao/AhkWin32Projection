#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Guid>} guidProp 
     * @param {Pointer<ITfRange>} pRange 
     * @param {Pointer<ITfPropertyStore>} pPropStore 
     * @param {Pointer<BOOL>} pfSerializable 
     * @returns {HRESULT} 
     */
    IsStoreSerializable(guidProp, pRange, pPropStore, pfSerializable) {
        result := ComCall(3, this, "ptr", guidProp, "ptr", pRange, "ptr", pPropStore, "ptr", pfSerializable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates an empty property store object.
     * @param {Pointer<Guid>} guidProp 
     * @param {Pointer<ITfRange>} pRange 
     * @param {Integer} cb 
     * @param {Pointer<IStream>} pStream 
     * @param {Pointer<ITfPropertyStore>} ppStore Receives a pointer to the <b>IPropertyStore</b> interface. The caller must release the interface.
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-createpropertystore
     */
    CreatePropertyStore(guidProp, pRange, cb, pStream, ppStore) {
        result := ComCall(4, this, "ptr", guidProp, "ptr", pRange, "uint", cb, "ptr", pStream, "ptr", ppStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
