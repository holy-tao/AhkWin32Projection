#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IDedupDataPort.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 * @version v4.0.30319
 */
class IDedupDataPortManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDedupDataPortManager
     * @type {Guid}
     */
    static IID => Guid("{44677452-b90a-445e-8192-cdcfe81511fb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetConfiguration", "GetVolumeStatus", "GetVolumeDataPort"]

    /**
     * 
     * @param {Pointer<Integer>} pMinChunkSize 
     * @param {Pointer<Integer>} pMaxChunkSize 
     * @param {Pointer<Integer>} pChunkingAlgorithm 
     * @param {Pointer<Integer>} pHashingAlgorithm 
     * @param {Pointer<Integer>} pCompressionAlgorithm 
     * @returns {HRESULT} 
     */
    GetConfiguration(pMinChunkSize, pMaxChunkSize, pChunkingAlgorithm, pHashingAlgorithm, pCompressionAlgorithm) {
        pMinChunkSizeMarshal := pMinChunkSize is VarRef ? "uint*" : "ptr"
        pMaxChunkSizeMarshal := pMaxChunkSize is VarRef ? "uint*" : "ptr"
        pChunkingAlgorithmMarshal := pChunkingAlgorithm is VarRef ? "int*" : "ptr"
        pHashingAlgorithmMarshal := pHashingAlgorithm is VarRef ? "int*" : "ptr"
        pCompressionAlgorithmMarshal := pCompressionAlgorithm is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pMinChunkSizeMarshal, pMinChunkSize, pMaxChunkSizeMarshal, pMaxChunkSize, pChunkingAlgorithmMarshal, pChunkingAlgorithm, pHashingAlgorithmMarshal, pHashingAlgorithm, pCompressionAlgorithmMarshal, pCompressionAlgorithm, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @param {BSTR} Path 
     * @returns {Integer} 
     */
    GetVolumeStatus(Options, Path) {
        Path := Path is String ? BSTR.Alloc(Path).Value : Path

        result := ComCall(4, this, "uint", Options, "ptr", Path, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * 
     * @param {Integer} Options 
     * @param {BSTR} Path 
     * @returns {IDedupDataPort} 
     */
    GetVolumeDataPort(Options, Path) {
        Path := Path is String ? BSTR.Alloc(Path).Value : Path

        result := ComCall(5, this, "uint", Options, "ptr", Path, "ptr*", &ppDataPort := 0, "HRESULT")
        return IDedupDataPort(ppDataPort)
    }
}
