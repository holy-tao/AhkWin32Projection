#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12WorkGraphProperties extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12WorkGraphProperties
     * @type {Guid}
     */
    static IID => Guid("{065acf71-f863-4b89-82f4-02e4d5886757}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNumWorkGraphs", "GetProgramName", "GetWorkGraphIndex", "GetNumNodes", "GetNodeID", "GetNodeIndex", "GetNodeLocalRootArgumentsTableIndex", "GetNumEntrypoints", "GetEntrypointID", "GetEntrypointIndex", "GetEntrypointRecordSizeInBytes", "GetWorkGraphMemoryRequirements", "GetEntrypointRecordAlignmentInBytes"]

    /**
     * 
     * @returns {Integer} 
     */
    GetNumWorkGraphs() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} WorkGraphIndex 
     * @returns {PWSTR} 
     */
    GetProgramName(WorkGraphIndex) {
        result := ComCall(4, this, "uint", WorkGraphIndex, "char*")
        return result
    }

    /**
     * 
     * @param {PWSTR} pProgramName 
     * @returns {Integer} 
     */
    GetWorkGraphIndex(pProgramName) {
        pProgramName := pProgramName is String ? StrPtr(pProgramName) : pProgramName

        result := ComCall(5, this, "ptr", pProgramName, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} WorkGraphIndex 
     * @returns {Integer} 
     */
    GetNumNodes(WorkGraphIndex) {
        result := ComCall(6, this, "uint", WorkGraphIndex, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} WorkGraphIndex 
     * @param {Integer} NodeIndex 
     * @returns {D3D12_NODE_ID} 
     */
    GetNodeID(WorkGraphIndex, NodeIndex) {
        result := ComCall(7, this, "uint", WorkGraphIndex, "uint", NodeIndex, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} WorkGraphIndex 
     * @param {D3D12_NODE_ID} NodeID 
     * @returns {Integer} 
     */
    GetNodeIndex(WorkGraphIndex, NodeID) {
        result := ComCall(8, this, "uint", WorkGraphIndex, "ptr", NodeID, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} WorkGraphIndex 
     * @param {Integer} NodeIndex 
     * @returns {Integer} 
     */
    GetNodeLocalRootArgumentsTableIndex(WorkGraphIndex, NodeIndex) {
        result := ComCall(9, this, "uint", WorkGraphIndex, "uint", NodeIndex, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} WorkGraphIndex 
     * @returns {Integer} 
     */
    GetNumEntrypoints(WorkGraphIndex) {
        result := ComCall(10, this, "uint", WorkGraphIndex, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} WorkGraphIndex 
     * @param {Integer} EntrypointIndex 
     * @returns {D3D12_NODE_ID} 
     */
    GetEntrypointID(WorkGraphIndex, EntrypointIndex) {
        result := ComCall(11, this, "uint", WorkGraphIndex, "uint", EntrypointIndex, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} WorkGraphIndex 
     * @param {D3D12_NODE_ID} NodeID 
     * @returns {Integer} 
     */
    GetEntrypointIndex(WorkGraphIndex, NodeID) {
        result := ComCall(12, this, "uint", WorkGraphIndex, "ptr", NodeID, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} WorkGraphIndex 
     * @param {Integer} EntrypointIndex 
     * @returns {Integer} 
     */
    GetEntrypointRecordSizeInBytes(WorkGraphIndex, EntrypointIndex) {
        result := ComCall(13, this, "uint", WorkGraphIndex, "uint", EntrypointIndex, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} WorkGraphIndex 
     * @param {Pointer<D3D12_WORK_GRAPH_MEMORY_REQUIREMENTS>} pWorkGraphMemoryRequirements 
     * @returns {String} Nothing - always returns an empty string
     */
    GetWorkGraphMemoryRequirements(WorkGraphIndex, pWorkGraphMemoryRequirements) {
        ComCall(14, this, "uint", WorkGraphIndex, "ptr", pWorkGraphMemoryRequirements)
    }

    /**
     * 
     * @param {Integer} WorkGraphIndex 
     * @param {Integer} EntrypointIndex 
     * @returns {Integer} 
     */
    GetEntrypointRecordAlignmentInBytes(WorkGraphIndex, EntrypointIndex) {
        result := ComCall(15, this, "uint", WorkGraphIndex, "uint", EntrypointIndex, "uint")
        return result
    }
}
