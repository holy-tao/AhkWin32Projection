#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\StorageProviderSyncRootInfo.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class IStorageProviderSyncRootManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderSyncRootManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{3e99fbbf-8fe3-4b40-abc7-f6fc3d74c98e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Register", "Unregister", "GetSyncRootInformationForFolder", "GetSyncRootInformationForId", "GetCurrentSyncRoots"]

    /**
     * The Register export function must be implemented in all parser DLLs. The implementation of Register creates and fills-in a property database for a protocol. Network Monitor uses the database to determine which properties the protocol supports.
     * @remarks
     * Network Monitor starts calling the **Register** function as soon as a capture is loaded. Network Monitor calls the **Register** function for each protocol it can identify. The [CreateProtocol](createprotocol.md) function passes a pointer to the **Register** function.
     * 
     * The implementation of **Register** includes calls to the following functions.
     * 
     * -   A call to the [CreatePropertyDatabase](createpropertydatabase.md) and [AddProperty](/previous-versions/bb251873(v=msdn.10)) functions to create a database of all the properties that the protocol supports.
     * -   A call to the [CreateHandoffTable](createhandofftable.md) function is required if the protocol uses a [*handoff set*](h.md).
     * 
     * If the parser DLL contains multiple parsers, and the parser can detect more than one protocol, you must implement a **Register** function for each protocol.
     * 
     * 
     * 
     * | For Information on                                        | See                                                    |
     * |-----------------------------------------------------------|--------------------------------------------------------|
     * | What parsers are, and how they work with Network Monitor. | [Parsers](parsers.md)                                 |
     * | Which entry points are included in the parser DLL.        | [Parser DLL Architecture](parser-dll-architecture.md) |
     * | How to implement **Register**  includes an example.       | [Implementing Register](implementing-register.md)     |
     * @param {StorageProviderSyncRootInfo} syncRootInformation 
     * @returns {HRESULT} None.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/NetMon2/register-parser
     */
    Register(syncRootInformation) {
        result := ComCall(6, this, "ptr", syncRootInformation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes the active instance of an application from the recovery list.
     * @remarks
     * You do not need to call this function before exiting. You need to remove the registration only if you choose to not recover data.
     * @param {HSTRING} id 
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
    Unregister(id) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(7, this, "ptr", id, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IStorageFolder} folder_ 
     * @returns {StorageProviderSyncRootInfo} 
     */
    GetSyncRootInformationForFolder(folder_) {
        result := ComCall(8, this, "ptr", folder_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageProviderSyncRootInfo(result_)
    }

    /**
     * 
     * @param {HSTRING} id 
     * @returns {StorageProviderSyncRootInfo} 
     */
    GetSyncRootInformationForId(id) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(9, this, "ptr", id, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageProviderSyncRootInfo(result_)
    }

    /**
     * 
     * @returns {IVectorView<StorageProviderSyncRootInfo>} 
     */
    GetCurrentSyncRoots() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(StorageProviderSyncRootInfo, result_)
    }
}
