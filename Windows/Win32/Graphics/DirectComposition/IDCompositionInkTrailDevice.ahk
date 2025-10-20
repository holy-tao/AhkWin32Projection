#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionInkTrailDevice extends IUnknown{
    /**
     * The interface identifier for IDCompositionInkTrailDevice
     * @type {Guid}
     */
    static IID => Guid("{df0c7cec-cdeb-4d4a-b91c-721bf22f4e6c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IDCompositionDelegatedInkTrail>} inkTrail 
     * @returns {HRESULT} 
     */
    CreateDelegatedInkTrail(inkTrail) {
        result := ComCall(3, this, "ptr", inkTrail, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} swapChain 
     * @param {Pointer<IDCompositionDelegatedInkTrail>} inkTrail 
     * @returns {HRESULT} 
     */
    CreateDelegatedInkTrailForSwapChain(swapChain, inkTrail) {
        result := ComCall(4, this, "ptr", swapChain, "ptr", inkTrail, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
