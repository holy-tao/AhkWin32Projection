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
     * 
     * @param {HANDLE} hEvent 
     * @param {Pointer<UInt32>} pdwCookie 
     * @returns {HRESULT} 
     */
    RegisterAdaptersChangedEvent(hEvent, pdwCookie) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(30, this, "ptr", hEvent, "uint*", pdwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    UnregisterAdaptersChangedEvent(dwCookie) {
        result := ComCall(31, this, "uint", dwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
