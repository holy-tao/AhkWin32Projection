#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowTab.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents information about how a tab in an application should be displayed by the system.
 * @remarks
 * > [!IMPORTANT]
 * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtab
 * @namespace Windows.UI.Shell
 * @version WindowsRuntime 1.4
 */
class WindowTab extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowTab

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowTab.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets an arbitrary object value that can be used to store custom information about this object.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtab.tag
     * @type {IInspectable} 
     */
    Tag {
        get => this.get_Tag()
        set => this.put_Tag(value)
    }

    /**
     * Gets or sets the text that the system displays as the title for the tab.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtab.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * Gets or sets the icon that the system displays for the tab.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtab.icon
     * @type {WindowTabIcon} 
     */
    Icon {
        get => this.get_Icon()
        set => this.put_Icon(value)
    }

    /**
     * Gets or sets a string that identifies a [SecondaryTile](../windows.ui.startscreen/secondarytile.md) used by your app. Setting this property indicates that the tab should be treated as if opened by the secondary tile.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * 
     * If your app uses a [SecondaryTile](../windows.ui.startscreen/secondarytile.md), you can set this property to associate the tab with it. The tab will be treated as if it were launched by the `SecondaryTile`.
     * 
     * For more info, see [Secondary tiles](/windows/apps/design/shell/tiles-and-notifications/secondary-tiles), the [SecondaryTile](../windows.ui.startscreen/secondarytile.md) class, and the [SecondaryTile.TileId](../windows.ui.startscreen/secondarytile_tileid.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtab.treatassecondarytileid
     * @type {HSTRING} 
     */
    TreatAsSecondaryTileId {
        get => this.get_TreatAsSecondaryTileId()
        set => this.put_TreatAsSecondaryTileId(value)
    }

    /**
     * Gets or sets the group of tabs that this tab is associated with, if any.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtab.group
     * @type {WindowTabGroup} 
     */
    Group {
        get => this.get_Group()
        set => this.put_Group(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [WindowTab](windowtab.md) class.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Shell.WindowTab")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Tag() {
        if (!this.HasProp("__IWindowTab")) {
            if ((queryResult := this.QueryInterface(IWindowTab.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTab := IWindowTab(outPtr)
        }

        return this.__IWindowTab.get_Tag()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Tag(value) {
        if (!this.HasProp("__IWindowTab")) {
            if ((queryResult := this.QueryInterface(IWindowTab.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTab := IWindowTab(outPtr)
        }

        return this.__IWindowTab.put_Tag(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__IWindowTab")) {
            if ((queryResult := this.QueryInterface(IWindowTab.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTab := IWindowTab(outPtr)
        }

        return this.__IWindowTab.get_Title()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__IWindowTab")) {
            if ((queryResult := this.QueryInterface(IWindowTab.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTab := IWindowTab(outPtr)
        }

        return this.__IWindowTab.put_Title(value)
    }

    /**
     * 
     * @returns {WindowTabIcon} 
     */
    get_Icon() {
        if (!this.HasProp("__IWindowTab")) {
            if ((queryResult := this.QueryInterface(IWindowTab.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTab := IWindowTab(outPtr)
        }

        return this.__IWindowTab.get_Icon()
    }

    /**
     * 
     * @param {WindowTabIcon} value 
     * @returns {HRESULT} 
     */
    put_Icon(value) {
        if (!this.HasProp("__IWindowTab")) {
            if ((queryResult := this.QueryInterface(IWindowTab.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTab := IWindowTab(outPtr)
        }

        return this.__IWindowTab.put_Icon(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TreatAsSecondaryTileId() {
        if (!this.HasProp("__IWindowTab")) {
            if ((queryResult := this.QueryInterface(IWindowTab.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTab := IWindowTab(outPtr)
        }

        return this.__IWindowTab.get_TreatAsSecondaryTileId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_TreatAsSecondaryTileId(value) {
        if (!this.HasProp("__IWindowTab")) {
            if ((queryResult := this.QueryInterface(IWindowTab.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTab := IWindowTab(outPtr)
        }

        return this.__IWindowTab.put_TreatAsSecondaryTileId(value)
    }

    /**
     * 
     * @returns {WindowTabGroup} 
     */
    get_Group() {
        if (!this.HasProp("__IWindowTab")) {
            if ((queryResult := this.QueryInterface(IWindowTab.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTab := IWindowTab(outPtr)
        }

        return this.__IWindowTab.get_Group()
    }

    /**
     * 
     * @param {WindowTabGroup} value 
     * @returns {HRESULT} 
     */
    put_Group(value) {
        if (!this.HasProp("__IWindowTab")) {
            if ((queryResult := this.QueryInterface(IWindowTab.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTab := IWindowTab(outPtr)
        }

        return this.__IWindowTab.put_Group(value)
    }

    /**
     * Notifies the system that a thumbnail image of the app tab is available to be shown.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtab.reportthumbnailavailable
     */
    ReportThumbnailAvailable() {
        if (!this.HasProp("__IWindowTab")) {
            if ((queryResult := this.QueryInterface(IWindowTab.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTab := IWindowTab(outPtr)
        }

        return this.__IWindowTab.ReportThumbnailAvailable()
    }

;@endregion Instance Methods
}
