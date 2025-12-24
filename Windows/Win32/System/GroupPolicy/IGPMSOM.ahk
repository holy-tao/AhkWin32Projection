#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IGPMGPOLink.ahk
#Include .\IGPMGPOLinksCollection.ahk
#Include .\IGPMSecurityInfo.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMSOM interface contains methods that allow you to create and retrieve GPO links for a scope of management (SOM), and to set and retrieve security attributes and various properties for a SOM. A SOM can be a site, domain or OU.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmsom
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMSOM extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMSOM
     * @type {Guid}
     */
    static IID => Guid("{c0a7f09e-05a1-4f0c-8158-9e5c33684f6b}")

    /**
     * The class identifier for GPMSOM
     * @type {Guid}
     */
    static CLSID => Guid("{32d93fac-450e-44cf-829c-8b22ff6bdae1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_GPOInheritanceBlocked", "put_GPOInheritanceBlocked", "get_Name", "get_Path", "CreateGPOLink", "get_Type", "GetGPOLinks", "GetInheritedGPOLinks", "GetSecurityInfo", "SetSecurityInfo"]

    /**
     * @type {VARIANT_BOOL} 
     */
    GPOInheritanceBlocked {
        get => this.get_GPOInheritanceBlocked()
        set => this.put_GPOInheritanceBlocked(value)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_GPOInheritanceBlocked() {
        result := ComCall(7, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     */
    put_GPOInheritanceBlocked(newVal) {
        result := ComCall(8, this, "short", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        pVal := BSTR()
        result := ComCall(9, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Path() {
        pVal := BSTR()
        result := ComCall(10, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Links the specified GPO to the specified position in the list of GPOs that are linked to a particular SOM.
     * @param {Integer} lLinkPos Position in which the GPO should be linked. The position is 1-based. If this parameter is – 1, the GPO is appended to the end of the list. If the position specified is greater than the current number of GPO links, the method fails and returns <b>E_INVALIDARG</b>.
     * @param {IGPMGPO} pGPO GPO to link.
     * @returns {IGPMGPOLink} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmgpolink">IGPMGPOLink</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpmsom-creategpolink
     */
    CreateGPOLink(lLinkPos, pGPO) {
        result := ComCall(11, this, "int", lLinkPos, "ptr", pGPO, "ptr*", &ppNewGPOLink := 0, "HRESULT")
        return IGPMGPOLink(ppNewGPOLink)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        result := ComCall(12, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Returns a GPMGPOLinksCollection object that contains the GPO links for the scope of management (SOM). The collection is sorted in the SOM link order and contains both enabled and disabled links. See IGPMGPOLink for the definition of SOM link order.
     * @returns {IGPMGPOLinksCollection} Address of a pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmgpolinkscollection">IGPMGPOLinksCollection</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpmsom-getgpolinks
     */
    GetGPOLinks() {
        result := ComCall(13, this, "ptr*", &ppGPOLinks := 0, "HRESULT")
        return IGPMGPOLinksCollection(ppGPOLinks)
    }

    /**
     * Returns a GPOLinksCollection object that contains the GPO links that are applied to the scope of management (SOM), including links inherited from parent containers (OUs and domains).
     * @returns {IGPMGPOLinksCollection} Address of a pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmgpolinkscollection">IGPMGPOLinksCollection</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpmsom-getinheritedgpolinks
     */
    GetInheritedGPOLinks() {
        result := ComCall(14, this, "ptr*", &ppGPOLinks := 0, "HRESULT")
        return IGPMGPOLinksCollection(ppGPOLinks)
    }

    /**
     * Returns an object that represents the collection of GPMPermission objects for the scope of management (SOM).
     * @returns {IGPMSecurityInfo} Address of a pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmsecurityinfo">IGPMSecurityInfo</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpmsom-getsecurityinfo
     */
    GetSecurityInfo() {
        result := ComCall(15, this, "ptr*", &ppSecurityInfo := 0, "HRESULT")
        return IGPMSecurityInfo(ppSecurityInfo)
    }

    /**
     * Sets the list of permissions for the scope of management (SOM) to that of the specified object.
     * @param {IGPMSecurityInfo} pSecurityInfo Pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmsecurityinfo">IGPMSecurityInfo</a> interface.
     * @returns {HRESULT} <h3>JScript</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * 
     * <h3>VB</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nf-gpmgmt-igpmsom-setsecurityinfo
     */
    SetSecurityInfo(pSecurityInfo) {
        result := ComCall(16, this, "ptr", pSecurityInfo, "HRESULT")
        return result
    }
}
