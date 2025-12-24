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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnError", "OnReportStatus"]

    /**
     * Reports an error condition to Remote Desktop Connection Broker (RD Connection Broker).
     * @param {HRESULT} hrError The error condition.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbbasenotifysink-onerror
     */
    OnError(hrError) {
        result := ComCall(3, this, "int", hrError, "HRESULT")
        return result
    }

    /**
     * Sends status messages to the Remote Desktop Connection (RDC) client regarding the processing of a client connection.
     * @param {Integer} messageType 
     * @param {Integer} messageID 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbbasenotifysink-onreportstatus
     */
    OnReportStatus(messageType, messageID) {
        result := ComCall(4, this, "int", messageType, "uint", messageID, "HRESULT")
        return result
    }
}
