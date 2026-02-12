#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include .\SystemUpdateLastErrorInfo.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SystemUpdateItem.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Update
 * @version WindowsRuntime 1.4
 */
class ISystemUpdateManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISystemUpdateManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{b2d3fcef-2971-51be-b41a-8bd703bb701a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsSupported", "get_State", "add_StateChanged", "remove_StateChanged", "get_DownloadProgress", "get_InstallProgress", "get_UserActiveHoursStart", "get_UserActiveHoursEnd", "get_UserActiveHoursMax", "TrySetUserActiveHours", "get_LastUpdateCheckTime", "get_LastUpdateInstallTime", "get_LastErrorInfo", "GetAutomaticRebootBlockIds", "BlockAutomaticRebootAsync", "UnblockAutomaticRebootAsync", "get_ExtendedError", "GetUpdateItems", "get_AttentionRequiredReason", "SetFlightRing", "GetFlightRing", "StartInstall", "RebootToCompleteInstall", "StartCancelUpdates"]

    /**
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * @type {Float} 
     */
    DownloadProgress {
        get => this.get_DownloadProgress()
    }

    /**
     * @type {Float} 
     */
    InstallProgress {
        get => this.get_InstallProgress()
    }

    /**
     * @type {TimeSpan} 
     */
    UserActiveHoursStart {
        get => this.get_UserActiveHoursStart()
    }

    /**
     * @type {TimeSpan} 
     */
    UserActiveHoursEnd {
        get => this.get_UserActiveHoursEnd()
    }

    /**
     * @type {Integer} 
     */
    UserActiveHoursMax {
        get => this.get_UserActiveHoursMax()
    }

    /**
     * @type {DateTime} 
     */
    LastUpdateCheckTime {
        get => this.get_LastUpdateCheckTime()
    }

    /**
     * @type {DateTime} 
     */
    LastUpdateInstallTime {
        get => this.get_LastUpdateInstallTime()
    }

    /**
     * @type {SystemUpdateLastErrorInfo} 
     */
    LastErrorInfo {
        get => this.get_LastErrorInfo()
    }

    /**
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * @type {Integer} 
     */
    AttentionRequiredReason {
        get => this.get_AttentionRequiredReason()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsSupported() {
        result := ComCall(6, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
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
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StateChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", token, "int")
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

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DownloadProgress() {
        result := ComCall(10, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_InstallProgress() {
        result := ComCall(11, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_UserActiveHoursStart() {
        value := TimeSpan()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_UserActiveHoursEnd() {
        value := TimeSpan()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UserActiveHoursMax() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} start 
     * @param {TimeSpan} end 
     * @returns {Boolean} 
     */
    TrySetUserActiveHours(start, end) {
        result := ComCall(15, this, "ptr", start, "ptr", end, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_LastUpdateCheckTime() {
        value := DateTime()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_LastUpdateInstallTime() {
        value := DateTime()
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SystemUpdateLastErrorInfo} 
     */
    get_LastErrorInfo() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SystemUpdateLastErrorInfo(value)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    GetAutomaticRebootBlockIds() {
        result := ComCall(19, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), result_)
    }

    /**
     * 
     * @param {HSTRING} lockId 
     * @returns {IAsyncOperation<Boolean>} 
     */
    BlockAutomaticRebootAsync(lockId) {
        if(lockId is String) {
            pin := HSTRING.Create(lockId)
            lockId := pin.Value
        }
        lockId := lockId is Win32Handle ? NumGet(lockId, "ptr") : lockId

        result := ComCall(20, this, "ptr", lockId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {HSTRING} lockId 
     * @returns {IAsyncOperation<Boolean>} 
     */
    UnblockAutomaticRebootAsync(lockId) {
        if(lockId is String) {
            pin := HSTRING.Create(lockId)
            lockId := pin.Value
        }
        lockId := lockId is Win32Handle ? NumGet(lockId, "ptr") : lockId

        result := ComCall(21, this, "ptr", lockId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        result := ComCall(22, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<SystemUpdateItem>} 
     */
    GetUpdateItems() {
        result := ComCall(23, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(SystemUpdateItem, result_)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AttentionRequiredReason() {
        result := ComCall(24, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} flightRing 
     * @returns {Boolean} 
     */
    SetFlightRing(flightRing) {
        if(flightRing is String) {
            pin := HSTRING.Create(flightRing)
            flightRing := pin.Value
        }
        flightRing := flightRing is Win32Handle ? NumGet(flightRing, "ptr") : flightRing

        result := ComCall(25, this, "ptr", flightRing, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetFlightRing() {
        result_ := HSTRING()
        result := ComCall(26, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} action 
     * @returns {HRESULT} 
     */
    StartInstall(action) {
        result := ComCall(27, this, "int", action, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RebootToCompleteInstall() {
        result := ComCall(28, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StartCancelUpdates() {
        result := ComCall(29, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
