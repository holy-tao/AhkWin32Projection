#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusVersion extends IDispatch{
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
     * 
     * @param {Pointer<BSTR>} pbstrClusterName 
     * @returns {HRESULT} 
     */
    get_Name(pbstrClusterName) {
        result := ComCall(7, this, "ptr", pbstrClusterName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pnMajorVersion 
     * @returns {HRESULT} 
     */
    get_MajorVersion(pnMajorVersion) {
        result := ComCall(8, this, "int*", pnMajorVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pnMinorVersion 
     * @returns {HRESULT} 
     */
    get_MinorVersion(pnMinorVersion) {
        result := ComCall(9, this, "int*", pnMinorVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int16>} pnBuildNumber 
     * @returns {HRESULT} 
     */
    get_BuildNumber(pnBuildNumber) {
        result := ComCall(10, this, "short*", pnBuildNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrVendorId 
     * @returns {HRESULT} 
     */
    get_VendorId(pbstrVendorId) {
        result := ComCall(11, this, "ptr", pbstrVendorId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCSDVersion 
     * @returns {HRESULT} 
     */
    get_CSDVersion(pbstrCSDVersion) {
        result := ComCall(12, this, "ptr", pbstrCSDVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pnClusterHighestVersion 
     * @returns {HRESULT} 
     */
    get_ClusterHighestVersion(pnClusterHighestVersion) {
        result := ComCall(13, this, "int*", pnClusterHighestVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pnClusterLowestVersion 
     * @returns {HRESULT} 
     */
    get_ClusterLowestVersion(pnClusterLowestVersion) {
        result := ComCall(14, this, "int*", pnClusterLowestVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pnFlags 
     * @returns {HRESULT} 
     */
    get_Flags(pnFlags) {
        result := ComCall(15, this, "int*", pnFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarMixedVersion 
     * @returns {HRESULT} 
     */
    get_MixedVersion(pvarMixedVersion) {
        result := ComCall(16, this, "ptr", pvarMixedVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
