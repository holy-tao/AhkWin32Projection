#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IAppxFile.ahk

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxFile2 extends IAppxFile{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxFile2
     * @type {Guid}
     */
    static IID => Guid("{0c830b3c-40e9-11ee-be56-0242ac120002}")

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
     * @returns {Integer} 
     */
    GetBlockSize() {
        result := ComCall(8, this, "uint*", &blockSize := 0, "HRESULT")
        return blockSize
    }
}
