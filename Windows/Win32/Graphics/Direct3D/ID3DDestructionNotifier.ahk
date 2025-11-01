#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3dcommon/nn-d3dcommon-id3ddestructionotifier
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class ID3DDestructionNotifier extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterDestructionCallback", "UnregisterDestructionCallback"]

    /**
     * 
     * @param {Pointer<PFN_DESTRUCTION_CALLBACK>} callbackFn 
     * @param {Pointer<Void>} pData 
     * @param {Pointer<Integer>} pCallbackID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3dcommon/nf-d3dcommon-id3ddestructionotifier-registerdestructioncallback
     */
    RegisterDestructionCallback(callbackFn, pData, pCallbackID) {
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"
        pCallbackIDMarshal := pCallbackID is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", callbackFn, pDataMarshal, pData, pCallbackIDMarshal, pCallbackID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} callbackID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3dcommon/nf-d3dcommon-id3ddestructionotifier-unregisterdestructioncallback
     */
    UnregisterDestructionCallback(callbackID) {
        result := ComCall(4, this, "uint", callbackID, "HRESULT")
        return result
    }
}
