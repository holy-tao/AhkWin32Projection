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
     * 
     * @param {HRESULT} Status 
     * @returns {HRESULT} 
     */
    OnCompleted(Status) {
        result := ComCall(3, this, "int", Status, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pftTimeout 
     * @returns {HRESULT} 
     */
    GetWaitTimeout(pftTimeout) {
        result := ComCall(4, this, "ptr", pftTimeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
