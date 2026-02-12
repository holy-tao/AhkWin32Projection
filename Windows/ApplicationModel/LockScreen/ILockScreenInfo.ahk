#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Storage\Streams\IRandomAccessStream.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\LockScreenBadge.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.LockScreen
 * @version WindowsRuntime 1.4
 */
class ILockScreenInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILockScreenInfo
     * @type {Guid}
     */
    static IID => Guid("{f59aa65c-9711-4dc9-a630-95b6cb8cdad0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_LockScreenImageChanged", "remove_LockScreenImageChanged", "get_LockScreenImage", "add_BadgesChanged", "remove_BadgesChanged", "get_Badges", "add_DetailTextChanged", "remove_DetailTextChanged", "get_DetailText", "add_AlarmIconChanged", "remove_AlarmIconChanged", "get_AlarmIcon"]

    /**
     * @type {IRandomAccessStream} 
     */
    LockScreenImage {
        get => this.get_LockScreenImage()
    }

    /**
     * @type {IVectorView<LockScreenBadge>} 
     */
    Badges {
        get => this.get_Badges()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    DetailText {
        get => this.get_DetailText()
    }

    /**
     * @type {IRandomAccessStream} 
     */
    AlarmIcon {
        get => this.get_AlarmIcon()
    }

    /**
     * 
     * @param {TypedEventHandler<LockScreenInfo, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LockScreenImageChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_LockScreenImageChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IRandomAccessStream} 
     */
    get_LockScreenImage() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStream(value)
    }

    /**
     * 
     * @param {TypedEventHandler<LockScreenInfo, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_BadgesChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(9, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BadgesChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVectorView<LockScreenBadge>} 
     */
    get_Badges() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(LockScreenBadge, value)
    }

    /**
     * 
     * @param {TypedEventHandler<LockScreenInfo, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DetailTextChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DetailTextChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_DetailText() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @param {TypedEventHandler<LockScreenInfo, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AlarmIconChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(15, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AlarmIconChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(16, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IRandomAccessStream} 
     */
    get_AlarmIcon() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRandomAccessStream(value)
    }
}
