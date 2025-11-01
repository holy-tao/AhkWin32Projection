#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<BSTR>} pbstrClusterName 
     * @returns {HRESULT} 
     */
    get_Name(pbstrClusterName) {
        result := ComCall(7, this, "ptr", pbstrClusterName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pnMajorVersion 
     * @returns {HRESULT} 
     */
    get_MajorVersion(pnMajorVersion) {
        result := ComCall(8, this, "int*", pnMajorVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pnMinorVersion 
     * @returns {HRESULT} 
     */
    get_MinorVersion(pnMinorVersion) {
        result := ComCall(9, this, "int*", pnMinorVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pnBuildNumber 
     * @returns {HRESULT} 
     */
    get_BuildNumber(pnBuildNumber) {
        result := ComCall(10, this, "short*", pnBuildNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrVendorId 
     * @returns {HRESULT} 
     */
    get_VendorId(pbstrVendorId) {
        result := ComCall(11, this, "ptr", pbstrVendorId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCSDVersion 
     * @returns {HRESULT} 
     */
    get_CSDVersion(pbstrCSDVersion) {
        result := ComCall(12, this, "ptr", pbstrCSDVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pnClusterHighestVersion 
     * @returns {HRESULT} 
     */
    get_ClusterHighestVersion(pnClusterHighestVersion) {
        result := ComCall(13, this, "int*", pnClusterHighestVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pnClusterLowestVersion 
     * @returns {HRESULT} 
     */
    get_ClusterLowestVersion(pnClusterLowestVersion) {
        result := ComCall(14, this, "int*", pnClusterLowestVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pnFlags 
     * @returns {HRESULT} 
     */
    get_Flags(pnFlags) {
        result := ComCall(15, this, "int*", pnFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarMixedVersion 
     * @returns {HRESULT} 
     */
    get_MixedVersion(pvarMixedVersion) {
        result := ComCall(16, this, "ptr", pvarMixedVersion, "HRESULT")
        return result
    }
}
