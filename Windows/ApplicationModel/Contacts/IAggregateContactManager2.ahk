#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class IAggregateContactManager2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAggregateContactManager2
     * @type {Guid}
     */
    static IID => Guid("{5e8cc2d8-a9cd-4430-9c4b-01348db2ca50}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetRemoteIdentificationInformationAsync"]

    /**
     * 
     * @param {HSTRING} contactListId 
     * @param {HSTRING} remoteSourceId 
     * @param {HSTRING} accountId 
     * @returns {IAsyncAction} 
     */
    SetRemoteIdentificationInformationAsync(contactListId, remoteSourceId, accountId) {
        if(contactListId is String) {
            pin := HSTRING.Create(contactListId)
            contactListId := pin.Value
        }
        contactListId := contactListId is Win32Handle ? NumGet(contactListId, "ptr") : contactListId
        if(remoteSourceId is String) {
            pin := HSTRING.Create(remoteSourceId)
            remoteSourceId := pin.Value
        }
        remoteSourceId := remoteSourceId is Win32Handle ? NumGet(remoteSourceId, "ptr") : remoteSourceId
        if(accountId is String) {
            pin := HSTRING.Create(accountId)
            accountId := pin.Value
        }
        accountId := accountId is Win32Handle ? NumGet(accountId, "ptr") : accountId

        result := ComCall(6, this, "ptr", contactListId, "ptr", remoteSourceId, "ptr", accountId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }
}
