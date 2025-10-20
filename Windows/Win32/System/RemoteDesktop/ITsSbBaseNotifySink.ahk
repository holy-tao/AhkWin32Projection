#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that report status and error messages to Remote Desktop Connection Broker (RD Connection Broker).
 * @remarks
 * 
  * Plug-ins can use this interface to report status and error messages to RD Connection Broker.
  * 
  * The RD Connection Broker server and the Remote Desktop Session Host (RD Session Host) server (the redirector) must 
  *     be running Windows Server 2008 R2, and clients must use RDC 7.0.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbbasenotifysink
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbBaseNotifySink extends IUnknown{
    /**
     * The interface identifier for ITsSbBaseNotifySink
     * @type {Guid}
     */
    static IID => Guid("{808a6537-1282-4989-9e09-f43938b71722}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {HRESULT} hrError 
     * @returns {HRESULT} 
     */
    OnError(hrError) {
        result := ComCall(3, this, "int", hrError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} messageType 
     * @param {Integer} messageID 
     * @returns {HRESULT} 
     */
    OnReportStatus(messageType, messageID) {
        result := ComCall(4, this, "int", messageType, "uint", messageID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
