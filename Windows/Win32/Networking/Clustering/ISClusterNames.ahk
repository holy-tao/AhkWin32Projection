#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusterNames extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISClusterNames
     * @type {Guid}
     */
    static IID => Guid("{f2e606ec-2631-11d1-89f1-00a0c90d061e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get__NewEnum", "Refresh", "get_Item", "get_DomainName"]

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(7, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varIndex 
     * @returns {BSTR} 
     */
    get_Item(varIndex) {
        pbstrClusterName := BSTR()
        result := ComCall(10, this, "ptr", varIndex, "ptr", pbstrClusterName, "HRESULT")
        return pbstrClusterName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DomainName() {
        pbstrDomainName := BSTR()
        result := ComCall(11, this, "ptr", pbstrDomainName, "HRESULT")
        return pbstrDomainName
    }
}
