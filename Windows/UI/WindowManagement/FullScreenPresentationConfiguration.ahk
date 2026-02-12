#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\AppWindowPresentationConfiguration.ahk
#Include .\IFullScreenPresentationConfiguration.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the full screen configuration for an AppWindowPresenter.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.fullscreenpresentationconfiguration
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class FullScreenPresentationConfiguration extends AppWindowPresentationConfiguration {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFullScreenPresentationConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFullScreenPresentationConfiguration.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether Exclusive Fullscreen Mode is on.
     * @remarks
     * If **true**, this dismisses things like StatusBar and requires 'double swipe' to bring in system affordances such as action center.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.fullscreenpresentationconfiguration.isexclusive
     * @type {Boolean} 
     */
    IsExclusive {
        get => this.get_IsExclusive()
        set => this.put_IsExclusive(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the FullScreenPresentationConfiguration class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.WindowManagement.FullScreenPresentationConfiguration")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsExclusive() {
        if (!this.HasProp("__IFullScreenPresentationConfiguration")) {
            if ((queryResult := this.QueryInterface(IFullScreenPresentationConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFullScreenPresentationConfiguration := IFullScreenPresentationConfiguration(outPtr)
        }

        return this.__IFullScreenPresentationConfiguration.get_IsExclusive()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsExclusive(value) {
        if (!this.HasProp("__IFullScreenPresentationConfiguration")) {
            if ((queryResult := this.QueryInterface(IFullScreenPresentationConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFullScreenPresentationConfiguration := IFullScreenPresentationConfiguration(outPtr)
        }

        return this.__IFullScreenPresentationConfiguration.put_IsExclusive(value)
    }

;@endregion Instance Methods
}
