#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISClusProperties.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISCluster.ahk
#Include .\ISClusResTypeResources.ahk
#Include .\ISClusResTypePossibleOwnerNodes.ahk
#Include .\ISClusDisks.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusResType extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISClusResType
     * @type {Guid}
     */
    static IID => Guid("{f2e60710-2631-11d1-89f1-00a0c90d061e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CommonProperties", "get_PrivateProperties", "get_CommonROProperties", "get_PrivateROProperties", "get_Name", "Delete", "get_Cluster", "get_Resources", "get_PossibleOwnerNodes", "get_AvailableDisks"]

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
     * @type {ISCluster} 
     */
    Cluster {
        get => this.get_Cluster()
    }

    /**
     * @type {ISClusResTypeResources} 
     */
    Resources {
        get => this.get_Resources()
    }

    /**
     * @type {ISClusResTypePossibleOwnerNodes} 
     */
    PossibleOwnerNodes {
        get => this.get_PossibleOwnerNodes()
    }

    /**
     * @type {ISClusDisks} 
     */
    AvailableDisks {
        get => this.get_AvailableDisks()
    }

    /**
     * 
     * @returns {ISClusProperties} 
     */
    get_CommonProperties() {
        result := ComCall(7, this, "ptr*", &ppProperties := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISClusProperties(ppProperties)
    }

    /**
     * 
     * @returns {ISClusProperties} 
     */
    get_PrivateProperties() {
        result := ComCall(8, this, "ptr*", &ppProperties := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISClusProperties(ppProperties)
    }

    /**
     * 
     * @returns {ISClusProperties} 
     */
    get_CommonROProperties() {
        result := ComCall(9, this, "ptr*", &ppProperties := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISClusProperties(ppProperties)
    }

    /**
     * 
     * @returns {ISClusProperties} 
     */
    get_PrivateROProperties() {
        result := ComCall(10, this, "ptr*", &ppProperties := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISClusProperties(ppProperties)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(11, this, "ptr", pbstrName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrName
    }

    /**
     * Delete Method (ADOX Collections)
     * @remarks
     * An error will occur if the *Name* does not exist in the collection.  
     *   
     *  For [Tables](./tables-collection-adox.md) and [Users](./users-collection-adox.md) collections, an error will occur if the provider does not support deleting tables or users, respectively. For [Procedures](./procedures-collection-adox.md) and [Views](./views-collection-adox.md) collections, **Delete** will fail if the provider does not support persisting commands.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/adox-api/delete-method-adox-collections
     */
    Delete() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ISCluster} 
     */
    get_Cluster() {
        result := ComCall(13, this, "ptr*", &ppCluster := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISCluster(ppCluster)
    }

    /**
     * 
     * @returns {ISClusResTypeResources} 
     */
    get_Resources() {
        result := ComCall(14, this, "ptr*", &ppClusterResTypeResources := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISClusResTypeResources(ppClusterResTypeResources)
    }

    /**
     * 
     * @returns {ISClusResTypePossibleOwnerNodes} 
     */
    get_PossibleOwnerNodes() {
        result := ComCall(15, this, "ptr*", &ppOwnerNodes := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISClusResTypePossibleOwnerNodes(ppOwnerNodes)
    }

    /**
     * 
     * @returns {ISClusDisks} 
     */
    get_AvailableDisks() {
        result := ComCall(16, this, "ptr*", &ppAvailableDisks := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISClusDisks(ppAvailableDisks)
    }
}
