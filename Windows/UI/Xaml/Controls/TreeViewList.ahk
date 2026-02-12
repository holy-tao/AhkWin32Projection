#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ListView.ahk
#Include .\ITreeViewList.ahk
#Include .\ITreeViewListFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a flattened list of tree view items so that operations such as keyboard navigation and drag-and-drop can be inherited from ListView.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TreeViewList](/windows/winui/api/microsoft.ui.xaml.controls.treeviewlist) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.treeviewlist
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class TreeViewList extends ListView {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITreeViewList

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITreeViewList.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {TreeViewList} 
     */
    static CreateInstance() {
        if (!TreeViewList.HasProp("__ITreeViewListFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TreeViewList")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITreeViewListFactory.IID)
            TreeViewList.__ITreeViewListFactory := ITreeViewListFactory(factoryPtr)
        }

        return TreeViewList.__ITreeViewListFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
