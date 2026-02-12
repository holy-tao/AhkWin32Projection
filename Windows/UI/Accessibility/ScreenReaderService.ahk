#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IScreenReaderService.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\ScreenReaderService.ahk
#Include .\ScreenReaderPositionChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides properties and events associated with a screen reader device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.accessibility.screenreaderservice
 * @namespace Windows.UI.Accessibility
 * @version WindowsRuntime 1.4
 */
class ScreenReaderService extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IScreenReaderService

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IScreenReaderService.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets both the rectangle corresponding to the current position of the screen reader focus indicator (such as the Narrator focus highlight box) and whether the screen reader is in continuous reading mode.
     * @remarks
     * If there is no currently active screen reader, or one cannot be detected, the data returned by this property is not reliable.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.accessibility.screenreaderservice.currentscreenreaderposition
     * @type {ScreenReaderPositionChangedEventArgs} 
     */
    CurrentScreenReaderPosition {
        get => this.get_CurrentScreenReaderPosition()
    }

    /**
     * Occurs when the location of the screen reader focus indicator (such as the Narrator focus highlight box) changes.
     * @type {TypedEventHandler<ScreenReaderService, ScreenReaderPositionChangedEventArgs>}
    */
    OnScreenReaderPositionChanged {
        get {
            if(!this.HasProp("__OnScreenReaderPositionChanged")){
                this.__OnScreenReaderPositionChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{51b01f42-eefc-56d2-8185-23de8f080e0a}"),
                    ScreenReaderService,
                    ScreenReaderPositionChangedEventArgs
                )
                this.__OnScreenReaderPositionChangedToken := this.add_ScreenReaderPositionChanged(this.__OnScreenReaderPositionChanged.iface)
            }
            return this.__OnScreenReaderPositionChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ScreenReaderService](screenreaderservice.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Accessibility.ScreenReaderService")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnScreenReaderPositionChangedToken")) {
            this.remove_ScreenReaderPositionChanged(this.__OnScreenReaderPositionChangedToken)
            this.__OnScreenReaderPositionChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {ScreenReaderPositionChangedEventArgs} 
     */
    get_CurrentScreenReaderPosition() {
        if (!this.HasProp("__IScreenReaderService")) {
            if ((queryResult := this.QueryInterface(IScreenReaderService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScreenReaderService := IScreenReaderService(outPtr)
        }

        return this.__IScreenReaderService.get_CurrentScreenReaderPosition()
    }

    /**
     * 
     * @param {TypedEventHandler<ScreenReaderService, ScreenReaderPositionChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ScreenReaderPositionChanged(handler) {
        if (!this.HasProp("__IScreenReaderService")) {
            if ((queryResult := this.QueryInterface(IScreenReaderService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScreenReaderService := IScreenReaderService(outPtr)
        }

        return this.__IScreenReaderService.add_ScreenReaderPositionChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ScreenReaderPositionChanged(token) {
        if (!this.HasProp("__IScreenReaderService")) {
            if ((queryResult := this.QueryInterface(IScreenReaderService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScreenReaderService := IScreenReaderService(outPtr)
        }

        return this.__IScreenReaderService.remove_ScreenReaderPositionChanged(token)
    }

;@endregion Instance Methods
}
