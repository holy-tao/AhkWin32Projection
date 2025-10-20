#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMGPOLink interface supports methods that allow you to remove a GPO link from the scope of management (SOM), and to set and retrieve various properties of GPO links, including enabling and enforcing links.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmgpolink
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMGPOLink extends IDispatch{
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
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_GPOID(pVal) {
        result := ComCall(7, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_GPODomain(pVal) {
        result := ComCall(8, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     */
    get_Enabled(pVal) {
        result := ComCall(9, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     */
    put_Enabled(newVal) {
        result := ComCall(10, this, "short", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     */
    get_Enforced(pVal) {
        result := ComCall(11, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     */
    put_Enforced(newVal) {
        result := ComCall(12, this, "short", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lVal 
     * @returns {HRESULT} 
     */
    get_SOMLinkOrder(lVal) {
        result := ComCall(13, this, "int*", lVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IGPMSOM>} ppIGPMSOM 
     * @returns {HRESULT} 
     */
    get_SOM(ppIGPMSOM) {
        result := ComCall(14, this, "ptr", ppIGPMSOM, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
