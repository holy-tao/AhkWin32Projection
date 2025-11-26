#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\FILETIME.ahk
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
     * Reports completion to Remote Desktop Connection Broker (RD Connection Broker).
     * @param {HRESULT} Status The status to report.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbgenericnotifysink-oncompleted
     */
    OnCompleted(Status) {
        result := ComCall(3, this, "int", Status, "HRESULT")
        return result
    }

    /**
     * Retrieves the wait timeout.
     * @returns {FILETIME} 
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbgenericnotifysink-getwaittimeout
     */
    GetWaitTimeout() {
        pftTimeout := FILETIME()
        result := ComCall(4, this, "ptr", pftTimeout, "HRESULT")
        return pftTimeout
    }
}
