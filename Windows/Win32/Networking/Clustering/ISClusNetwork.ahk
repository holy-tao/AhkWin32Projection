#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISClusProperties.ahk
#Include .\ISClusNetworkNetInterfaces.ahk
#Include .\ISCluster.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusNetwork extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CommonProperties", "get_PrivateProperties", "get_CommonROProperties", "get_PrivateROProperties", "get_Handle", "get_Name", "put_Name", "get_NetworkID", "get_State", "get_NetInterfaces", "get_Cluster"]

    /**
     * @type {ISClusProperties} 
     */
    CommonProperties {
        get => this.get_CommonProperties()
    }

    /**
     * @type {ISClusProperties} 
     */
    PrivateProperties {
        get => this.get_PrivateProperties()
    }

    /**
     * @type {ISClusProperties} 
     */
    CommonROProperties {
        get => this.get_CommonROProperties()
    }

    /**
     * @type {ISClusProperties} 
     */
    PrivateROProperties {
        get => this.get_PrivateROProperties()
    }

    /**
     * @type {Pointer} 
     */
    Handle {
        get => this.get_Handle()
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
    NetworkID {
        get => this.get_NetworkID()
    }

    /**
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * @type {ISClusNetworkNetInterfaces} 
     */
    NetInterfaces {
        get => this.get_NetInterfaces()
    }

    /**
     * @type {ISCluster} 
     */
    Cluster {
        get => this.get_Cluster()
    }

    /**
     * 
     * @returns {ISClusProperties} 
     */
    get_CommonProperties() {
        result := ComCall(7, this, "ptr*", &ppProperties := 0, "HRESULT")
        return ISClusProperties(ppProperties)
    }

    /**
     * 
     * @returns {ISClusProperties} 
     */
    get_PrivateProperties() {
        result := ComCall(8, this, "ptr*", &ppProperties := 0, "HRESULT")
        return ISClusProperties(ppProperties)
    }

    /**
     * 
     * @returns {ISClusProperties} 
     */
    get_CommonROProperties() {
        result := ComCall(9, this, "ptr*", &ppProperties := 0, "HRESULT")
        return ISClusProperties(ppProperties)
    }

    /**
     * 
     * @returns {ISClusProperties} 
     */
    get_PrivateROProperties() {
        result := ComCall(10, this, "ptr*", &ppProperties := 0, "HRESULT")
        return ISClusProperties(ppProperties)
    }

    /**
     * 
     * @returns {Pointer} 
     */
    get_Handle() {
        result := ComCall(11, this, "ptr*", &phandle := 0, "HRESULT")
        return phandle
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(12, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @param {BSTR} bstrNetworkName 
     * @returns {HRESULT} 
     */
    put_Name(bstrNetworkName) {
        bstrNetworkName := bstrNetworkName is String ? BSTR.Alloc(bstrNetworkName).Value : bstrNetworkName

        result := ComCall(13, this, "ptr", bstrNetworkName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_NetworkID() {
        pbstrNetworkID := BSTR()
        result := ComCall(14, this, "ptr", pbstrNetworkID, "HRESULT")
        return pbstrNetworkID
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        result := ComCall(15, this, "int*", &dwState := 0, "HRESULT")
        return dwState
    }

    /**
     * 
     * @returns {ISClusNetworkNetInterfaces} 
     */
    get_NetInterfaces() {
        result := ComCall(16, this, "ptr*", &ppClusNetInterfaces := 0, "HRESULT")
        return ISClusNetworkNetInterfaces(ppClusNetInterfaces)
    }

    /**
     * 
     * @returns {ISCluster} 
     */
    get_Cluster() {
        result := ComCall(17, this, "ptr*", &ppCluster := 0, "HRESULT")
        return ISCluster(ppCluster)
    }
}
