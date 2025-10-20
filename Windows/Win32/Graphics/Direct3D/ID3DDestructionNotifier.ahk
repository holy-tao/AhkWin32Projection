#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class ID3DDestructionNotifier extends IUnknown{
    /**
     * The interface identifier for ID3DDestructionNotifier
     * @type {Guid}
     */
    static IID => Guid("{a06eb39a-50da-425b-8c31-4eecd6c270f3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PFN_DESTRUCTION_CALLBACK>} callbackFn 
     * @param {Pointer<Void>} pData 
     * @param {Pointer<UInt32>} pCallbackID 
     * @returns {HRESULT} 
     */
    RegisterDestructionCallback(callbackFn, pData, pCallbackID) {
        result := ComCall(3, this, "ptr", callbackFn, "ptr", pData, "uint*", pCallbackID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} callbackID 
     * @returns {HRESULT} 
     */
    UnregisterDestructionCallback(callbackID) {
        result := ComCall(4, this, "uint", callbackID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
