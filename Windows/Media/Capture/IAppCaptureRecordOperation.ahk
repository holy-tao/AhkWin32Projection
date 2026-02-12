#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Storage\StorageFile.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IAppCaptureRecordOperation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppCaptureRecordOperation
     * @type {Guid}
     */
    static IID => Guid("{c66020a9-1538-495c-9bbb-2ba870ec5861}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StopRecording", "get_State", "get_ErrorCode", "get_Duration", "get_File", "get_IsFileTruncated", "add_StateChanged", "remove_StateChanged", "add_DurationGenerated", "remove_DurationGenerated", "add_FileGenerated", "remove_FileGenerated"]

    /**
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * @type {IReference<Integer>} 
     */
    ErrorCode {
        get => this.get_ErrorCode()
    }

    /**
     * @type {IReference<TimeSpan>} 
     */
    Duration {
        get => this.get_Duration()
    }

    /**
     * @type {StorageFile} 
     */
    File {
        get => this.get_File()
    }

    /**
     * @type {IReference<Boolean>} 
     */
    IsFileTruncated {
        get => this.get_IsFileTruncated()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopRecording() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ErrorCode() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_Duration() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetTimeSpan(), value)
    }

    /**
     * 
     * @returns {StorageFile} 
     */
    get_File() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFile(value)
    }

    /**
     * 
     * @returns {IReference<Boolean>} 
     */
    get_IsFileTruncated() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetBoolean(), value)
    }

    /**
     * 
     * @param {TypedEventHandler<AppCaptureRecordOperation, AppCaptureRecordingStateChangedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_StateChanged(value) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", value, "ptr", token, "int")
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
    remove_StateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<AppCaptureRecordOperation, AppCaptureDurationGeneratedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_DurationGenerated(value) {
        token := EventRegistrationToken()
        result := ComCall(14, this, "ptr", value, "ptr", token, "int")
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
    remove_DurationGenerated(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(15, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<AppCaptureRecordOperation, AppCaptureFileGeneratedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_FileGenerated(value) {
        token := EventRegistrationToken()
        result := ComCall(16, this, "ptr", value, "ptr", token, "int")
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
    remove_FileGenerated(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(17, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
