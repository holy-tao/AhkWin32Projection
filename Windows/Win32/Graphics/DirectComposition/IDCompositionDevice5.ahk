#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionDynamicTexture.ahk
#Include .\IDCompositionDevice4.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionDevice5 extends IDCompositionDevice4{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionDevice5
     * @type {Guid}
     */
    static IID => Guid("{2c6bebfe-a603-472f-af34-d2443356e61b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 39

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDynamicTexture"]

    /**
     * 
     * @returns {IDCompositionDynamicTexture} 
     */
    CreateDynamicTexture() {
        result := ComCall(39, this, "ptr*", &compositionDynamicTexture := 0, "HRESULT")
        return IDCompositionDynamicTexture(compositionDynamicTexture)
    }
}
