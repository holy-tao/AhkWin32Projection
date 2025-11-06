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
     * 
     * @param {Pointer<Guid>} pguidInstanceId 
     * @param {Pointer<Guid>} pguidContentType 
     * @param {IPropertyStore} pContextPropertyStore 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-iregisteredsyncprovider-init
     */
    Init(pguidInstanceId, pguidContentType, pContextPropertyStore) {
        result := ComCall(3, this, "ptr", pguidInstanceId, "ptr", pguidContentType, "ptr", pContextPropertyStore, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-iregisteredsyncprovider-getinstanceid
     */
    GetInstanceId() {
        pguidInstanceId := Guid()
        result := ComCall(4, this, "ptr", pguidInstanceId, "HRESULT")
        return pguidInstanceId
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-iregisteredsyncprovider-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
