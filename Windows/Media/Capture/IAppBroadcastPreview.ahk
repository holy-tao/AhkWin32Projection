#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include .\AppBroadcastPreviewStreamReader.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IAppBroadcastPreview extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBroadcastPreview
     * @type {Guid}
     */
    static IID => Guid("{14b60f5a-6e4a-4b80-a14f-67ee77d153e7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StopPreview", "get_PreviewState", "get_ErrorCode", "add_PreviewStateChanged", "remove_PreviewStateChanged", "get_PreviewStreamReader"]

    /**
     * @type {Integer} 
     */
    PreviewState {
        get => this.get_PreviewState()
    }

    /**
     * @type {IReference<Integer>} 
     */
    ErrorCode {
        get => this.get_ErrorCode()
    }

    /**
     * @type {AppBroadcastPreviewStreamReader} 
     */
    PreviewStreamReader {
        get => this.get_PreviewStreamReader()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopPreview() {
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
    get_PreviewState() {
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
     * @param {TypedEventHandler<AppBroadcastPreview, AppBroadcastPreviewStateChangedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_PreviewStateChanged(value) {
        token := EventRegistrationToken()
        result := ComCall(9, this, "ptr", value, "ptr", token, "int")
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
    remove_PreviewStateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {AppBroadcastPreviewStreamReader} 
     */
    get_PreviewStreamReader() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppBroadcastPreviewStreamReader(value)
    }
}
