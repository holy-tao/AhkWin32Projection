#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11EXT_SET_PROFILE_CUSTOM_USER_DATA extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {HANDLE} hDot11SvcHandle 
     * @param {HANDLE} hConnectSession 
     * @param {Integer} dwSessionID 
     * @param {Integer} dwDataSize 
     * @param {Pointer} pvData 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hDot11SvcHandle, hConnectSession, dwSessionID, dwDataSize, pvData) {
        hDot11SvcHandle := hDot11SvcHandle is Win32Handle ? NumGet(hDot11SvcHandle, "ptr") : hDot11SvcHandle
        hConnectSession := hConnectSession is Win32Handle ? NumGet(hConnectSession, "ptr") : hConnectSession

        result := ComCall(3, this, "ptr", hDot11SvcHandle, "ptr", hConnectSession, "uint", dwSessionID, "uint", dwDataSize, "ptr", pvData, "uint")
        return result
    }
}
