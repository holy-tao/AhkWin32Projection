#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Represents the collection of fax accounts on the fax server. It provides methods and properties for enumerating the accounts, retrieving a particular account, and reporting the total number of accounts.
 * @remarks
 * 
  * A default implementation of <b>IFaxAccounts</b> is provided as the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxaccounts">FaxAccounts</a> object. The interface and the object are supported only on Windows Vista or later.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxcomex/nn-faxcomex-ifaxaccounts
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IFaxAccounts extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFaxAccounts
     * @type {Guid}
     */
    static IID => Guid("{93ea8162-8be7-42d1-ae7b-ec74e2d989da}")

    /**
     * The class identifier for FaxAccounts
     * @type {Guid}
     */
    static CLSID => Guid("{da1f94aa-ee2c-47c0-8f4f-2a217075b76e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "get_Item", "get_Count"]

    /**
     * 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    get__NewEnum(ppUnk) {
        result := ComCall(7, this, "ptr*", ppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vIndex 
     * @param {Pointer<IFaxAccount>} pFaxAccount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccounts-get_item
     */
    get_Item(vIndex, pFaxAccount) {
        result := ComCall(8, this, "ptr", vIndex, "ptr*", pFaxAccount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/faxcomex/nf-faxcomex-ifaxaccounts-get_count
     */
    get_Count(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, plCountMarshal, plCount, "HRESULT")
        return result
    }
}
