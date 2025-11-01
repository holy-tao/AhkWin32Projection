#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
        result := ComCall(3, this, "uint*", pMinChunkSize, "uint*", pMaxChunkSize, "int*", pChunkingAlgorithm, "int*", pHashingAlgorithm, "int*", pCompressionAlgorithm, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @param {BSTR} Path 
     * @param {Pointer<Integer>} pStatus 
     * @returns {HRESULT} 
     */
    GetVolumeStatus(Options, Path, pStatus) {
        Path := Path is String ? BSTR.Alloc(Path).Value : Path

        result := ComCall(4, this, "uint", Options, "ptr", Path, "int*", pStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @param {BSTR} Path 
     * @param {Pointer<IDedupDataPort>} ppDataPort 
     * @returns {HRESULT} 
     */
    GetVolumeDataPort(Options, Path, ppDataPort) {
        Path := Path is String ? BSTR.Alloc(Path).Value : Path

        result := ComCall(5, this, "uint", Options, "ptr", Path, "ptr*", ppDataPort, "HRESULT")
        return result
    }
}
