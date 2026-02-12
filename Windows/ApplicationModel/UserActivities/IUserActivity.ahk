#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\UserActivityVisualElements.ahk
#Include ..\..\Foundation\Uri.ahk
#Include .\IUserActivityContentInfo.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include .\UserActivitySession.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents the content metadata of this activity in JSON format.
 * @remarks
 * For example, if your activity was reading an RSS feed, the content might include the name of the article and its author.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.iuseractivitycontentinfo
 * @namespace Windows.ApplicationModel.UserActivities
 * @version WindowsRuntime 1.4
 */
class IUserActivity extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserActivity
     * @type {Guid}
     */
    static IID => Guid("{fc103e9e-2cab-4d36-aea2-b4bb556cef0f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_State", "get_ActivityId", "get_VisualElements", "get_ContentUri", "put_ContentUri", "get_ContentType", "put_ContentType", "get_FallbackUri", "put_FallbackUri", "get_ActivationUri", "put_ActivationUri", "get_ContentInfo", "put_ContentInfo", "SaveAsync", "CreateSession"]

    /**
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * @type {HSTRING} 
     */
    ActivityId {
        get => this.get_ActivityId()
    }

    /**
     * @type {UserActivityVisualElements} 
     */
    VisualElements {
        get => this.get_VisualElements()
    }

    /**
     * @type {Uri} 
     */
    ContentUri {
        get => this.get_ContentUri()
        set => this.put_ContentUri(value)
    }

    /**
     * @type {HSTRING} 
     */
    ContentType {
        get => this.get_ContentType()
        set => this.put_ContentType(value)
    }

    /**
     * @type {Uri} 
     */
    FallbackUri {
        get => this.get_FallbackUri()
        set => this.put_FallbackUri(value)
    }

    /**
     * @type {Uri} 
     */
    ActivationUri {
        get => this.get_ActivationUri()
        set => this.put_ActivationUri(value)
    }

    /**
     * @type {IUserActivityContentInfo} 
     */
    ContentInfo {
        get => this.get_ContentInfo()
        set => this.put_ContentInfo(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ActivityId() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {UserActivityVisualElements} 
     */
    get_VisualElements() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UserActivityVisualElements(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ContentUri() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_ContentUri(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContentType() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ContentType(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_FallbackUri() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_FallbackUri(value) {
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ActivationUri() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_ActivationUri(value) {
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IUserActivityContentInfo} 
     */
    get_ContentInfo() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUserActivityContentInfo(value)
    }

    /**
     * 
     * @param {IUserActivityContentInfo} value 
     * @returns {HRESULT} 
     */
    put_ContentInfo(value) {
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    SaveAsync() {
        result := ComCall(19, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @returns {UserActivitySession} 
     */
    CreateSession() {
        result := ComCall(20, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UserActivitySession(result_)
    }
}
