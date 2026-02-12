#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\AppInstance.ahk
#Include Activation\IActivatedEventArgs.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Foundation\Collections\IVector.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class IAppInstanceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppInstanceStatics
     * @type {Guid}
     */
    static IID => Guid("{9d11e77f-9ea6-47af-a6ec-46784c5ba254}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RecommendedInstance", "GetActivatedEventArgs", "FindOrRegisterInstanceForKey", "Unregister", "GetInstances"]

    /**
     * @type {AppInstance} 
     */
    RecommendedInstance {
        get => this.get_RecommendedInstance()
    }

    /**
     * 
     * @returns {AppInstance} 
     */
    get_RecommendedInstance() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppInstance(value)
    }

    /**
     * 
     * @returns {IActivatedEventArgs} 
     */
    GetActivatedEventArgs() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IActivatedEventArgs(result_)
    }

    /**
     * 
     * @param {HSTRING} key 
     * @returns {AppInstance} 
     */
    FindOrRegisterInstanceForKey(key) {
        if(key is String) {
            pin := HSTRING.Create(key)
            key := pin.Value
        }
        key := key is Win32Handle ? NumGet(key, "ptr") : key

        result := ComCall(8, this, "ptr", key, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppInstance(result_)
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
    Unregister() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<AppInstance>} 
     */
    GetInstances() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(AppInstance, result_)
    }
}
