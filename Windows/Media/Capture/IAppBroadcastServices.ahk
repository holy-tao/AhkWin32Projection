#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\AppBroadcastPreview.ahk
#Include .\AppBroadcastState.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IAppBroadcastServices extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBroadcastServices
     * @type {Guid}
     */
    static IID => Guid("{8660b4d6-969b-4e3c-ac3a-8b042ee4ee63}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CaptureTargetType", "put_CaptureTargetType", "get_BroadcastTitle", "put_BroadcastTitle", "get_BroadcastLanguage", "put_BroadcastLanguage", "get_UserName", "get_CanCapture", "EnterBroadcastModeAsync", "ExitBroadcastMode", "StartBroadcast", "PauseBroadcast", "ResumeBroadcast", "StartPreview", "get_State"]

    /**
     * @type {Integer} 
     */
    CaptureTargetType {
        get => this.get_CaptureTargetType()
        set => this.put_CaptureTargetType(value)
    }

    /**
     * @type {HSTRING} 
     */
    BroadcastTitle {
        get => this.get_BroadcastTitle()
        set => this.put_BroadcastTitle(value)
    }

    /**
     * @type {HSTRING} 
     */
    BroadcastLanguage {
        get => this.get_BroadcastLanguage()
        set => this.put_BroadcastLanguage(value)
    }

    /**
     * @type {HSTRING} 
     */
    UserName {
        get => this.get_UserName()
    }

    /**
     * @type {Boolean} 
     */
    CanCapture {
        get => this.get_CanCapture()
    }

    /**
     * @type {AppBroadcastState} 
     */
    State {
        get => this.get_State()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CaptureTargetType() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CaptureTargetType(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_BroadcastTitle() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
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
    put_BroadcastTitle(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_BroadcastLanguage() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
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
    put_BroadcastLanguage(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserName() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanCapture() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {AppBroadcastPlugIn} plugIn 
     * @returns {IAsyncOperation<Integer>} 
     */
    EnterBroadcastModeAsync(plugIn) {
        result := ComCall(14, this, "ptr", plugIn, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetUInt32(), operation)
    }

    /**
     * 
     * @param {Integer} reason 
     * @returns {HRESULT} 
     */
    ExitBroadcastMode(reason) {
        result := ComCall(15, this, "int", reason, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StartBroadcast() {
        result := ComCall(16, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PauseBroadcast() {
        result := ComCall(17, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResumeBroadcast() {
        result := ComCall(18, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {SIZE} desiredSize 
     * @returns {AppBroadcastPreview} 
     */
    StartPreview(desiredSize) {
        result := ComCall(19, this, "ptr", desiredSize, "ptr*", &preview := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppBroadcastPreview(preview)
    }

    /**
     * 
     * @returns {AppBroadcastState} 
     */
    get_State() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppBroadcastState(value)
    }
}
