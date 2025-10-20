#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.CompositionSwapchain
 * @version v4.0.30319
 */
class IPresentationBuffer extends IUnknown{
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
     * 
     * @param {Pointer<HANDLE>} availableEventHandle 
     * @returns {HRESULT} 
     */
    GetAvailableEvent(availableEventHandle) {
        result := ComCall(3, this, "ptr", availableEventHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} isAvailable 
     * @returns {HRESULT} 
     */
    IsAvailable(isAvailable) {
        result := ComCall(4, this, "char*", isAvailable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
