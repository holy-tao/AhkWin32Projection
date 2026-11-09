#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HRESULT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class IMFMediaEngineVideoRendererEffect extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaEngineVideoRendererEffect
     * @type {Guid}
     */
    static IID => Guid("{6bdf1188-6ec8-44ff-8ccc-bfca0d12afa3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetEffect", "ClearEffect"]

    /**
     * @param {IUnknown} pEffect 
     * @returns {HRESULT} 
     */
    SetEffect(pEffect) {
        result := ComCall(3, this, "ptr", pEffect, "HRESULT")
        return result
    }

    /**
     * @returns {HRESULT} 
     */
    ClearEffect() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
