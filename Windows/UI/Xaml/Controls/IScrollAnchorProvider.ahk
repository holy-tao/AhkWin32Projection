#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\UIElement.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Specifies a contract for a scrolling control that supports scroll anchoring.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.iscrollanchorprovider
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IScrollAnchorProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScrollAnchorProvider
     * @type {Guid}
     */
    static IID => Guid("{6ae99a0f-478c-5440-b2c6-ead4378ef8e4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentAnchor", "RegisterAnchorCandidate", "UnregisterAnchorCandidate"]

    /**
     * The currently chosen anchor element to use for scroll anchoring.
     * @remarks
     * If there are no anchor candidates registered with the [IScrollAnchorProvider](iscrollanchorprovider.md) or none have been chosen, then CurrentAnchor is **null**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.iscrollanchorprovider.currentanchor
     * @type {UIElement} 
     */
    CurrentAnchor {
        get => this.get_CurrentAnchor()
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_CurrentAnchor() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UIElement(value)
    }

    /**
     * Registers a [UIElement](../windows.ui.xaml/uielement.md) as a potential scroll anchor candidate.
     * @remarks
     * When an element has [CanBeScrollAnchor](../windows.ui.xaml/uielement_canbescrollanchor.md) set to **true** the framework locates the first [IScrollAnchorProvider](iscrollanchorprovider.md) in that element's chain of ancestors and automatically calls its RegisterAnchorCandidate method. This occurs both when the property is set on an existing element or an element is added to the live tree with the property already set.
     * 
     * Similarly, when the property is set to **false** (or an element is removed from the visual tree with the property set to **true**), the framework calls [UnregisterAnchorCandidate](iscrollanchorprovider_unregisteranchorcandidate_667335027.md) on the first [IScrollAnchorProvider](iscrollanchorprovider.md).
     * @param {UIElement} element A [UIElement](../windows.ui.xaml/uielement.md) within the subtree of the [IScrollAnchorProvider](iscrollanchorprovider.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.iscrollanchorprovider.registeranchorcandidate
     */
    RegisterAnchorCandidate(element) {
        result := ComCall(7, this, "ptr", element, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Unregisters a [UIElement](../windows.ui.xaml/uielement.md) as a potential scroll anchor candidate.
     * @remarks
     * When an element's [CanBeScrollAnchor](../windows.ui.xaml/uielement_canbescrollanchor.md) property changes to **false** (or the element is removed from the visual tree), the framework locates the first [IScrollAnchorProvider](iscrollanchorprovider.md) in that element's chain of ancestors and automatically calls its UnregisterAnchorCandidate method.
     * @param {UIElement} element A [UIElement](../windows.ui.xaml/uielement.md) within the subtree of the [IScrollAnchorProvider](iscrollanchorprovider.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.iscrollanchorprovider.unregisteranchorcandidate
     */
    UnregisterAnchorCandidate(element) {
        result := ComCall(8, this, "ptr", element, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
