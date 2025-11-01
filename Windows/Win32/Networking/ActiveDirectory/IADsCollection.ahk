#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsCollection interface is a dual interface that enables its hosting ADSI object to define and manage an arbitrary set of named data elements for a directory service.
 * @remarks
 * 
  * Of the ADSI system providers, only the WinNT provider supports this interface to handle active file service sessions, resources and print jobs.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadscollection
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsCollection
     * @type {Guid}
     */
    static IID => Guid("{72b945e0-253b-11cf-a988-00aa006bc149}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "Add", "Remove", "GetObject"]

    /**
     * 
     * @param {Pointer<IUnknown>} ppEnumerator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadscollection-get__newenum
     */
    get__NewEnum(ppEnumerator) {
        result := ComCall(7, this, "ptr*", ppEnumerator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {VARIANT} vItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadscollection-add
     */
    Add(bstrName, vItem) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(8, this, "ptr", bstrName, "ptr", vItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrItemToBeRemoved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadscollection-remove
     */
    Remove(bstrItemToBeRemoved) {
        bstrItemToBeRemoved := bstrItemToBeRemoved is String ? BSTR.Alloc(bstrItemToBeRemoved).Value : bstrItemToBeRemoved

        result := ComCall(9, this, "ptr", bstrItemToBeRemoved, "HRESULT")
        return result
    }

    /**
     * The GetObject function retrieves information for the specified graphics object.
     * @param {BSTR} bstrName 
     * @param {Pointer<VARIANT>} pvItem 
     * @returns {HRESULT} If the function succeeds, and <i>lpvObject</i> is a valid pointer, the return value is the number of bytes stored into the buffer.
     * 
     * If the function succeeds, and <i>lpvObject</i> is <b>NULL</b>, the return value is the number of bytes required to hold the information the function would store into the buffer.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobject
     */
    GetObject(bstrName, pvItem) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(10, this, "ptr", bstrName, "ptr", pvItem, "HRESULT")
        return result
    }
}
