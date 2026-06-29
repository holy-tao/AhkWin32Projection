#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IGPMGPO.ahk" { IGPMGPO }
#Import ".\IGPMGPOLinksCollection.ahk" { IGPMGPOLinksCollection }
#Import ".\IGPMSecurityInfo.ahk" { IGPMSecurityInfo }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\IGPMGPOLink.ahk" { IGPMGPOLink }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\GPMSOMType.ahk" { GPMSOMType }

/**
 * The IGPMSOM interface contains methods that allow you to create and retrieve GPO links for a scope of management (SOM), and to set and retrieve security attributes and various properties for a SOM. A SOM can be a site, domain or OU.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmsom
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct IGPMSOM extends IDispatch {
    /**
     * The interface identifier for IGPMSOM
     * @type {Guid}
     */
    static IID := Guid("{c0a7f09e-05a1-4f0c-8158-9e5c33684f6b}")

    /**
     * The class identifier for GPMSOM
     * @type {Guid}
     */
    static CLSID := Guid("{32d93fac-450e-44cf-829c-8b22ff6bdae1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGPMSOM interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_GPOInheritanceBlocked : IntPtr
        put_GPOInheritanceBlocked : IntPtr
        get_Name                  : IntPtr
        get_Path                  : IntPtr
        CreateGPOLink             : IntPtr
        get_Type                  : IntPtr
        GetGPOLinks               : IntPtr
        GetInheritedGPOLinks      : IntPtr
        GetSecurityInfo           : IntPtr
        SetSecurityInfo           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGPMSOM.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @type {GPMSOMType} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_GPOInheritanceBlocked() {
        result := ComCall(7, this, VARIANT_BOOL.Ptr, &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     */
    put_GPOInheritanceBlocked(newVal) {
        result := ComCall(8, this, VARIANT_BOOL, newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        pVal := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Path() {
        pVal := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Links the specified GPO to the specified position in the list of GPOs that are linked to a particular SOM.
     * @remarks
     * Attempting to link a GPO to a particular SOM multiple times causes the method to fail with <b>ERROR_ALREADY_EXISTS</b>.
     * @param {Integer} lLinkPos Position in which the GPO should be linked. The position is 1-based. If this parameter is – 1, the GPO is appended to the end of the list. If the position specified is greater than the current number of GPO links, the method fails and returns <b>E_INVALIDARG</b>.
     * @param {IGPMGPO} pGPO GPO to link.
     * @returns {IGPMGPOLink} Address of a pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmgpolink">IGPMGPOLink</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmsom-creategpolink
     */
    CreateGPOLink(lLinkPos, pGPO) {
        result := ComCall(11, this, "int", lLinkPos, "ptr", pGPO, "ptr*", &ppNewGPOLink := 0, "HRESULT")
        return IGPMGPOLink(ppNewGPOLink)
    }

    /**
     * 
     * @returns {GPMSOMType} 
     */
    get_Type() {
        result := ComCall(12, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Returns a GPMGPOLinksCollection object that contains the GPO links for the scope of management (SOM). The collection is sorted in the SOM link order and contains both enabled and disabled links. See IGPMGPOLink for the definition of SOM link order.
     * @returns {IGPMGPOLinksCollection} Address of a pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmgpolinkscollection">IGPMGPOLinksCollection</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmsom-getgpolinks
     */
    GetGPOLinks() {
        result := ComCall(13, this, "ptr*", &ppGPOLinks := 0, "HRESULT")
        return IGPMGPOLinksCollection(ppGPOLinks)
    }

    /**
     * Returns a GPOLinksCollection object that contains the GPO links that are applied to the scope of management (SOM), including links inherited from parent containers (OUs and domains).
     * @returns {IGPMGPOLinksCollection} Address of a pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmgpolinkscollection">IGPMGPOLinksCollection</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmsom-getinheritedgpolinks
     */
    GetInheritedGPOLinks() {
        result := ComCall(14, this, "ptr*", &ppGPOLinks := 0, "HRESULT")
        return IGPMGPOLinksCollection(ppGPOLinks)
    }

    /**
     * Returns an object that represents the collection of GPMPermission objects for the scope of management (SOM).
     * @returns {IGPMSecurityInfo} Address of a pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmsecurityinfo">IGPMSecurityInfo</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmsom-getsecurityinfo
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
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmsom-setsecurityinfo
     */
    SetSecurityInfo(pSecurityInfo) {
        result := ComCall(16, this, "ptr", pSecurityInfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (IGPMSOM.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_GPOInheritanceBlocked := CallbackCreate(GetMethod(implObj, "get_GPOInheritanceBlocked"), flags, 2)
        this.vtbl.put_GPOInheritanceBlocked := CallbackCreate(GetMethod(implObj, "put_GPOInheritanceBlocked"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_Path := CallbackCreate(GetMethod(implObj, "get_Path"), flags, 2)
        this.vtbl.CreateGPOLink := CallbackCreate(GetMethod(implObj, "CreateGPOLink"), flags, 4)
        this.vtbl.get_Type := CallbackCreate(GetMethod(implObj, "get_Type"), flags, 2)
        this.vtbl.GetGPOLinks := CallbackCreate(GetMethod(implObj, "GetGPOLinks"), flags, 2)
        this.vtbl.GetInheritedGPOLinks := CallbackCreate(GetMethod(implObj, "GetInheritedGPOLinks"), flags, 2)
        this.vtbl.GetSecurityInfo := CallbackCreate(GetMethod(implObj, "GetSecurityInfo"), flags, 2)
        this.vtbl.SetSecurityInfo := CallbackCreate(GetMethod(implObj, "SetSecurityInfo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_GPOInheritanceBlocked)
        CallbackFree(this.vtbl.put_GPOInheritanceBlocked)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_Path)
        CallbackFree(this.vtbl.CreateGPOLink)
        CallbackFree(this.vtbl.get_Type)
        CallbackFree(this.vtbl.GetGPOLinks)
        CallbackFree(this.vtbl.GetInheritedGPOLinks)
        CallbackFree(this.vtbl.GetSecurityInfo)
        CallbackFree(this.vtbl.SetSecurityInfo)
    }
}
