#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\ICompositionSurface.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionGraphicsDevice4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionGraphicsDevice4
     * @type {Guid}
     */
    static IID => Guid("{5a73bff9-a97f-4cf5-ba46-98ef358e71b1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CaptureAsync"]

    /**
     * 
     * @param {Visual} captureVisual 
     * @param {SizeInt32} size_ 
     * @param {Integer} pixelFormat 
     * @param {Integer} alphaMode 
     * @param {Float} sdrBoost 
     * @returns {IAsyncOperation<ICompositionSurface>} 
     */
    CaptureAsync(captureVisual, size_, pixelFormat, alphaMode, sdrBoost) {
        result := ComCall(6, this, "ptr", captureVisual, "ptr", size_, "int", pixelFormat, "int", alphaMode, "float", sdrBoost, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ICompositionSurface, operation)
    }
}
