#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostExtensibility2.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostExtensibility3 extends IDebugHostExtensibility2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostExtensibility3
     * @type {Guid}
     */
    static IID => Guid("{4be234de-d397-4378-bbb4-9055a425d7d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ExtendHostContext", "QueryHostContextExtension", "ReleaseHostContextExtension"]

    /**
     * 
     * @param {Integer} blobSize 
     * @param {Pointer<Guid>} identifier 
     * @param {Pointer<Integer>} blobId 
     * @returns {HRESULT} 
     */
    ExtendHostContext(blobSize, identifier, blobId) {
        blobIdMarshal := blobId is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", blobSize, "ptr", identifier, blobIdMarshal, blobId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} identifier 
     * @param {Pointer<Integer>} blobId 
     * @param {Pointer<Integer>} blobSize 
     * @returns {HRESULT} 
     */
    QueryHostContextExtension(identifier, blobId, blobSize) {
        blobIdMarshal := blobId is VarRef ? "uint*" : "ptr"
        blobSizeMarshal := blobSize is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", identifier, blobIdMarshal, blobId, blobSizeMarshal, blobSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} blobId 
     * @returns {HRESULT} 
     */
    ReleaseHostContextExtension(blobId) {
        result := ComCall(8, this, "uint", blobId, "HRESULT")
        return result
    }
}
