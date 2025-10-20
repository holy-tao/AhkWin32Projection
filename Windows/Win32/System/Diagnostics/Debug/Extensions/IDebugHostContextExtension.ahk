#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostContextExtension extends IUnknown{
    /**
     * The interface identifier for IDebugHostContextExtension
     * @type {Guid}
     */
    static IID => Guid("{5e67115d-5449-4553-a9e9-ca446578cab2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} blobId 
     * @param {Integer} dataSize 
     * @param {Pointer<Void>} data 
     * @returns {HRESULT} 
     */
    AddExtensionData(blobId, dataSize, data) {
        result := ComCall(3, this, "uint", blobId, "uint", dataSize, "ptr", data, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostContext>} immutableContext 
     * @returns {HRESULT} 
     */
    FinalizeContext(immutableContext) {
        result := ComCall(4, this, "ptr", immutableContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
