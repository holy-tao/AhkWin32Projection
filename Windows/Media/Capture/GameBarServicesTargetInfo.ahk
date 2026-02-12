#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGameBarServicesTargetInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides metadata about a Game Bar services target.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.gamebarservicestargetinfo
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class GameBarServicesTargetInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGameBarServicesTargetInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGameBarServicesTargetInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the display name of the Game Bar services target app.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.gamebarservicestargetinfo.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets the unique identifier of the Game Bar services target app.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.gamebarservicestargetinfo.appid
     * @type {HSTRING} 
     */
    AppId {
        get => this.get_AppId()
    }

    /**
     * Gets the unique identifier of the Game Bar services target title.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.gamebarservicestargetinfo.titleid
     * @type {HSTRING} 
     */
    TitleId {
        get => this.get_TitleId()
    }

    /**
     * Gets a value indicating the display mode of the Game Bar services target app.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.gamebarservicestargetinfo.displaymode
     * @type {Integer} 
     */
    DisplayMode {
        get => this.get_DisplayMode()
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
        if (!this.HasProp("__IGameBarServicesTargetInfo")) {
            if ((queryResult := this.QueryInterface(IGameBarServicesTargetInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameBarServicesTargetInfo := IGameBarServicesTargetInfo(outPtr)
        }

        return this.__IGameBarServicesTargetInfo.get_DisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppId() {
        if (!this.HasProp("__IGameBarServicesTargetInfo")) {
            if ((queryResult := this.QueryInterface(IGameBarServicesTargetInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameBarServicesTargetInfo := IGameBarServicesTargetInfo(outPtr)
        }

        return this.__IGameBarServicesTargetInfo.get_AppId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TitleId() {
        if (!this.HasProp("__IGameBarServicesTargetInfo")) {
            if ((queryResult := this.QueryInterface(IGameBarServicesTargetInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameBarServicesTargetInfo := IGameBarServicesTargetInfo(outPtr)
        }

        return this.__IGameBarServicesTargetInfo.get_TitleId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DisplayMode() {
        if (!this.HasProp("__IGameBarServicesTargetInfo")) {
            if ((queryResult := this.QueryInterface(IGameBarServicesTargetInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameBarServicesTargetInfo := IGameBarServicesTargetInfo(outPtr)
        }

        return this.__IGameBarServicesTargetInfo.get_DisplayMode()
    }

;@endregion Instance Methods
}
