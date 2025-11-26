#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents a registered synchronization provider. This interface is implemented by the writer of a synchronization provider.
 * @remarks
 * 
 * If the registered synchronization provider is a <a href="https://www.microsoft.com/downloads/details.aspx?familyid=A3EE7BC5-A823-4FB4-B152-9E8CE9D5546F&displaylang=en">Microsoft Sync Framework</a> provider, then the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nf-syncregistration-iregisteredsyncprovider-init">Init</a>method will be called by the Sync Framework synchronization session. For more information about the different types of synchronization providers you can write for Windows, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/winsync/options-for-building-a-synchronization-provider">Options for Building a Synchronization Provider</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//syncregistration/nn-syncregistration-iregisteredsyncprovider
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IRegisteredSyncProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRegisteredSyncProvider
     * @type {Guid}
     */
    static IID => Guid("{913bcf76-47c1-40b5-a896-5e8a9c414c14}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Init", "GetInstanceId", "Reset"]

    /**
     * Initializes the synchronization provider before it is ready for a synchronization session.
     * @param {Pointer<Guid>} pguidInstanceId The instance ID of the synchronization provider.
     * @param {Pointer<Guid>} pguidContentType A GUID that represents the content type that this provider will synchronize.
     * @param {IPropertyStore} pContextPropertyStore The properties needed to initialize the synchronization provider. These properties are also provided when the synchronization provider is registered.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//syncregistration/nf-syncregistration-iregisteredsyncprovider-init
     */
    Init(pguidInstanceId, pguidContentType, pContextPropertyStore) {
        result := ComCall(3, this, "ptr", pguidInstanceId, "ptr", pguidContentType, "ptr", pContextPropertyStore, "HRESULT")
        return result
    }

    /**
     * Returns the synchronization provider's instance ID.
     * @returns {Guid} The instance ID of the synchronization provider.
     * @see https://docs.microsoft.com/windows/win32/api//syncregistration/nf-syncregistration-iregisteredsyncprovider-getinstanceid
     */
    GetInstanceId() {
        pguidInstanceId := Guid()
        result := ComCall(4, this, "ptr", pguidInstanceId, "HRESULT")
        return pguidInstanceId
    }

    /**
     * Resets a synchronization provider so that it looks like a new replica in the next synchronization session.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//syncregistration/nf-syncregistration-iregisteredsyncprovider-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
