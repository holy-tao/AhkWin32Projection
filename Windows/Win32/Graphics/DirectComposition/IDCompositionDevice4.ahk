#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionDevice3.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionDevice4 extends IDCompositionDevice3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionDevice4
     * @type {Guid}
     */
    static IID => Guid("{85fc5cca-2da6-494c-86b6-4a775c049b8a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 37

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CheckCompositionTextureSupport", "CreateCompositionTexture"]

    /**
     * 
     * @param {IUnknown} renderingDevice 
     * @param {Pointer<BOOL>} supportsCompositionTextures 
     * @returns {HRESULT} 
     */
    CheckCompositionTextureSupport(renderingDevice, supportsCompositionTextures) {
        result := ComCall(37, this, "ptr", renderingDevice, "ptr", supportsCompositionTextures, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} d3dTexture 
     * @param {Pointer<IDCompositionTexture>} compositionTexture 
     * @returns {HRESULT} 
     */
    CreateCompositionTexture(d3dTexture, compositionTexture) {
        result := ComCall(38, this, "ptr", d3dTexture, "ptr*", compositionTexture, "HRESULT")
        return result
    }
}
