#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDXGIFactory6.ahk

/**
 * This interface enables registration for notifications to detect adapter enumeration state changes.
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_6/nn-dxgi1_6-idxgifactory7
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIFactory7 extends IDXGIFactory6{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIFactory7
     * @type {Guid}
     */
    static IID => Guid("{a4966eed-76db-44da-84c1-ee9a7afb20a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 30

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterAdaptersChangedEvent", "UnregisterAdaptersChangedEvent"]

    /**
     * Registers to receive notification of changes whenever the adapter enumeration state changes.
     * @param {HANDLE} hEvent A handle to the event object.
     * @returns {Integer} A key value for the registered event.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_6/nf-dxgi1_6-idxgifactory7-registeradapterschangedevent
     */
    RegisterAdaptersChangedEvent(hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(30, this, "ptr", hEvent, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Unregisters an event to stop receiving notifications when the adapter enumeration state changes.
     * @param {Integer} dwCookie A key value for the event to unregister.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful; an error code otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_6/nf-dxgi1_6-idxgifactory7-unregisteradapterschangedevent
     */
    UnregisterAdaptersChangedEvent(dwCookie) {
        result := ComCall(31, this, "uint", dwCookie, "HRESULT")
        return result
    }
}
