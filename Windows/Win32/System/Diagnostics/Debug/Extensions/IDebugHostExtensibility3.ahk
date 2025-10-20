#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostExtensibility2.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostExtensibility3 extends IDebugHostExtensibility2{
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
     * 
     * @param {Integer} blobSize 
     * @param {Pointer<Guid>} identifier 
     * @param {Pointer<UInt32>} blobId 
     * @returns {HRESULT} 
     */
    ExtendHostContext(blobSize, identifier, blobId) {
        result := ComCall(6, this, "uint", blobSize, "ptr", identifier, "uint*", blobId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} identifier 
     * @param {Pointer<UInt32>} blobId 
     * @param {Pointer<UInt32>} blobSize 
     * @returns {HRESULT} 
     */
    QueryHostContextExtension(identifier, blobId, blobSize) {
        result := ComCall(7, this, "ptr", identifier, "uint*", blobId, "uint*", blobSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} blobId 
     * @returns {HRESULT} 
     */
    ReleaseHostContextExtension(blobId) {
        result := ComCall(8, this, "uint", blobId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
