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
     * 
     * @param {Pointer<UInt32>} pMinChunkSize 
     * @param {Pointer<UInt32>} pMaxChunkSize 
     * @param {Pointer<Int32>} pChunkingAlgorithm 
     * @param {Pointer<Int32>} pHashingAlgorithm 
     * @param {Pointer<Int32>} pCompressionAlgorithm 
     * @returns {HRESULT} 
     */
    GetConfiguration(pMinChunkSize, pMaxChunkSize, pChunkingAlgorithm, pHashingAlgorithm, pCompressionAlgorithm) {
        result := ComCall(3, this, "uint*", pMinChunkSize, "uint*", pMaxChunkSize, "int*", pChunkingAlgorithm, "int*", pHashingAlgorithm, "int*", pCompressionAlgorithm, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @param {BSTR} Path 
     * @param {Pointer<Int32>} pStatus 
     * @returns {HRESULT} 
     */
    GetVolumeStatus(Options, Path, pStatus) {
        Path := Path is String ? BSTR.Alloc(Path).Value : Path

        result := ComCall(4, this, "uint", Options, "ptr", Path, "int*", pStatus, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(5, this, "uint", Options, "ptr", Path, "ptr", ppDataPort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
