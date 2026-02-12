#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CompositionDrawingSurface.ahk
#Include .\CompositionVirtualDrawingSurface.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionGraphicsDevice2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionGraphicsDevice2
     * @type {Guid}
     */
    static IID => Guid("{0fb8bdf6-c0f0-4bcc-9fb8-084982490d7d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDrawingSurface2", "CreateVirtualDrawingSurface"]

    /**
     * 
     * @param {SizeInt32} sizePixels 
     * @param {Integer} pixelFormat 
     * @param {Integer} alphaMode 
     * @returns {CompositionDrawingSurface} 
     */
    CreateDrawingSurface2(sizePixels, pixelFormat, alphaMode) {
        result := ComCall(6, this, "ptr", sizePixels, "int", pixelFormat, "int", alphaMode, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionDrawingSurface(result_)
    }

    /**
     * 
     * @param {SizeInt32} sizePixels 
     * @param {Integer} pixelFormat 
     * @param {Integer} alphaMode 
     * @returns {CompositionVirtualDrawingSurface} 
     */
    CreateVirtualDrawingSurface(sizePixels, pixelFormat, alphaMode) {
        result := ComCall(7, this, "ptr", sizePixels, "int", pixelFormat, "int", alphaMode, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionVirtualDrawingSurface(result_)
    }
}
