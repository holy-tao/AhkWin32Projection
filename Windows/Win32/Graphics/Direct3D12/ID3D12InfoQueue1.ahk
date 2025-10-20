#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12InfoQueue.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12InfoQueue1 extends ID3D12InfoQueue{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12InfoQueue1
     * @type {Guid}
     */
    static IID => Guid("{2852dd88-b484-4c0c-b6b1-67168500e600}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 38

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterMessageCallback", "UnregisterMessageCallback"]

    /**
     * 
     * @param {Pointer<D3D12MessageFunc>} CallbackFunc 
     * @param {Integer} CallbackFilterFlags 
     * @param {Pointer<Void>} pContext 
     * @param {Pointer<Integer>} pCallbackCookie 
     * @returns {HRESULT} 
     */
    RegisterMessageCallback(CallbackFunc, CallbackFilterFlags, pContext, pCallbackCookie) {
        result := ComCall(38, this, "ptr", CallbackFunc, "int", CallbackFilterFlags, "ptr", pContext, "uint*", pCallbackCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} CallbackCookie 
     * @returns {HRESULT} 
     */
    UnregisterMessageCallback(CallbackCookie) {
        result := ComCall(39, this, "uint", CallbackCookie, "HRESULT")
        return result
    }
}
