#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMClientSideExtension interface supports methods that allow you to query client-side extension properties when you use the Group Policy Management Console (GPMC) interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmclientsideextension
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMClientSideExtension extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ID", "get_DisplayName", "IsUserEnabled", "IsComputerEnabled"]

    /**
     * @type {BSTR} 
     */
    ID {
        get => this.get_ID()
    }

    /**
     * @type {BSTR} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ID() {
        pVal := BSTR()
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DisplayName() {
        pVal := BSTR()
        result := ComCall(8, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Checks whether the client-side extension can be called during the processing of user policy.
     * @returns {VARIANT_BOOL} Value that indicates whether the client-side extension can be called during the processing of user policy. If <b>VARIANT_TRUE</b>, the client-side extension is called during the processing of user policy, provided that there are policy settings for the client-side extension in the user portion of one or more of the applied GPOs.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpmclientsideextension-isuserenabled
     */
    IsUserEnabled() {
        result := ComCall(9, this, "short*", &pvbEnabled := 0, "HRESULT")
        return pvbEnabled
    }

    /**
     * Checks whether the client-side extension can be called during the processing of computer policy.
     * @returns {VARIANT_BOOL} Value that indicates whether the client-side extension can be called during the processing of computer policy. If <b>VARIANT_TRUE</b>, the client-side extension is called during the processing of computer policy, provided that there are policy settings for the client-side extension in the computer portion of one or more of the applied GPOs.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpmclientsideextension-iscomputerenabled
     */
    IsComputerEnabled() {
        result := ComCall(10, this, "short*", &pvbEnabled := 0, "HRESULT")
        return pvbEnabled
    }
}
