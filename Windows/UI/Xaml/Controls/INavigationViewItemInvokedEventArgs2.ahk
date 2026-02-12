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
class INavigationViewItemInvokedEventArgs2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INavigationViewItemInvokedEventArgs2
     * @type {Guid}
     */
    static IID => Guid("{b568f2dd-515e-5770-a466-bd5f43fb6442}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InvokedItemContainer", "get_RecommendedNavigationTransitionInfo"]

    /**
     * @type {NavigationViewItemBase} 
     */
    InvokedItemContainer {
        get => this.get_InvokedItemContainer()
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
    get_InvokedItemContainer() {
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
