#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMClientSideExtension interface supports methods that allow you to query client-side extension properties when you use the Group Policy Management Console (GPMC) interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmclientsideextension
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMClientSideExtension extends IDispatch{
    /**
     * The interface identifier for IGPMClientSideExtension
     * @type {Guid}
     */
    static IID => Guid("{69da7488-b8db-415e-9266-901be4d49928}")

    /**
     * The class identifier for GPMClientSideExtension
     * @type {Guid}
     */
    static CLSID => Guid("{c1a2e70e-659c-4b1a-940b-f88b0af9c8a4}")

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
    get_ID(pVal) {
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
    get_DisplayName(pVal) {
        result := ComCall(8, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pvbEnabled 
     * @returns {HRESULT} 
     */
    IsUserEnabled(pvbEnabled) {
        result := ComCall(9, this, "ptr", pvbEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pvbEnabled 
     * @returns {HRESULT} 
     */
    IsComputerEnabled(pvbEnabled) {
        result := ComCall(10, this, "ptr", pvbEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
