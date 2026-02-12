#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppDisplayInfo.ahk
#Include ..\..\Guid.ahk

/**
 * Provides an application's name, description, and logo.
 * @remarks
 * This class can be used to get information about applications that are registered as protocol handlers. You can get an instance of this class from [AppInfo.DisplayInfo](appinfo_displayinfo.md).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appdisplayinfo
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class AppDisplayInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppDisplayInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppDisplayInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the application's display name.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appdisplayinfo.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets the application's description.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appdisplayinfo.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IAppDisplayInfo")) {
            if ((queryResult := this.QueryInterface(IAppDisplayInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppDisplayInfo := IAppDisplayInfo(outPtr)
        }

        return this.__IAppDisplayInfo.get_DisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IAppDisplayInfo")) {
            if ((queryResult := this.QueryInterface(IAppDisplayInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppDisplayInfo := IAppDisplayInfo(outPtr)
        }

        return this.__IAppDisplayInfo.get_Description()
    }

    /**
     * Get the application's logo.
     * @param {SIZE} size_ The size of the rectangle in which the logo must fit.
     * @returns {RandomAccessStreamReference} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appdisplayinfo.getlogo
     */
    GetLogo(size_) {
        if (!this.HasProp("__IAppDisplayInfo")) {
            if ((queryResult := this.QueryInterface(IAppDisplayInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppDisplayInfo := IAppDisplayInfo(outPtr)
        }

        return this.__IAppDisplayInfo.GetLogo(size_)
    }

;@endregion Instance Methods
}
