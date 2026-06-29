#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IGPMSecurityInfo.ahk" { IGPMSecurityInfo }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IGPMWMIFilter interface contains methods that allow you to set and retrieve security attributes and various properties for a WMI filter. WMI filter queries are specified using WMI Query Language (WQL).
 * @remarks
 * For information about importing, exporting, and copying WMI filters, see the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemclassobject-getobjecttext">IWbemClassObject::GetObjectText</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-imofcompiler-compilebuffer">IMofCompiler::CompileBuffer</a> methods in the WMI SDK.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmwmifilter
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct IGPMWMIFilter extends IDispatch {
    /**
     * The interface identifier for IGPMWMIFilter
     * @type {Guid}
     */
    static IID := Guid("{ef2ff9b4-3c27-459a-b979-038305cec75d}")

    /**
     * The class identifier for GPMWMIFilter
     * @type {Guid}
     */
    static CLSID := Guid("{626745d8-0dea-4062-bf60-cfc5b1ca1286}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGPMWMIFilter interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Path        : IntPtr
        put_Name        : IntPtr
        get_Name        : IntPtr
        put_Description : IntPtr
        get_Description : IntPtr
        GetQueryList    : IntPtr
        GetSecurityInfo : IntPtr
        SetSecurityInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGPMWMIFilter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Path() {
        pVal := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     */
    put_Name(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(8, this, BSTR, newVal, "HRESULT")
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
     * @param {BSTR} newVal 
     * @returns {HRESULT} 
     */
    put_Description(newVal) {
        newVal := newVal is String ? BSTR.Alloc(newVal).Value : newVal

        result := ComCall(10, this, BSTR, newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Description() {
        pVal := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the query list stored in the WMI filter.
     * @returns {VARIANT} Pointer to a <b>SAFEARRAY</b> of <b>VARIANT</b> members that contain the <b>BSTR </b> strings representing the queries. Each  <b>BSTR</b> string contains the query string along with the namespace information for that query.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmwmifilter-getquerylist
     */
    GetQueryList() {
        pQryList := VARIANT()
        result := ComCall(12, this, VARIANT.Ptr, pQryList, "HRESULT")
        return pQryList
    }

    /**
     * Returns an interface or object that represents the list of permissions for the current WMI filter.
     * @returns {IGPMSecurityInfo} Address of a pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmsecurityinfo">IGPMSecurityInfo</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmwmifilter-getsecurityinfo
     */
    GetSecurityInfo() {
        result := ComCall(13, this, "ptr*", &ppSecurityInfo := 0, "HRESULT")
        return IGPMSecurityInfo(ppSecurityInfo)
    }

    /**
     * Sets the list of permissions for the current WMI filter to that specified by the object.
     * @remarks
     * You should understand these considerations before changing permissions on WMI filters.
     * 
     * <ul>
     * <li>Read permission is required for all users to whom a WMI filter applies. Authenticated users always have read access to all WMI filters. Typically, all users to whom the GPO with the WMI filter link applies also have read access.</li>
     * <li>Users with permission to edit WMI filters can affect policy processing for all users to whom the WMI filter applies.</li>
     * </ul>
     * @param {IGPMSecurityInfo} pSecurityInfo Pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nn-gpmgmt-igpmsecurityinfo">IGPMSecurityInfo</a> interface.  This parameter is required.
     * @returns {HRESULT} <h3>JScript</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * 
     * <h3>VB</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmwmifilter-setsecurityinfo
     */
    SetSecurityInfo(pSecurityInfo) {
        result := ComCall(14, this, "ptr", pSecurityInfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (IGPMWMIFilter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Path := CallbackCreate(GetMethod(implObj, "get_Path"), flags, 2)
        this.vtbl.put_Name := CallbackCreate(GetMethod(implObj, "put_Name"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.put_Description := CallbackCreate(GetMethod(implObj, "put_Description"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.GetQueryList := CallbackCreate(GetMethod(implObj, "GetQueryList"), flags, 2)
        this.vtbl.GetSecurityInfo := CallbackCreate(GetMethod(implObj, "GetSecurityInfo"), flags, 2)
        this.vtbl.SetSecurityInfo := CallbackCreate(GetMethod(implObj, "SetSecurityInfo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Path)
        CallbackFree(this.vtbl.put_Name)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.put_Description)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.GetQueryList)
        CallbackFree(this.vtbl.GetSecurityInfo)
        CallbackFree(this.vtbl.SetSecurityInfo)
    }
}
