#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a communication channel that components that are hosted by the print spooler use to send notifications to applications. If the channel is bidirectional, applications can use the same channel to send responses back to the component.
 * @remarks
 * 
  * Objects implementing this interface are created by the Print Spooler in response to a call of <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-createprintasyncnotifychannel">CreatePrintAsyncNotifyChannel</a> by a Print Spooler-hosted component.
  * 
  * Call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IPrintAsyncNotifyChannel::Release</a> only:
  * 
  * <ol>
  * <li>if it is an explicit match to an earlier <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IPrintAsyncNotifyChannel::AddRef</a> call.</li>
  * <li>if the channel is a UniDirectional channel and you are abandoning the pointer received in a successful call to <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-createprintasyncnotifychannel">CreatePrintAsyncNotifyChannel</a>.</li>
  * <li>if, after you created a BiDirectional channel or in the implementation of <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifycallback-oneventnotify">IPrintAsyncNotifyCallback::OnEventNotify</a> and:<ol>
  * <li>you did not call <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifychannel-sendnotification">IPrintAsyncNotifyChannel::SendNotification</a> or <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifychannel-closechannel">IPrintAsyncNotifyChannel::CloseChannel</a> OR</li>
  * <li>you did not retry a call to <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifychannel-sendnotification">IPrintAsyncNotifyChannel::SendNotification</a> or <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifychannel-closechannel">IPrintAsyncNotifyChannel::CloseChannel</a> that failed OR</li>
  * <li>on the server side, you did not retry a call to <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifychannel-sendnotification">IPrintAsyncNotifyChannel::SendNotification</a> that succeeded with the return value NO_LISTENER OR</li>
  * <li>on the client side, you did not retry a call to <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifychannel-sendnotification">IPrintAsyncNotifyChannel::SendNotification</a> that succeeded with return value CHANNEL_ACQUIRED.</li>
  * </ol>
  * </li>
  * </ol>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//prnasnot/nn-prnasnot-iprintasyncnotifychannel
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintAsyncNotifyChannel extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintAsyncNotifyChannel
     * @type {Guid}
     */
    static IID => Guid("{4a5031b1-1f3f-4db0-a462-4530ed8b0451}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SendNotification", "CloseChannel"]

    /**
     * 
     * @param {IPrintAsyncNotifyDataObject} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/prnasnot/nf-prnasnot-iprintasyncnotifychannel-sendnotification
     */
    SendNotification(pData) {
        result := ComCall(3, this, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPrintAsyncNotifyDataObject} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/prnasnot/nf-prnasnot-iprintasyncnotifychannel-closechannel
     */
    CloseChannel(pData) {
        result := ComCall(4, this, "ptr", pData, "HRESULT")
        return result
    }
}
