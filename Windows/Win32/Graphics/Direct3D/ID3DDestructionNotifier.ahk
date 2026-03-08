#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * **ID3DDestructionNotifier** is an interface that you can use to register for callbacks when a Direct3D nano-COM object is destroyed.
 * @remarks
 * The <b>ID3DDestructionNotifier</b> can be used to track resources which are being unexpectedly released early, or providing a log of object disposal.
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
     * Registers a user-defined callback to be invoked on destruction of the object from which this [ID3DDestructionNotifier](/windows/win32/api/d3dcommon/nn-d3dcommon-id3ddestructionotifier) was created.
     * @remarks
     * An example of this interface being used to log the destruction of an **ID3D12Resource**.
     * 
     * ```cppcx
     * @param {Pointer<PFN_DESTRUCTION_CALLBACK>} callbackFn Type: <b>PFN_DESTRUCTION_CALLBACK</b>
     * 
     * A user-defined callback to be invoked when the object is destroyed.
     * @param {Pointer<Void>} pData Type: **void\***
     * 
     * The data to pass to *callbackFn* when invoked
     * @returns {Integer} Type: **[UINT](/windows/win32/winprog/windows-data-types)\***
     * 
     * Pointer to a **UINT** used to identify the callback, and to pass to <a href="https://docs.microsoft.com/windows/win32/api/d3dcommon/nf-d3dcommon-id3ddestructionotifier-unregisterdestructioncallback"></a> to unregister the callback.
     * @see https://learn.microsoft.com/windows/win32/api/d3dcommon/nf-d3dcommon-id3ddestructionotifier-registerdestructioncallback
     */
    RegisterDestructionCallback(callbackFn, pData) {
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", callbackFn, pDataMarshal, pData, "uint*", &pCallbackID := 0, "HRESULT")
        return pCallbackID
    }

    /**
     * Unregisters a callback that was registered with [RegisterDestructionCallback](/windows/win32/api/d3dcommon/nf-d3dcommon-id3ddestructionotifier-registerdestructioncallback).
     * @param {Integer} callbackID Type: **[UINT](/windows/win32/winprog/windows-data-types)**
     * 
     * The **UINT** that was created by the *pCallbackID* argument to <b><a href="https://docs.microsoft.com/windows/win32/api/d3dcommon/nf-d3dcommon-id3ddestructionotifier-registerdestructioncallback">ID3DDestructionNotifier::RegisterDestructionCallback</a></b>.
     * @returns {HRESULT} Type: **[HRESULT](/windows/win32/com/structure-of-com-error-codes)**
     * 
     * If this function succeeds, it returns **S_OK**.
     * @see https://learn.microsoft.com/windows/win32/api/d3dcommon/nf-d3dcommon-id3ddestructionotifier-unregisterdestructioncallback
     */
    UnregisterDestructionCallback(callbackID) {
        result := ComCall(4, this, "uint", callbackID, "HRESULT")
        return result
    }
}
