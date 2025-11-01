#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICompositionDrawingSurfaceInterop.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Composition
 * @version v4.0.30319
 */
class ICompositionDrawingSurfaceInterop2 extends ICompositionDrawingSurfaceInterop{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionDrawingSurfaceInterop2
     * @type {Guid}
     */
    static IID => Guid("{41e64aae-98c0-4239-8e95-a330dd6aa18b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CopySurface"]

    /**
     * 
     * @param {IUnknown} destinationResource 
     * @param {Integer} destinationOffsetX 
     * @param {Integer} destinationOffsetY 
     * @param {Pointer<RECT>} sourceRectangle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.composition.interop/nf-windows-ui-composition-interop-icompositiondrawingsurfaceinterop2-copysurface
     */
    CopySurface(destinationResource, destinationOffsetX, destinationOffsetY, sourceRectangle) {
        result := ComCall(9, this, "ptr", destinationResource, "int", destinationOffsetX, "int", destinationOffsetY, "ptr", sourceRectangle, "HRESULT")
        return result
    }
}
