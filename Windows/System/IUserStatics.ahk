#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\UserWatcher.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include ..\Foundation\Collections\IVectorView.ahk
#Include .\User.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IUserStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserStatics
     * @type {Guid}
     */
    static IID => Guid("{155eb23b-242a-45e0-a2e9-3171fc6a7fdd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWatcher", "FindAllAsync", "FindAllAsyncByType", "FindAllAsyncByTypeAndStatus", "GetFromId"]

    /**
     * 
     * @returns {UserWatcher} 
     */
    CreateWatcher() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UserWatcher(result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<User>>} 
     */
    FindAllAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, User), operation)
    }

    /**
     * 
     * @param {Integer} type 
     * @returns {IAsyncOperation<IVectorView<User>>} 
     */
    FindAllAsyncByType(type) {
        result := ComCall(8, this, "int", type, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, User), operation)
    }

    /**
     * 
     * @param {Integer} type 
     * @param {Integer} status_ 
     * @returns {IAsyncOperation<IVectorView<User>>} 
     */
    FindAllAsyncByTypeAndStatus(type, status_) {
        result := ComCall(9, this, "int", type, "int", status_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, User), operation)
    }

    /**
     * 
     * @param {HSTRING} nonRoamableId 
     * @returns {User} 
     */
    GetFromId(nonRoamableId) {
        if(nonRoamableId is String) {
            pin := HSTRING.Create(nonRoamableId)
            nonRoamableId := pin.Value
        }
        nonRoamableId := nonRoamableId is Win32Handle ? NumGet(nonRoamableId, "ptr") : nonRoamableId

        result := ComCall(10, this, "ptr", nonRoamableId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return User(result_)
    }
}
