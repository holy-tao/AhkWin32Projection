#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostContextExtensibility extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostContextExtensibility
     * @type {Guid}
     */
    static IID => Guid("{35ae8e40-f234-4ef1-b8ea-0dfbc58a2043}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["HasExtensionData", "ReadExtensionData", "CloneContextForModification", "CloneContextWithModification"]

    /**
     * 
     * @param {Integer} blobId 
     * @returns {Boolean} 
     */
    HasExtensionData(blobId) {
        result := ComCall(3, this, "uint", blobId, "int")
        return result
    }

    /**
     * 
     * @param {Integer} blobId 
     * @param {Integer} bufferSize 
     * @param {Pointer<Void>} buffer 
     * @returns {HRESULT} 
     */
    ReadExtensionData(blobId, bufferSize, buffer) {
        result := ComCall(4, this, "uint", blobId, "uint", bufferSize, "ptr", buffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostContextExtension>} extensionHandle 
     * @returns {HRESULT} 
     */
    CloneContextForModification(extensionHandle) {
        result := ComCall(5, this, "ptr*", extensionHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} blobId 
     * @param {Integer} dataSize 
     * @param {Pointer<Void>} data 
     * @param {Pointer<IDebugHostContext>} clonedContext 
     * @returns {HRESULT} 
     */
    CloneContextWithModification(blobId, dataSize, data, clonedContext) {
        result := ComCall(6, this, "uint", blobId, "uint", dataSize, "ptr", data, "ptr*", clonedContext, "HRESULT")
        return result
    }
}
