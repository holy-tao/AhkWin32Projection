#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowTabGroup.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a group that a `WindowTab` can be associated with.
 * @remarks
 * > [!IMPORTANT]
 * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabgroup
 * @namespace Windows.UI.Shell
 * @version WindowsRuntime 1.4
 */
class WindowTabGroup extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowTabGroup

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowTabGroup.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the text that the system displays as the title for a group of tabs.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabgroup.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * Gets or sets the icon that the system displays for a group of tabs.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.windowtabgroup.icon
     * @type {WindowTabIcon} 
     */
    Icon {
        get => this.get_Icon()
        set => this.put_Icon(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [WindowTabGroup](windowtabgroup.md) class.
     * @remarks
     * > [!IMPORTANT]
     * > This API is for Win32 desktop apps only. UWP and other app types are not supported.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Shell.WindowTabGroup")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__IWindowTabGroup")) {
            if ((queryResult := this.QueryInterface(IWindowTabGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTabGroup := IWindowTabGroup(outPtr)
        }

        return this.__IWindowTabGroup.get_Title()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__IWindowTabGroup")) {
            if ((queryResult := this.QueryInterface(IWindowTabGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTabGroup := IWindowTabGroup(outPtr)
        }

        return this.__IWindowTabGroup.put_Title(value)
    }

    /**
     * 
     * @returns {WindowTabIcon} 
     */
    get_Icon() {
        if (!this.HasProp("__IWindowTabGroup")) {
            if ((queryResult := this.QueryInterface(IWindowTabGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTabGroup := IWindowTabGroup(outPtr)
        }

        return this.__IWindowTabGroup.get_Icon()
    }

    /**
     * 
     * @param {WindowTabIcon} value 
     * @returns {HRESULT} 
     */
    put_Icon(value) {
        if (!this.HasProp("__IWindowTabGroup")) {
            if ((queryResult := this.QueryInterface(IWindowTabGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowTabGroup := IWindowTabGroup(outPtr)
        }

        return this.__IWindowTabGroup.put_Icon(value)
    }

;@endregion Instance Methods
}
