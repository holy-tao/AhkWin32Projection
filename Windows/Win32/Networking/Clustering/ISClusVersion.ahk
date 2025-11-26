#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusVersion extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISClusVersion
     * @type {Guid}
     */
    static IID => Guid("{f2e60716-2631-11d1-89f1-00a0c90d061e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_MajorVersion", "get_MinorVersion", "get_BuildNumber", "get_VendorId", "get_CSDVersion", "get_ClusterHighestVersion", "get_ClusterLowestVersion", "get_Flags", "get_MixedVersion"]

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
        pbstrClusterName := BSTR()
        result := ComCall(7, this, "ptr", pbstrClusterName, "HRESULT")
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
        pbstrVendorId := BSTR()
        result := ComCall(11, this, "ptr", pbstrVendorId, "HRESULT")
        return pbstrVendorId
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_CSDVersion() {
        pbstrCSDVersion := BSTR()
        result := ComCall(12, this, "ptr", pbstrCSDVersion, "HRESULT")
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
        result := ComCall(16, this, "ptr", pvarMixedVersion, "HRESULT")
        return pvarMixedVersion
    }
}
