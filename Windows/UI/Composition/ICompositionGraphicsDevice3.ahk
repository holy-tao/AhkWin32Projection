#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CompositionMipmapSurface.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionGraphicsDevice3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionGraphicsDevice3
     * @type {Guid}
     */
    static IID => Guid("{37f67514-d3ef-49d1-b69d-0d8eabeb3626}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateMipmapSurface", "Trim"]

    /**
     * 
     * @param {SizeInt32} sizePixels 
     * @param {Integer} pixelFormat 
     * @param {Integer} alphaMode 
     * @returns {CompositionMipmapSurface} 
     */
    CreateMipmapSurface(sizePixels, pixelFormat, alphaMode) {
        result := ComCall(6, this, "ptr", sizePixels, "int", pixelFormat, "int", alphaMode, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionMipmapSurface(result_)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Trim() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
