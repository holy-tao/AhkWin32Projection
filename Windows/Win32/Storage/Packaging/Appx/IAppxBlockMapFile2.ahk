#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxBlockMapFile.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxBlockMapFile2 extends IAppxBlockMapFile{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxBlockMapFile2
     * @type {Guid}
     */
    static IID => Guid("{54785f78-40e9-11ee-be56-0242ac120002}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBlockSize"]

    /**
     * 
     * @param {Pointer<Integer>} blockSize 
     * @returns {HRESULT} 
     */
    GetBlockSize(blockSize) {
        blockSizeMarshal := blockSize is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, blockSizeMarshal, blockSize, "HRESULT")
        return result
    }
}
