#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Marks an object to indicate to the system that it can resolve to a composition [Visual](visual.md).
 * @remarks
 * This interface is implemented by [UIElement](../windows.ui.xaml/uielement.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.ivisualelement
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IVisualElement extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVisualElement
     * @type {Guid}
     */
    static IID => Guid("{01e64612-1d82-42f4-8e3f-a722ded33fc7}")

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
