#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\NavigationViewItemBase.ahk
#Include ..\Media\Animation\NavigationTransitionInfo.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class INavigationViewSelectionChangedEventArgs2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INavigationViewSelectionChangedEventArgs2
     * @type {Guid}
     */
    static IID => Guid("{fd5af806-d10a-5e8b-973f-3b8fda944625}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SelectedItemContainer", "get_RecommendedNavigationTransitionInfo"]

    /**
     * @type {NavigationViewItemBase} 
     */
    SelectedItemContainer {
        get => this.get_SelectedItemContainer()
    }

    /**
     * @type {NavigationTransitionInfo} 
     */
    RecommendedNavigationTransitionInfo {
        get => this.get_RecommendedNavigationTransitionInfo()
    }

    /**
     * 
     * @returns {NavigationViewItemBase} 
     */
    get_SelectedItemContainer() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NavigationViewItemBase(value)
    }

    /**
     * 
     * @returns {NavigationTransitionInfo} 
     */
    get_RecommendedNavigationTransitionInfo() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NavigationTransitionInfo(value)
    }
}
