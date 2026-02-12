#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents the content of a surface that can be used to paint the bounds of a `SpriteVisual`.
 * @remarks
 * All surface types that can be used to paint a [SpriteVisual](spritevisual.md) must implement this interface.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.icompositionsurface
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionSurface extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionSurface
     * @type {Guid}
     */
    static IID => Guid("{1527540d-42c7-47a6-a408-668f79a90dfb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
