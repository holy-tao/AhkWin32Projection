#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFolderLauncherOptions.ahk
#Include .\ILauncherViewOptions.ahk
#Include ..\..\Guid.ahk

/**
 * Specifies the options to use when launching File Explorer to display the contents of a specific folder by calling the [LaunchFolderAsync(IStorageFolder, FolderLauncherOptions)](launcher_launchfolderasync_1551340761.md) method.
  * 
  * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.folderlauncheroptions
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class FolderLauncherOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFolderLauncherOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFolderLauncherOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Provides the list of items to select when File Explorer displays the contents of the specified folder.
     * @remarks
     * You can add and remove items in this collection. The ItemsToSelect property is read-only, however, because you can't delete the collection that it returns or provide another instance of a collection.
     * @see https://learn.microsoft.com/uwp/api/windows.system.folderlauncheroptions.itemstoselect
     * @type {IVector<IStorageItem>} 
     */
    ItemsToSelect {
        get => this.get_ItemsToSelect()
    }

    /**
     * Specifies how much space on the screen to leave for the calling app when launching File Explorer. The calling app can take up more or less space than File Explorer, or File Explorer can fill the entire screen.
     * @see https://learn.microsoft.com/uwp/api/windows.system.folderlauncheroptions.desiredremainingview
     * @type {Integer} 
     */
    DesiredRemainingView {
        get => this.get_DesiredRemainingView()
        set => this.put_DesiredRemainingView(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [FolderLauncherOptions](folderlauncheroptions.md) class.
     * 
     * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.System.FolderLauncherOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<IStorageItem>} 
     */
    get_ItemsToSelect() {
        if (!this.HasProp("__IFolderLauncherOptions")) {
            if ((queryResult := this.QueryInterface(IFolderLauncherOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFolderLauncherOptions := IFolderLauncherOptions(outPtr)
        }

        return this.__IFolderLauncherOptions.get_ItemsToSelect()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DesiredRemainingView() {
        if (!this.HasProp("__ILauncherViewOptions")) {
            if ((queryResult := this.QueryInterface(ILauncherViewOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILauncherViewOptions := ILauncherViewOptions(outPtr)
        }

        return this.__ILauncherViewOptions.get_DesiredRemainingView()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DesiredRemainingView(value) {
        if (!this.HasProp("__ILauncherViewOptions")) {
            if ((queryResult := this.QueryInterface(ILauncherViewOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILauncherViewOptions := ILauncherViewOptions(outPtr)
        }

        return this.__ILauncherViewOptions.put_DesiredRemainingView(value)
    }

;@endregion Instance Methods
}
