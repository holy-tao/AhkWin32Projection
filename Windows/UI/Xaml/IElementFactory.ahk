#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\UIElement.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Supports the creation and recycling of [UIElement](uielement.md) objects.
 * @remarks
 * Two concrete implementations of this interface are:
 * 
 * 1. [DataTemplate](datatemplate.md), and
 * 1. [DataTemplateSelector](../windows.ui.xaml.controls/datatemplateselector.md)
 * 
 * The [GetElement](ielementfactory_getelement_92222689.md) method is used to retrieve a valid instance of a [UIElement](uielement.md). The [RecycleElement](ielementfactory_recycleelement_1023702976.md) method is used to recycle elements.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.ielementfactory
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IElementFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IElementFactory
     * @type {Guid}
     */
    static IID => Guid("{17d2ad90-1370-55c8-80e1-78b49004a9e1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetElement", "RecycleElement"]

    /**
     * Gets an [UIElement](uielement.md) object.
     * @remarks
     * When you call GetElement, the [UIElement](uielement.md) object that is returned can be added to the visual tree of another [UIElement](uielement.md). GetElement is not required to create a new instance each time it is invoked. The [UIElement](uielement.md) being returned may be an existing instance that has been prepared for re-use.  
     * 
     * For more info, see the remarks for the [DataTemplate.GetElement](datatemplate_getelement_92222689.md) method.
     * @param {ElementFactoryGetArgs} args An instance of [ElementFactoryGetArgs](elementfactorygetargs.md).
     * @returns {UIElement} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.ielementfactory.getelement
     */
    GetElement(args) {
        result := ComCall(6, this, "ptr", args, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UIElement(result_)
    }

    /**
     * Recycles a [UIElement](../windows.ui.xaml/uielement.md) that was previously retrieved using [GetElement](ielementfactory_getelement_92222689.md).
     * @remarks
     * For more info, see the remarks for the [DataTemplate.RecycleElement](datatemplate_recycleelement_1023702976.md) method.
     * @param {ElementFactoryRecycleArgs} args An instance of [ElementFactoryRecycleArgs](elementfactoryrecycleargs.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.ielementfactory.recycleelement
     */
    RecycleElement(args) {
        result := ComCall(7, this, "ptr", args, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
