#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILockScreenInfo.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\LockScreenInfo.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides access to the same data that the default lock screen has access to, such as wallpaper, badges, and so on.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.lockscreen.lockscreeninfo
 * @namespace Windows.ApplicationModel.LockScreen
 * @version WindowsRuntime 1.4
 */
class LockScreenInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILockScreenInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILockScreenInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the image to display on the lock screen.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.lockscreen.lockscreeninfo.lockscreenimage
     * @type {IRandomAccessStream} 
     */
    LockScreenImage {
        get => this.get_LockScreenImage()
    }

    /**
     * Gets the badges to display.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.lockscreen.lockscreeninfo.badges
     * @type {IVectorView<LockScreenBadge>} 
     */
    Badges {
        get => this.get_Badges()
    }

    /**
     * Gets the detail text to display.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.lockscreen.lockscreeninfo.detailtext
     * @type {IVectorView<HSTRING>} 
     */
    DetailText {
        get => this.get_DetailText()
    }

    /**
     * Gets the alarm icon to display.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.lockscreen.lockscreeninfo.alarmicon
     * @type {IRandomAccessStream} 
     */
    AlarmIcon {
        get => this.get_AlarmIcon()
    }

    /**
     * Indicates the lock screen image has changed.
     * @type {TypedEventHandler<LockScreenInfo, IInspectable>}
    */
    OnLockScreenImageChanged {
        get {
            if(!this.HasProp("__OnLockScreenImageChanged")){
                this.__OnLockScreenImageChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{8be9e6a3-f88a-5429-8da3-676b7d4f1a5b}"),
                    LockScreenInfo,
                    IInspectable
                )
                this.__OnLockScreenImageChangedToken := this.add_LockScreenImageChanged(this.__OnLockScreenImageChanged.iface)
            }
            return this.__OnLockScreenImageChanged
        }
    }

    /**
     * Indicates the badges have changed.
     * @type {TypedEventHandler<LockScreenInfo, IInspectable>}
    */
    OnBadgesChanged {
        get {
            if(!this.HasProp("__OnBadgesChanged")){
                this.__OnBadgesChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{8be9e6a3-f88a-5429-8da3-676b7d4f1a5b}"),
                    LockScreenInfo,
                    IInspectable
                )
                this.__OnBadgesChangedToken := this.add_BadgesChanged(this.__OnBadgesChanged.iface)
            }
            return this.__OnBadgesChanged
        }
    }

    /**
     * Indicates the detail text has changed.
     * @type {TypedEventHandler<LockScreenInfo, IInspectable>}
    */
    OnDetailTextChanged {
        get {
            if(!this.HasProp("__OnDetailTextChanged")){
                this.__OnDetailTextChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{8be9e6a3-f88a-5429-8da3-676b7d4f1a5b}"),
                    LockScreenInfo,
                    IInspectable
                )
                this.__OnDetailTextChangedToken := this.add_DetailTextChanged(this.__OnDetailTextChanged.iface)
            }
            return this.__OnDetailTextChanged
        }
    }

    /**
     * Indicates the alarm icon has changed.
     * @type {TypedEventHandler<LockScreenInfo, IInspectable>}
    */
    OnAlarmIconChanged {
        get {
            if(!this.HasProp("__OnAlarmIconChanged")){
                this.__OnAlarmIconChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{8be9e6a3-f88a-5429-8da3-676b7d4f1a5b}"),
                    LockScreenInfo,
                    IInspectable
                )
                this.__OnAlarmIconChangedToken := this.add_AlarmIconChanged(this.__OnAlarmIconChanged.iface)
            }
            return this.__OnAlarmIconChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnLockScreenImageChangedToken")) {
            this.remove_LockScreenImageChanged(this.__OnLockScreenImageChangedToken)
            this.__OnLockScreenImageChanged.iface.Dispose()
        }

        if(this.HasProp("__OnBadgesChangedToken")) {
            this.remove_BadgesChanged(this.__OnBadgesChangedToken)
            this.__OnBadgesChanged.iface.Dispose()
        }

        if(this.HasProp("__OnDetailTextChangedToken")) {
            this.remove_DetailTextChanged(this.__OnDetailTextChangedToken)
            this.__OnDetailTextChanged.iface.Dispose()
        }

        if(this.HasProp("__OnAlarmIconChangedToken")) {
            this.remove_AlarmIconChanged(this.__OnAlarmIconChangedToken)
            this.__OnAlarmIconChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<LockScreenInfo, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LockScreenImageChanged(handler) {
        if (!this.HasProp("__ILockScreenInfo")) {
            if ((queryResult := this.QueryInterface(ILockScreenInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockScreenInfo := ILockScreenInfo(outPtr)
        }

        return this.__ILockScreenInfo.add_LockScreenImageChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_LockScreenImageChanged(token) {
        if (!this.HasProp("__ILockScreenInfo")) {
            if ((queryResult := this.QueryInterface(ILockScreenInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockScreenInfo := ILockScreenInfo(outPtr)
        }

        return this.__ILockScreenInfo.remove_LockScreenImageChanged(token)
    }

    /**
     * 
     * @returns {IRandomAccessStream} 
     */
    get_LockScreenImage() {
        if (!this.HasProp("__ILockScreenInfo")) {
            if ((queryResult := this.QueryInterface(ILockScreenInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockScreenInfo := ILockScreenInfo(outPtr)
        }

        return this.__ILockScreenInfo.get_LockScreenImage()
    }

    /**
     * 
     * @param {TypedEventHandler<LockScreenInfo, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_BadgesChanged(handler) {
        if (!this.HasProp("__ILockScreenInfo")) {
            if ((queryResult := this.QueryInterface(ILockScreenInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockScreenInfo := ILockScreenInfo(outPtr)
        }

        return this.__ILockScreenInfo.add_BadgesChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BadgesChanged(token) {
        if (!this.HasProp("__ILockScreenInfo")) {
            if ((queryResult := this.QueryInterface(ILockScreenInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockScreenInfo := ILockScreenInfo(outPtr)
        }

        return this.__ILockScreenInfo.remove_BadgesChanged(token)
    }

    /**
     * 
     * @returns {IVectorView<LockScreenBadge>} 
     */
    get_Badges() {
        if (!this.HasProp("__ILockScreenInfo")) {
            if ((queryResult := this.QueryInterface(ILockScreenInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockScreenInfo := ILockScreenInfo(outPtr)
        }

        return this.__ILockScreenInfo.get_Badges()
    }

    /**
     * 
     * @param {TypedEventHandler<LockScreenInfo, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DetailTextChanged(handler) {
        if (!this.HasProp("__ILockScreenInfo")) {
            if ((queryResult := this.QueryInterface(ILockScreenInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockScreenInfo := ILockScreenInfo(outPtr)
        }

        return this.__ILockScreenInfo.add_DetailTextChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DetailTextChanged(token) {
        if (!this.HasProp("__ILockScreenInfo")) {
            if ((queryResult := this.QueryInterface(ILockScreenInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockScreenInfo := ILockScreenInfo(outPtr)
        }

        return this.__ILockScreenInfo.remove_DetailTextChanged(token)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_DetailText() {
        if (!this.HasProp("__ILockScreenInfo")) {
            if ((queryResult := this.QueryInterface(ILockScreenInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockScreenInfo := ILockScreenInfo(outPtr)
        }

        return this.__ILockScreenInfo.get_DetailText()
    }

    /**
     * 
     * @param {TypedEventHandler<LockScreenInfo, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AlarmIconChanged(handler) {
        if (!this.HasProp("__ILockScreenInfo")) {
            if ((queryResult := this.QueryInterface(ILockScreenInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockScreenInfo := ILockScreenInfo(outPtr)
        }

        return this.__ILockScreenInfo.add_AlarmIconChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AlarmIconChanged(token) {
        if (!this.HasProp("__ILockScreenInfo")) {
            if ((queryResult := this.QueryInterface(ILockScreenInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockScreenInfo := ILockScreenInfo(outPtr)
        }

        return this.__ILockScreenInfo.remove_AlarmIconChanged(token)
    }

    /**
     * 
     * @returns {IRandomAccessStream} 
     */
    get_AlarmIcon() {
        if (!this.HasProp("__ILockScreenInfo")) {
            if ((queryResult := this.QueryInterface(ILockScreenInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockScreenInfo := ILockScreenInfo(outPtr)
        }

        return this.__ILockScreenInfo.get_AlarmIcon()
    }

;@endregion Instance Methods
}
