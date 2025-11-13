#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionDynamicTexture extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionDynamicTexture
     * @type {Guid}
     */
    static IID => Guid("{a1de1d3f-6405-447f-8e95-1383a34b0277}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetTexture", "SetTexture1"]

    /**
     * 
     * @param {IDCompositionTexture} pTexture 
     * @param {Pointer<RECT>} pRects 
     * @param {Pointer} rectCount 
     * @returns {HRESULT} 
     */
    SetTexture(pTexture, pRects, rectCount) {
        result := ComCall(3, this, "ptr", pTexture, "ptr", pRects, "ptr", rectCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionTexture} pTexture 
     * @returns {HRESULT} 
     */
    SetTexture1(pTexture) {
        result := ComCall(4, this, "ptr", pTexture, "HRESULT")
        return result
    }
}
