#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncSessionState.ahk

/**
 * Represents additional information about the current synchronization session.
 * @remarks
 * 
  * An <b>ISyncSessionState2</b> object can be obtained by passing <b>IID_ISyncSessionState2</b> to the <b>QueryInterface</b> method of an <b>ISyncSessionState</b> object.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isyncsessionstate2
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncSessionState2 extends ISyncSessionState{
    /**
     * The interface identifier for ISyncSessionState2
     * @type {Guid}
     */
    static IID => Guid("{9e37cfa3-9e38-4c61-9ca3-ffe810b45ca2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * 
     * @param {BOOL} fSelf 
     * @returns {HRESULT} 
     */
    SetProviderWithError(fSelf) {
        result := ComCall(10, this, "int", fSelf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} phrSessionError 
     * @returns {HRESULT} 
     */
    GetSessionErrorStatus(phrSessionError) {
        result := ComCall(11, this, "ptr", phrSessionError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
