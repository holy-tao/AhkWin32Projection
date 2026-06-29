#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct ISClusVersion extends IDispatch {
    /**
     * The interface identifier for ISClusVersion
     * @type {Guid}
     */
    static IID := Guid("{f2e60716-2631-11d1-89f1-00a0c90d061e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISClusVersion interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name                  : IntPtr
        get_MajorVersion          : IntPtr
        get_MinorVersion          : IntPtr
        get_BuildNumber           : IntPtr
        get_VendorId              : IntPtr
        get_CSDVersion            : IntPtr
        get_ClusterHighestVersion : IntPtr
        get_ClusterLowestVersion  : IntPtr
        get_Flags                 : IntPtr
        get_MixedVersion          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISClusVersion.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {Integer} 
     */
    MajorVersion {
        get => this.get_MajorVersion()
    }

    /**
     * @type {Integer} 
     */
    MinorVersion {
        get => this.get_MinorVersion()
    }

    /**
     * @type {Integer} 
     */
    BuildNumber {
        get => this.get_BuildNumber()
    }

    /**
     * @type {BSTR} 
     */
    VendorId {
        get => this.get_VendorId()
    }

    /**
     * @type {BSTR} 
     */
    CSDVersion {
        get => this.get_CSDVersion()
    }

    /**
     * @type {Integer} 
     */
    ClusterHighestVersion {
        get => this.get_ClusterHighestVersion()
    }

    /**
     * @type {Integer} 
     */
    ClusterLowestVersion {
        get => this.get_ClusterLowestVersion()
    }

    /**
     * @type {Integer} 
     */
    Flags {
        get => this.get_Flags()
    }

    /**
     * @type {VARIANT} 
     */
    MixedVersion {
        get => this.get_MixedVersion()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        pbstrClusterName := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbstrClusterName, "HRESULT")
        return pbstrClusterName
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MajorVersion() {
        result := ComCall(8, this, "int*", &pnMajorVersion := 0, "HRESULT")
        return pnMajorVersion
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinorVersion() {
        result := ComCall(9, this, "int*", &pnMinorVersion := 0, "HRESULT")
        return pnMinorVersion
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BuildNumber() {
        result := ComCall(10, this, "short*", &pnBuildNumber := 0, "HRESULT")
        return pnBuildNumber
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_VendorId() {
        pbstrVendorId := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pbstrVendorId, "HRESULT")
        return pbstrVendorId
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_CSDVersion() {
        pbstrCSDVersion := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, pbstrCSDVersion, "HRESULT")
        return pbstrCSDVersion
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ClusterHighestVersion() {
        result := ComCall(13, this, "int*", &pnClusterHighestVersion := 0, "HRESULT")
        return pnClusterHighestVersion
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ClusterLowestVersion() {
        result := ComCall(14, this, "int*", &pnClusterLowestVersion := 0, "HRESULT")
        return pnClusterLowestVersion
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Flags() {
        result := ComCall(15, this, "int*", &pnFlags := 0, "HRESULT")
        return pnFlags
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_MixedVersion() {
        pvarMixedVersion := VARIANT()
        result := ComCall(16, this, VARIANT.Ptr, pvarMixedVersion, "HRESULT")
        return pvarMixedVersion
    }

    Query(iid) {
        if (ISClusVersion.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_MajorVersion := CallbackCreate(GetMethod(implObj, "get_MajorVersion"), flags, 2)
        this.vtbl.get_MinorVersion := CallbackCreate(GetMethod(implObj, "get_MinorVersion"), flags, 2)
        this.vtbl.get_BuildNumber := CallbackCreate(GetMethod(implObj, "get_BuildNumber"), flags, 2)
        this.vtbl.get_VendorId := CallbackCreate(GetMethod(implObj, "get_VendorId"), flags, 2)
        this.vtbl.get_CSDVersion := CallbackCreate(GetMethod(implObj, "get_CSDVersion"), flags, 2)
        this.vtbl.get_ClusterHighestVersion := CallbackCreate(GetMethod(implObj, "get_ClusterHighestVersion"), flags, 2)
        this.vtbl.get_ClusterLowestVersion := CallbackCreate(GetMethod(implObj, "get_ClusterLowestVersion"), flags, 2)
        this.vtbl.get_Flags := CallbackCreate(GetMethod(implObj, "get_Flags"), flags, 2)
        this.vtbl.get_MixedVersion := CallbackCreate(GetMethod(implObj, "get_MixedVersion"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_MajorVersion)
        CallbackFree(this.vtbl.get_MinorVersion)
        CallbackFree(this.vtbl.get_BuildNumber)
        CallbackFree(this.vtbl.get_VendorId)
        CallbackFree(this.vtbl.get_CSDVersion)
        CallbackFree(this.vtbl.get_ClusterHighestVersion)
        CallbackFree(this.vtbl.get_ClusterLowestVersion)
        CallbackFree(this.vtbl.get_Flags)
        CallbackFree(this.vtbl.get_MixedVersion)
    }
}
