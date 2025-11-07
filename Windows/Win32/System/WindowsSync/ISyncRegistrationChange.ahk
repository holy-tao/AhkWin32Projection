#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents a change to the registration of a synchronization provider or a synchronization provider configuration UI. The changes are reported as registration events.
 * @see https://docs.microsoft.com/windows/win32/api//syncregistration/nn-syncregistration-isyncregistrationchange
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncRegistrationChange extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncRegistrationChange
     * @type {Guid}
     */
    static IID => Guid("{eea0d9ae-6b29-43b4-9e70-e3ae33bb2c3b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEvent", "GetInstanceId"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncregistrationchange-getevent
     */
    GetEvent() {
        result := ComCall(3, this, "int*", &psreEvent := 0, "HRESULT")
        return psreEvent
    }

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncregistrationchange-getinstanceid
     */
    GetInstanceId() {
        pguidInstanceId := Guid()
        result := ComCall(4, this, "ptr", pguidInstanceId, "HRESULT")
        return pguidInstanceId
    }
}
