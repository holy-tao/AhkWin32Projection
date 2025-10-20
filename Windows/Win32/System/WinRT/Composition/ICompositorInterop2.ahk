#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Composition
 * @version v4.0.30319
 */
class ICompositorInterop2 extends IUnknown{
    /**
     * The interface identifier for ICompositorInterop2
     * @type {Guid}
     */
    static IID => Guid("{d3eef34c-0667-4afc-8d13-867607b0fe91}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} renderingDevice 
     * @param {Pointer<BOOL>} supportsCompositionTextures 
     * @returns {HRESULT} 
     */
    CheckCompositionTextureSupport(renderingDevice, supportsCompositionTextures) {
        result := ComCall(3, this, "ptr", renderingDevice, "ptr", supportsCompositionTextures, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} d3dTexture 
     * @param {Pointer<CompositionTexture>} compositionTexture 
     * @returns {HRESULT} 
     */
    CreateCompositionTexture(d3dTexture, compositionTexture) {
        result := ComCall(4, this, "ptr", d3dTexture, "ptr", compositionTexture, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
