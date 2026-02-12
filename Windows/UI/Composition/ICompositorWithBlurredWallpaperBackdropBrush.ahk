#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CompositionBackdropBrush.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositorWithBlurredWallpaperBackdropBrush extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositorWithBlurredWallpaperBackdropBrush
     * @type {Guid}
     */
    static IID => Guid("{0d8fb190-f122-5b8d-9fdd-543b0d8eb7f3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryCreateBlurredWallpaperBackdropBrush"]

    /**
     * 
     * @returns {CompositionBackdropBrush} 
     */
    TryCreateBlurredWallpaperBackdropBrush() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionBackdropBrush(result_)
    }
}
