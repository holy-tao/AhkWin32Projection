#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/presentation/nn-presentation-ipresentationbuffer
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 * @version v4.0.30319
 */
class IPresentationBuffer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPresentationBuffer
     * @type {Guid}
     */
    static IID => Guid("{2e217d3a-5abb-4138-9a13-a775593c89ca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAvailableEvent", "IsAvailable"]

    /**
     * 
     * @returns {HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationbuffer-getavailableevent
     */
    GetAvailableEvent() {
        availableEventHandle := HANDLE()
        result := ComCall(3, this, "ptr", availableEventHandle, "HRESULT")
        return availableEventHandle
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/presentation/nf-presentation-ipresentationbuffer-isavailable
     */
    IsAvailable() {
        result := ComCall(4, this, "char*", &isAvailable := 0, "HRESULT")
        return isAvailable
    }
}
