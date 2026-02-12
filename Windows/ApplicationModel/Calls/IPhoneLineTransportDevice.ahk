#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class IPhoneLineTransportDevice extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhoneLineTransportDevice
     * @type {Guid}
     */
    static IID => Guid("{efa8f889-cffa-59f4-97e4-74705b7dc490}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceId", "get_Transport", "RequestAccessAsync", "RegisterApp", "RegisterAppForUser", "UnregisterApp", "UnregisterAppForUser", "IsRegistered", "Connect", "ConnectAsync"]

    /**
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * @type {Integer} 
     */
    Transport {
        get => this.get_Transport()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Transport() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    RequestAccessAsync() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * Registers the AppInstance ID for a process.
     * @remarks
     * The <b>RegisterAppInstance</b> function issues an 
     *      <b>IOCTL_CCF_REGISTER_APPINSTANCE</b> call to the CCF mini-filter. The function 
     *      passes the <i>AppInstance</i> <b>GUID</b>, the 
     *      process handle, and the tagged child processes to the CCF cache that maps the process handle to the 
     *      <i>AppInstanceId</i>.
     * 
     * The issued IOCTL for tagging another process checks if the current process has 
     *      <b>PROCESS_TERMINATE</b> access to the target process.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The CCF Filter failed to allocate the proper cache objects to fulfill this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current process that's trying to tag the process specified by 
     *         <i>ProcessHandle</i> doesn't have <b>PROCESS_TERMINATE</b> 
     *         access to that process.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>ProcessHandle</i> is not a handle to a process.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The CCF mini-filter is not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OBJECT_ALREADY_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Another <i>AppInstance</i><b>GUID</b> is provided for the same 
     *         process, which means that the 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/smbclnt/nf-smbclnt-registerappinstance">RegisterAppInstance</a> function was called twice 
     *         or the application was registered twice.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/smbclnt/nf-smbclnt-registerappinstance
     */
    RegisterApp() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {User} user_ 
     * @returns {HRESULT} 
     */
    RegisterAppForUser(user_) {
        result := ComCall(10, this, "ptr", user_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes the active instance of an application from the recovery list.
     * @remarks
     * You do not need to call this function before exiting. You need to remove the registration only if you choose to not recover data.
     * @returns {HRESULT} This function returns <b>S_OK</b> on success or one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Internal error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-unregisterapplicationrecoverycallback
     */
    UnregisterApp() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {User} user_ 
     * @returns {HRESULT} 
     */
    UnregisterAppForUser(user_) {
        result := ComCall(12, this, "ptr", user_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsRegistered() {
        result := ComCall(13, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Represents a connection between two shapes in a drawing, such as a line and a box in an organization chart.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/connect-element-connects_type-complextypevisio-xml
     */
    Connect() {
        result := ComCall(14, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    ConnectAsync() {
        result := ComCall(15, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
