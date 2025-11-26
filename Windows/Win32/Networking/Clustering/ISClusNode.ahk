#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISClusProperties.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISClusResGroups.ahk
#Include .\ISCluster.ahk
#Include .\ISClusNodeNetInterfaces.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusNode extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISClusNode
     * @type {Guid}
     */
    static IID => Guid("{f2e606f8-2631-11d1-89f1-00a0c90d061e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CommonProperties", "get_PrivateProperties", "get_CommonROProperties", "get_PrivateROProperties", "get_Name", "get_Handle", "get_NodeID", "get_State", "Pause", "Resume", "Evict", "get_ResourceGroups", "get_Cluster", "get_NetInterfaces"]

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
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
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
    NodeID {
        get => this.get_NodeID()
    }

    /**
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * @type {ISClusResGroups} 
     */
    ResourceGroups {
        get => this.get_ResourceGroups()
    }

    /**
     * @type {ISCluster} 
     */
    Cluster {
        get => this.get_Cluster()
    }

    /**
     * @type {ISClusNodeNetInterfaces} 
     */
    NetInterfaces {
        get => this.get_NetInterfaces()
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
     * @returns {BSTR} 
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(11, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @returns {Pointer} 
     */
    get_Handle() {
        result := ComCall(12, this, "ptr*", &phandle := 0, "HRESULT")
        return phandle
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_NodeID() {
        pbstrNodeID := BSTR()
        result := ComCall(13, this, "ptr", pbstrNodeID, "HRESULT")
        return pbstrNodeID
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        result := ComCall(14, this, "int*", &dwState := 0, "HRESULT")
        return dwState
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Pause() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Resume() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Evict() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISClusResGroups} 
     */
    get_ResourceGroups() {
        result := ComCall(18, this, "ptr*", &ppResourceGroups := 0, "HRESULT")
        return ISClusResGroups(ppResourceGroups)
    }

    /**
     * 
     * @returns {ISCluster} 
     */
    get_Cluster() {
        result := ComCall(19, this, "ptr*", &ppCluster := 0, "HRESULT")
        return ISCluster(ppCluster)
    }

    /**
     * 
     * @returns {ISClusNodeNetInterfaces} 
     */
    get_NetInterfaces() {
        result := ComCall(20, this, "ptr*", &ppClusNetInterfaces := 0, "HRESULT")
        return ISClusNodeNetInterfaces(ppClusNetInterfaces)
    }
}
