#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12SwapChainAssistant extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLUID", "GetSwapChainObject", "GetCurrentResourceAndCommandQueue", "InsertImplicitSync"]

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
     * @returns {Pointer<Void>} 
     */
    GetSwapChainObject(riid) {
        result := ComCall(4, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Pointer<Guid>} riidResource 
     * @param {Pointer<Pointer<Void>>} ppvResource 
     * @param {Pointer<Guid>} riidQueue 
     * @param {Pointer<Pointer<Void>>} ppvQueue 
     * @returns {HRESULT} 
     */
    GetCurrentResourceAndCommandQueue(riidResource, ppvResource, riidQueue, ppvQueue) {
        ppvResourceMarshal := ppvResource is VarRef ? "ptr*" : "ptr"
        ppvQueueMarshal := ppvQueue is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", riidResource, ppvResourceMarshal, ppvResource, "ptr", riidQueue, ppvQueueMarshal, ppvQueue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InsertImplicitSync() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
