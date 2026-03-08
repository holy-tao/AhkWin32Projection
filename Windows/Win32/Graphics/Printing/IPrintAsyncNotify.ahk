#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrintAsyncNotifyChannel.ahk
#Include .\IPrintAsyncNotifyRegistration.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates and manages a communication channel used by applications and components that are hosted by the print spooler.
 * @remarks
 * For an application to receive notifications from a Print Spooler-hosted component, it must provide an <b>IPrintAsyncNotifyCallback</b> object when it registers for notifications.
 * 
 * A Print Spooler-hosted component that opens a bidirectional communication channel with a listening application must provide an <b>IPrintAsyncNotifyCallback</b> object.
 * @see https://learn.microsoft.com/windows/win32/api/prnasnot/nn-prnasnot-iprintasyncnotifycallback
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintAsyncNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintAsyncNotify
     * @type {Guid}
     */
    static IID => Guid("{532818f7-921b-4fb2-bff8-2f4fd52ebebf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePrintAsyncNotifyChannel", "CreatePrintAsyncNotifyRegistration"]

    /**
     * Creates a communication channel between a Print Spooler-hosted printing component, such as a print driver or port monitor, and an application that receives notifications from the component.
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * A component can open a channel only if it runs in the Print Spooler's process. For example, if an application loads a printer driver, the driver cannot open a channel, but a printer driver loaded inside the Print Spooler can open a channel. Listening applications can either be inside or outside the Print Spooler's process.
     * 
     * To close a channel, call <a href="https://docs.microsoft.com/windows/desktop/api/prnasnot/nf-prnasnot-iprintasyncnotifychannel-closechannel">IPrintAsyncNotifyChannel::CloseChannel</a>; however, <b>IPrintAsyncNotifyChannel::CloseChannel</b> cannot be called immediately after the call to <b>CreatePrintAsyncNotifyChannel</b>.
     * 
     * Call IPrintAsyncNotifyChannel::Release() only:
     * 
     * <ol>
     * <li>if it is an explicit match to an earlier IPrintAsyncNotifyChannel::AddRef() call.</li>
     * <li>if the channel is a UniDirectional channel and you are abandoning the pointer received in a successful call to CreatePrintAsyncNotifyChannel.</li>
     * <li>if, after you created a BiDirectional channel or in the implementation of IPrintNotifyAsyncCallback::OnEventNotify and:<ol>
     * <li>you did not call IPrintAsyncNotifyChannel::SendNotification or IPrintAsyncNotifyChannel::CloseChannel OR</li>
     * <li>you did not retry a call to IPrintAsyncNotifyChannel::SendNotification or IPrintAsyncNotifyChannel::CloseChannel that failed OR</li>
     * <li>on the server side, you didn't retry a call to IPrintAsyncNotifyChannel::SendNotification that succeeded with the return value NO_LISTENER OR</li>
     * <li>on the client side, you didn't retry a call to IPrintAsyncNotifyChannel::SendNotification that succeeded with return value CHANNEL_ACQUIRED.</li>
     * </ol>
     * </li>
     * </ol>
     * @param {Integer} param0 
     * @param {Pointer<Guid>} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {IPrintAsyncNotifyCallback} param4 
     * @returns {IPrintAsyncNotifyChannel} 
     * @see https://learn.microsoft.com/windows/win32/api/prnasnot/nf-prnasnot-createprintasyncnotifychannel
     */
    CreatePrintAsyncNotifyChannel(param0, param1, param2, param3, param4) {
        result := ComCall(3, this, "uint", param0, "ptr", param1, "int", param2, "int", param3, "ptr", param4, "ptr*", &param5 := 0, "HRESULT")
        return IPrintAsyncNotifyChannel(param5)
    }

    /**
     * 
     * @param {Pointer<Guid>} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {IPrintAsyncNotifyCallback} param3 
     * @returns {IPrintAsyncNotifyRegistration} 
     */
    CreatePrintAsyncNotifyRegistration(param0, param1, param2, param3) {
        result := ComCall(4, this, "ptr", param0, "int", param1, "int", param2, "ptr", param3, "ptr*", &param4 := 0, "HRESULT")
        return IPrintAsyncNotifyRegistration(param4)
    }
}
