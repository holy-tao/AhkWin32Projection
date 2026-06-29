#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\D3D12_WORK_GRAPH_MEMORY_REQUIREMENTS.ahk" { D3D12_WORK_GRAPH_MEMORY_REQUIREMENTS }
#Import ".\D3D12_NODE_ID.ahk" { D3D12_NODE_ID }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12WorkGraphProperties extends IUnknown {
    /**
     * The interface identifier for ID3D12WorkGraphProperties
     * @type {Guid}
     */
    static IID := Guid("{065acf71-f863-4b89-82f4-02e4d5886757}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12WorkGraphProperties interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetNumWorkGraphs                    : IntPtr
        GetProgramName                      : IntPtr
        GetWorkGraphIndex                   : IntPtr
        GetNumNodes                         : IntPtr
        GetNodeID                           : IntPtr
        GetNodeIndex                        : IntPtr
        GetNodeLocalRootArgumentsTableIndex : IntPtr
        GetNumEntrypoints                   : IntPtr
        GetEntrypointID                     : IntPtr
        GetEntrypointIndex                  : IntPtr
        GetEntrypointRecordSizeInBytes      : IntPtr
        GetWorkGraphMemoryRequirements      : IntPtr
        GetEntrypointRecordAlignmentInBytes : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12WorkGraphProperties.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumWorkGraphs() {
        result := ComCall(3, this, UInt32)
        return result
    }

    /**
     * 
     * @param {Integer} WorkGraphIndex 
     * @returns {PWSTR} 
     */
    GetProgramName(WorkGraphIndex) {
        result := ComCall(4, this, "uint", WorkGraphIndex, PWSTR)
        return result
    }

    /**
     * 
     * @param {PWSTR} pProgramName 
     * @returns {Integer} 
     */
    GetWorkGraphIndex(pProgramName) {
        pProgramName := pProgramName is String ? StrPtr(pProgramName) : pProgramName

        result := ComCall(5, this, "ptr", pProgramName, UInt32)
        return result
    }

    /**
     * 
     * @param {Integer} WorkGraphIndex 
     * @returns {Integer} 
     */
    GetNumNodes(WorkGraphIndex) {
        result := ComCall(6, this, "uint", WorkGraphIndex, UInt32)
        return result
    }

    /**
     * 
     * @param {Integer} WorkGraphIndex 
     * @param {Integer} NodeIndex 
     * @returns {D3D12_NODE_ID} 
     */
    GetNodeID(WorkGraphIndex, NodeIndex) {
        result := ComCall(7, this, "uint", WorkGraphIndex, "uint", NodeIndex, D3D12_NODE_ID)
        return result
    }

    /**
     * 
     * @param {Integer} WorkGraphIndex 
     * @param {D3D12_NODE_ID} NodeID 
     * @returns {Integer} 
     */
    GetNodeIndex(WorkGraphIndex, NodeID) {
        result := ComCall(8, this, "uint", WorkGraphIndex, D3D12_NODE_ID, NodeID, UInt32)
        return result
    }

    /**
     * 
     * @param {Integer} WorkGraphIndex 
     * @param {Integer} NodeIndex 
     * @returns {Integer} 
     */
    GetNodeLocalRootArgumentsTableIndex(WorkGraphIndex, NodeIndex) {
        result := ComCall(9, this, "uint", WorkGraphIndex, "uint", NodeIndex, UInt32)
        return result
    }

    /**
     * 
     * @param {Integer} WorkGraphIndex 
     * @returns {Integer} 
     */
    GetNumEntrypoints(WorkGraphIndex) {
        result := ComCall(10, this, "uint", WorkGraphIndex, UInt32)
        return result
    }

    /**
     * 
     * @param {Integer} WorkGraphIndex 
     * @param {Integer} EntrypointIndex 
     * @returns {D3D12_NODE_ID} 
     */
    GetEntrypointID(WorkGraphIndex, EntrypointIndex) {
        result := ComCall(11, this, "uint", WorkGraphIndex, "uint", EntrypointIndex, D3D12_NODE_ID)
        return result
    }

    /**
     * 
     * @param {Integer} WorkGraphIndex 
     * @param {D3D12_NODE_ID} NodeID 
     * @returns {Integer} 
     */
    GetEntrypointIndex(WorkGraphIndex, NodeID) {
        result := ComCall(12, this, "uint", WorkGraphIndex, D3D12_NODE_ID, NodeID, UInt32)
        return result
    }

    /**
     * 
     * @param {Integer} WorkGraphIndex 
     * @param {Integer} EntrypointIndex 
     * @returns {Integer} 
     */
    GetEntrypointRecordSizeInBytes(WorkGraphIndex, EntrypointIndex) {
        result := ComCall(13, this, "uint", WorkGraphIndex, "uint", EntrypointIndex, UInt32)
        return result
    }

    /**
     * 
     * @param {Integer} WorkGraphIndex 
     * @param {Pointer<D3D12_WORK_GRAPH_MEMORY_REQUIREMENTS>} pWorkGraphMemoryRequirements 
     * @returns {String} Nothing - always returns an empty string
     */
    GetWorkGraphMemoryRequirements(WorkGraphIndex, pWorkGraphMemoryRequirements) {
        ComCall(14, this, "uint", WorkGraphIndex, D3D12_WORK_GRAPH_MEMORY_REQUIREMENTS.Ptr, pWorkGraphMemoryRequirements)
    }

    /**
     * 
     * @param {Integer} WorkGraphIndex 
     * @param {Integer} EntrypointIndex 
     * @returns {Integer} 
     */
    GetEntrypointRecordAlignmentInBytes(WorkGraphIndex, EntrypointIndex) {
        result := ComCall(15, this, "uint", WorkGraphIndex, "uint", EntrypointIndex, UInt32)
        return result
    }

    Query(iid) {
        if (ID3D12WorkGraphProperties.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetNumWorkGraphs := CallbackCreate(GetMethod(implObj, "GetNumWorkGraphs"), flags, 1)
        this.vtbl.GetProgramName := CallbackCreate(GetMethod(implObj, "GetProgramName"), flags, 2)
        this.vtbl.GetWorkGraphIndex := CallbackCreate(GetMethod(implObj, "GetWorkGraphIndex"), flags, 2)
        this.vtbl.GetNumNodes := CallbackCreate(GetMethod(implObj, "GetNumNodes"), flags, 2)
        this.vtbl.GetNodeID := CallbackCreate(GetMethod(implObj, "GetNodeID"), flags, 3)
        this.vtbl.GetNodeIndex := CallbackCreate(GetMethod(implObj, "GetNodeIndex"), flags, 3)
        this.vtbl.GetNodeLocalRootArgumentsTableIndex := CallbackCreate(GetMethod(implObj, "GetNodeLocalRootArgumentsTableIndex"), flags, 3)
        this.vtbl.GetNumEntrypoints := CallbackCreate(GetMethod(implObj, "GetNumEntrypoints"), flags, 2)
        this.vtbl.GetEntrypointID := CallbackCreate(GetMethod(implObj, "GetEntrypointID"), flags, 3)
        this.vtbl.GetEntrypointIndex := CallbackCreate(GetMethod(implObj, "GetEntrypointIndex"), flags, 3)
        this.vtbl.GetEntrypointRecordSizeInBytes := CallbackCreate(GetMethod(implObj, "GetEntrypointRecordSizeInBytes"), flags, 3)
        this.vtbl.GetWorkGraphMemoryRequirements := CallbackCreate(GetMethod(implObj, "GetWorkGraphMemoryRequirements"), flags, 3)
        this.vtbl.GetEntrypointRecordAlignmentInBytes := CallbackCreate(GetMethod(implObj, "GetEntrypointRecordAlignmentInBytes"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetNumWorkGraphs)
        CallbackFree(this.vtbl.GetProgramName)
        CallbackFree(this.vtbl.GetWorkGraphIndex)
        CallbackFree(this.vtbl.GetNumNodes)
        CallbackFree(this.vtbl.GetNodeID)
        CallbackFree(this.vtbl.GetNodeIndex)
        CallbackFree(this.vtbl.GetNodeLocalRootArgumentsTableIndex)
        CallbackFree(this.vtbl.GetNumEntrypoints)
        CallbackFree(this.vtbl.GetEntrypointID)
        CallbackFree(this.vtbl.GetEntrypointIndex)
        CallbackFree(this.vtbl.GetEntrypointRecordSizeInBytes)
        CallbackFree(this.vtbl.GetWorkGraphMemoryRequirements)
        CallbackFree(this.vtbl.GetEntrypointRecordAlignmentInBytes)
    }
}
