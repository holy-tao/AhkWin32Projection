#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILockScreenBadge.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a lock screen badge for an app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.lockscreen.lockscreenbadge
 * @namespace Windows.ApplicationModel.LockScreen
 * @version WindowsRuntime 1.4
 */
class LockScreenBadge extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILockScreenBadge

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILockScreenBadge.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the logo to display with the badge.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.lockscreen.lockscreenbadge.logo
     * @type {IRandomAccessStream} 
     */
    Logo {
        get => this.get_Logo()
    }

    /**
     * Gets the glyph to display.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.lockscreen.lockscreenbadge.glyph
     * @type {IRandomAccessStream} 
     */
    Glyph {
        get => this.get_Glyph()
    }

    /**
     * Gets the number to display with the badge.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.lockscreen.lockscreenbadge.number
     * @type {IReference<Integer>} 
     */
    Number {
        get => this.get_Number()
    }

    /**
     * Gets the name.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.lockscreen.lockscreenbadge.automationname
     * @type {HSTRING} 
     */
    AutomationName {
        get => this.get_AutomationName()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IRandomAccessStream} 
     */
    get_Logo() {
        if (!this.HasProp("__ILockScreenBadge")) {
            if ((queryResult := this.QueryInterface(ILockScreenBadge.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockScreenBadge := ILockScreenBadge(outPtr)
        }

        return this.__ILockScreenBadge.get_Logo()
    }

    /**
     * 
     * @returns {IRandomAccessStream} 
     */
    get_Glyph() {
        if (!this.HasProp("__ILockScreenBadge")) {
            if ((queryResult := this.QueryInterface(ILockScreenBadge.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockScreenBadge := ILockScreenBadge(outPtr)
        }

        return this.__ILockScreenBadge.get_Glyph()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_Number() {
        if (!this.HasProp("__ILockScreenBadge")) {
            if ((queryResult := this.QueryInterface(ILockScreenBadge.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockScreenBadge := ILockScreenBadge(outPtr)
        }

        return this.__ILockScreenBadge.get_Number()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AutomationName() {
        if (!this.HasProp("__ILockScreenBadge")) {
            if ((queryResult := this.QueryInterface(ILockScreenBadge.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockScreenBadge := ILockScreenBadge(outPtr)
        }

        return this.__ILockScreenBadge.get_AutomationName()
    }

    /**
     * Launches the app corresponding to the badge.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.lockscreen.lockscreenbadge.launchapp
     */
    LaunchApp() {
        if (!this.HasProp("__ILockScreenBadge")) {
            if ((queryResult := this.QueryInterface(ILockScreenBadge.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockScreenBadge := ILockScreenBadge(outPtr)
        }

        return this.__ILockScreenBadge.LaunchApp()
    }

;@endregion Instance Methods
}
