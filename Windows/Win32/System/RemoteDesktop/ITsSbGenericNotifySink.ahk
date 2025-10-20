#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that reports completion to and gets wait time from the Remote Desktop Connection Broker (RD Connection Broker).
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbgenericnotifysink
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbGenericNotifySink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITsSbGenericNotifySink
     * @type {Guid}
     */
    static IID => Guid("{4c4c8c4f-300b-46ad-9164-8468a7e7568c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnCompleted", "GetWaitTimeout"]

    /**
     * 
     * @param {HRESULT} Status 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbgenericnotifysink-oncompleted
     */
    OnCompleted(Status) {
        result := ComCall(3, this, "int", Status, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pftTimeout 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbgenericnotifysink-getwaittimeout
     */
    GetWaitTimeout(pftTimeout) {
        result := ComCall(4, this, "ptr", pftTimeout, "HRESULT")
        return result
    }
}
