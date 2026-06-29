#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IADs.ahk" { IADs }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IADsService interface is a dual interface that inherits from IADs.
 * @remarks
 * The system services are published in the underlying directory. Some may be running, others may not. To verify the status or to operate on any of the services, use the properties and methods of the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsserviceoperations">IADsServiceOperations</a> interface.
 * 
 * File service is a special case of the system service. The  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsfileservice">IADsFileService</a> and  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsfileserviceoperations">IADsFileServiceOperations</a> interfaces support additional features unique to file services.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsservice
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsService extends IADs {
    /**
     * The interface identifier for IADsService
     * @type {Guid}
     */
    static IID := Guid("{68af66e0-31ca-11cf-a98a-00aa006bc149}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsService interfaces
    */
    struct Vtbl extends IADs.Vtbl {
        get_HostComputer       : IntPtr
        put_HostComputer       : IntPtr
        get_DisplayName        : IntPtr
        put_DisplayName        : IntPtr
        get_Version            : IntPtr
        put_Version            : IntPtr
        get_ServiceType        : IntPtr
        put_ServiceType        : IntPtr
        get_StartType          : IntPtr
        put_StartType          : IntPtr
        get_Path               : IntPtr
        put_Path               : IntPtr
        get_StartupParameters  : IntPtr
        put_StartupParameters  : IntPtr
        get_ErrorControl       : IntPtr
        put_ErrorControl       : IntPtr
        get_LoadOrderGroup     : IntPtr
        put_LoadOrderGroup     : IntPtr
        get_ServiceAccountName : IntPtr
        put_ServiceAccountName : IntPtr
        get_ServiceAccountPath : IntPtr
        put_ServiceAccountPath : IntPtr
        get_Dependencies       : IntPtr
        put_Dependencies       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsService.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    HostComputer {
        get => this.get_HostComputer()
        set => this.put_HostComputer(value)
    }

    /**
     * @type {BSTR} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * @type {BSTR} 
     */
    Version {
        get => this.get_Version()
        set => this.put_Version(value)
    }

    /**
     * @type {Integer} 
     */
    ServiceType {
        get => this.get_ServiceType()
        set => this.put_ServiceType(value)
    }

    /**
     * @type {Integer} 
     */
    StartType {
        get => this.get_StartType()
        set => this.put_StartType(value)
    }

    /**
     * @type {BSTR} 
     */
    Path {
        get => this.get_Path()
        set => this.put_Path(value)
    }

    /**
     * @type {BSTR} 
     */
    StartupParameters {
        get => this.get_StartupParameters()
        set => this.put_StartupParameters(value)
    }

    /**
     * @type {Integer} 
     */
    ErrorControl {
        get => this.get_ErrorControl()
        set => this.put_ErrorControl(value)
    }

    /**
     * @type {BSTR} 
     */
    LoadOrderGroup {
        get => this.get_LoadOrderGroup()
        set => this.put_LoadOrderGroup(value)
    }

    /**
     * @type {BSTR} 
     */
    ServiceAccountName {
        get => this.get_ServiceAccountName()
        set => this.put_ServiceAccountName(value)
    }

    /**
     * @type {BSTR} 
     */
    ServiceAccountPath {
        get => this.get_ServiceAccountPath()
        set => this.put_ServiceAccountPath(value)
    }

    /**
     * @type {VARIANT} 
     */
    Dependencies {
        get => this.get_Dependencies()
        set => this.put_Dependencies(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_HostComputer() {
        retval := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrHostComputer 
     * @returns {HRESULT} 
     */
    put_HostComputer(bstrHostComputer) {
        bstrHostComputer := bstrHostComputer is String ? BSTR.Alloc(bstrHostComputer).Value : bstrHostComputer

        result := ComCall(21, this, BSTR, bstrHostComputer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DisplayName() {
        retval := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrDisplayName 
     * @returns {HRESULT} 
     */
    put_DisplayName(bstrDisplayName) {
        bstrDisplayName := bstrDisplayName is String ? BSTR.Alloc(bstrDisplayName).Value : bstrDisplayName

        result := ComCall(23, this, BSTR, bstrDisplayName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Version() {
        retval := BSTR.Owned()
        result := ComCall(24, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrVersion 
     * @returns {HRESULT} 
     */
    put_Version(bstrVersion) {
        bstrVersion := bstrVersion is String ? BSTR.Alloc(bstrVersion).Value : bstrVersion

        result := ComCall(25, this, BSTR, bstrVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ServiceType() {
        result := ComCall(26, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnServiceType 
     * @returns {HRESULT} 
     */
    put_ServiceType(lnServiceType) {
        result := ComCall(27, this, "int", lnServiceType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StartType() {
        result := ComCall(28, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnStartType 
     * @returns {HRESULT} 
     */
    put_StartType(lnStartType) {
        result := ComCall(29, this, "int", lnStartType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Path() {
        retval := BSTR.Owned()
        result := ComCall(30, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrPath 
     * @returns {HRESULT} 
     */
    put_Path(bstrPath) {
        bstrPath := bstrPath is String ? BSTR.Alloc(bstrPath).Value : bstrPath

        result := ComCall(31, this, BSTR, bstrPath, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_StartupParameters() {
        retval := BSTR.Owned()
        result := ComCall(32, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrStartupParameters 
     * @returns {HRESULT} 
     */
    put_StartupParameters(bstrStartupParameters) {
        bstrStartupParameters := bstrStartupParameters is String ? BSTR.Alloc(bstrStartupParameters).Value : bstrStartupParameters

        result := ComCall(33, this, BSTR, bstrStartupParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ErrorControl() {
        result := ComCall(34, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnErrorControl 
     * @returns {HRESULT} 
     */
    put_ErrorControl(lnErrorControl) {
        result := ComCall(35, this, "int", lnErrorControl, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LoadOrderGroup() {
        retval := BSTR.Owned()
        result := ComCall(36, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrLoadOrderGroup 
     * @returns {HRESULT} 
     */
    put_LoadOrderGroup(bstrLoadOrderGroup) {
        bstrLoadOrderGroup := bstrLoadOrderGroup is String ? BSTR.Alloc(bstrLoadOrderGroup).Value : bstrLoadOrderGroup

        result := ComCall(37, this, BSTR, bstrLoadOrderGroup, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ServiceAccountName() {
        retval := BSTR.Owned()
        result := ComCall(38, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrServiceAccountName 
     * @returns {HRESULT} 
     */
    put_ServiceAccountName(bstrServiceAccountName) {
        bstrServiceAccountName := bstrServiceAccountName is String ? BSTR.Alloc(bstrServiceAccountName).Value : bstrServiceAccountName

        result := ComCall(39, this, BSTR, bstrServiceAccountName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ServiceAccountPath() {
        retval := BSTR.Owned()
        result := ComCall(40, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrServiceAccountPath 
     * @returns {HRESULT} 
     */
    put_ServiceAccountPath(bstrServiceAccountPath) {
        bstrServiceAccountPath := bstrServiceAccountPath is String ? BSTR.Alloc(bstrServiceAccountPath).Value : bstrServiceAccountPath

        result := ComCall(41, this, BSTR, bstrServiceAccountPath, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Dependencies() {
        retval := VARIANT()
        result := ComCall(42, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vDependencies 
     * @returns {HRESULT} 
     */
    put_Dependencies(vDependencies) {
        result := ComCall(43, this, VARIANT, vDependencies, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsService.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_HostComputer := CallbackCreate(GetMethod(implObj, "get_HostComputer"), flags, 2)
        this.vtbl.put_HostComputer := CallbackCreate(GetMethod(implObj, "put_HostComputer"), flags, 2)
        this.vtbl.get_DisplayName := CallbackCreate(GetMethod(implObj, "get_DisplayName"), flags, 2)
        this.vtbl.put_DisplayName := CallbackCreate(GetMethod(implObj, "put_DisplayName"), flags, 2)
        this.vtbl.get_Version := CallbackCreate(GetMethod(implObj, "get_Version"), flags, 2)
        this.vtbl.put_Version := CallbackCreate(GetMethod(implObj, "put_Version"), flags, 2)
        this.vtbl.get_ServiceType := CallbackCreate(GetMethod(implObj, "get_ServiceType"), flags, 2)
        this.vtbl.put_ServiceType := CallbackCreate(GetMethod(implObj, "put_ServiceType"), flags, 2)
        this.vtbl.get_StartType := CallbackCreate(GetMethod(implObj, "get_StartType"), flags, 2)
        this.vtbl.put_StartType := CallbackCreate(GetMethod(implObj, "put_StartType"), flags, 2)
        this.vtbl.get_Path := CallbackCreate(GetMethod(implObj, "get_Path"), flags, 2)
        this.vtbl.put_Path := CallbackCreate(GetMethod(implObj, "put_Path"), flags, 2)
        this.vtbl.get_StartupParameters := CallbackCreate(GetMethod(implObj, "get_StartupParameters"), flags, 2)
        this.vtbl.put_StartupParameters := CallbackCreate(GetMethod(implObj, "put_StartupParameters"), flags, 2)
        this.vtbl.get_ErrorControl := CallbackCreate(GetMethod(implObj, "get_ErrorControl"), flags, 2)
        this.vtbl.put_ErrorControl := CallbackCreate(GetMethod(implObj, "put_ErrorControl"), flags, 2)
        this.vtbl.get_LoadOrderGroup := CallbackCreate(GetMethod(implObj, "get_LoadOrderGroup"), flags, 2)
        this.vtbl.put_LoadOrderGroup := CallbackCreate(GetMethod(implObj, "put_LoadOrderGroup"), flags, 2)
        this.vtbl.get_ServiceAccountName := CallbackCreate(GetMethod(implObj, "get_ServiceAccountName"), flags, 2)
        this.vtbl.put_ServiceAccountName := CallbackCreate(GetMethod(implObj, "put_ServiceAccountName"), flags, 2)
        this.vtbl.get_ServiceAccountPath := CallbackCreate(GetMethod(implObj, "get_ServiceAccountPath"), flags, 2)
        this.vtbl.put_ServiceAccountPath := CallbackCreate(GetMethod(implObj, "put_ServiceAccountPath"), flags, 2)
        this.vtbl.get_Dependencies := CallbackCreate(GetMethod(implObj, "get_Dependencies"), flags, 2)
        this.vtbl.put_Dependencies := CallbackCreate(GetMethod(implObj, "put_Dependencies"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_HostComputer)
        CallbackFree(this.vtbl.put_HostComputer)
        CallbackFree(this.vtbl.get_DisplayName)
        CallbackFree(this.vtbl.put_DisplayName)
        CallbackFree(this.vtbl.get_Version)
        CallbackFree(this.vtbl.put_Version)
        CallbackFree(this.vtbl.get_ServiceType)
        CallbackFree(this.vtbl.put_ServiceType)
        CallbackFree(this.vtbl.get_StartType)
        CallbackFree(this.vtbl.put_StartType)
        CallbackFree(this.vtbl.get_Path)
        CallbackFree(this.vtbl.put_Path)
        CallbackFree(this.vtbl.get_StartupParameters)
        CallbackFree(this.vtbl.put_StartupParameters)
        CallbackFree(this.vtbl.get_ErrorControl)
        CallbackFree(this.vtbl.put_ErrorControl)
        CallbackFree(this.vtbl.get_LoadOrderGroup)
        CallbackFree(this.vtbl.put_LoadOrderGroup)
        CallbackFree(this.vtbl.get_ServiceAccountName)
        CallbackFree(this.vtbl.put_ServiceAccountName)
        CallbackFree(this.vtbl.get_ServiceAccountPath)
        CallbackFree(this.vtbl.put_ServiceAccountPath)
        CallbackFree(this.vtbl.get_Dependencies)
        CallbackFree(this.vtbl.put_Dependencies)
    }
}
