#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsCaseIgnoreList interface provides methods for an ADSI client to access the Case Ignore List attribute. You can call the property methods of this interface to obtain and modify the attribute.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadscaseignorelist
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsCaseIgnoreList extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsCaseIgnoreList
     * @type {Guid}
     */
    static IID => Guid("{7b66b533-4680-11d1-a3b4-00c04fb950dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CaseIgnoreList", "put_CaseIgnoreList"]

    /**
     * 
     * @returns {VARIANT} 
     */
    get_CaseIgnoreList() {
        retval := VARIANT()
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vCaseIgnoreList 
     * @returns {HRESULT} 
     */
    put_CaseIgnoreList(vCaseIgnoreList) {
        result := ComCall(8, this, "ptr", vCaseIgnoreList, "HRESULT")
        return result
    }
}
