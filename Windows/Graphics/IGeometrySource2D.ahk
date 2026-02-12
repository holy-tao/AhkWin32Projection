#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Allows for classes that implement this interface to be expressed as a [CompositionPath](../windows.ui.composition/compositionpath.md) for the purposes of using the [Windows.UI.Composition](../windows.ui.composition/windows_ui_composition.md) APIs.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.igeometrysource2d
 * @namespace Windows.Graphics
 * @version WindowsRuntime 1.4
 */
class IGeometrySource2D extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeometrySource2D
     * @type {Guid}
     */
    static IID => Guid("{caff7902-670c-4181-a624-da977203b845}")

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
