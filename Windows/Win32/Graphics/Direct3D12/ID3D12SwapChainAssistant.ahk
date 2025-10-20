#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12SwapChainAssistant extends IUnknown{
    /**
     * The interface identifier for ID3D12SwapChainAssistant
     * @type {Guid}
     */
    static IID => Guid("{f1df64b6-57fd-49cd-8807-c0eb88b45c8f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {LUID} 
     */
    GetLUID() {
        result := ComCall(3, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetSwapChainObject(riid, ppv) {
        result := ComCall(4, this, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riidResource 
     * @param {Pointer<Void>} ppvResource 
     * @param {Pointer<Guid>} riidQueue 
     * @param {Pointer<Void>} ppvQueue 
     * @returns {HRESULT} 
     */
    GetCurrentResourceAndCommandQueue(riidResource, ppvResource, riidQueue, ppvQueue) {
        result := ComCall(5, this, "ptr", riidResource, "ptr", ppvResource, "ptr", riidQueue, "ptr", ppvQueue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InsertImplicitSync() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
