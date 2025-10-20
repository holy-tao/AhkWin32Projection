#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusNetwork extends IDispatch{
    /**
     * The interface identifier for ISClusNetwork
     * @type {Guid}
     */
    static IID => Guid("{f2e606f2-2631-11d1-89f1-00a0c90d061e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<ISClusProperties>} ppProperties 
     * @returns {HRESULT} 
     */
    get_CommonProperties(ppProperties) {
        result := ComCall(7, this, "ptr", ppProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusProperties>} ppProperties 
     * @returns {HRESULT} 
     */
    get_PrivateProperties(ppProperties) {
        result := ComCall(8, this, "ptr", ppProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusProperties>} ppProperties 
     * @returns {HRESULT} 
     */
    get_CommonROProperties(ppProperties) {
        result := ComCall(9, this, "ptr", ppProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusProperties>} ppProperties 
     * @returns {HRESULT} 
     */
    get_PrivateROProperties(ppProperties) {
        result := ComCall(10, this, "ptr", ppProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UIntPtr>} phandle 
     * @returns {HRESULT} 
     */
    get_Handle(phandle) {
        result := ComCall(11, this, "ptr*", phandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    get_Name(pbstrName) {
        result := ComCall(12, this, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrNetworkName 
     * @returns {HRESULT} 
     */
    put_Name(bstrNetworkName) {
        bstrNetworkName := bstrNetworkName is String ? BSTR.Alloc(bstrNetworkName).Value : bstrNetworkName

        result := ComCall(13, this, "ptr", bstrNetworkName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrNetworkID 
     * @returns {HRESULT} 
     */
    get_NetworkID(pbstrNetworkID) {
        result := ComCall(14, this, "ptr", pbstrNetworkID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} dwState 
     * @returns {HRESULT} 
     */
    get_State(dwState) {
        result := ComCall(15, this, "int*", dwState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISClusNetworkNetInterfaces>} ppClusNetInterfaces 
     * @returns {HRESULT} 
     */
    get_NetInterfaces(ppClusNetInterfaces) {
        result := ComCall(16, this, "ptr", ppClusNetInterfaces, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISCluster>} ppCluster 
     * @returns {HRESULT} 
     */
    get_Cluster(ppCluster) {
        result := ComCall(17, this, "ptr", ppCluster, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
