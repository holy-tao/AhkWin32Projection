#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IGPMSOM.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMGPOLink interface supports methods that allow you to remove a GPO link from the scope of management (SOM), and to set and retrieve various properties of GPO links, including enabling and enforcing links.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmgpolink
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMGPOLink extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMGPOLink
     * @type {Guid}
     */
    static IID => Guid("{434b99bd-5de7-478a-809c-c251721df70c}")

    /**
     * The class identifier for GPMGPOLink
     * @type {Guid}
     */
    static CLSID => Guid("{c1df9880-5303-42c6-8a3c-0488e1bf7364}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_GPOID", "get_GPODomain", "get_Enabled", "put_Enabled", "get_Enforced", "put_Enforced", "get_SOMLinkOrder", "get_SOM", "Delete"]

    /**
     * @type {BSTR} 
     */
    GPOID {
        get => this.get_GPOID()
    }

    /**
     * @type {BSTR} 
     */
    GPODomain {
        get => this.get_GPODomain()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Enforced {
        get => this.get_Enforced()
        set => this.put_Enforced(value)
    }

    /**
     * @type {Integer} 
     */
    SOMLinkOrder {
        get => this.get_SOMLinkOrder()
    }

    /**
     * @type {IGPMSOM} 
     */
    SOM {
        get => this.get_SOM()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_GPOID() {
        pVal := BSTR()
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_GPODomain() {
        pVal := BSTR()
        result := ComCall(8, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Enabled() {
        result := ComCall(9, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     */
    put_Enabled(newVal) {
        result := ComCall(10, this, "short", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Enforced() {
        result := ComCall(11, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     */
    put_Enforced(newVal) {
        result := ComCall(12, this, "short", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SOMLinkOrder() {
        result := ComCall(13, this, "int*", &lVal := 0, "HRESULT")
        return lVal
    }

    /**
     * 
     * @returns {IGPMSOM} 
     */
    get_SOM() {
        result := ComCall(14, this, "ptr*", &ppIGPMSOM := 0, "HRESULT")
        return IGPMSOM(ppIGPMSOM)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmgpolink-delete
     */
    Delete() {
        result := ComCall(15, this, "HRESULT")
        return result
    }
}
