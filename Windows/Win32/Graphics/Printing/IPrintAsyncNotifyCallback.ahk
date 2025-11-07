#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates and manages a communication channel used by applications and components that are hosted by the print spooler.
 * @remarks
 * 
 * For an application to receive notifications from a Print Spooler-hosted component, it must provide an <b>IPrintAsyncNotifyCallback</b> object when it registers for notifications.
 * 
 * A Print Spooler-hosted component that opens a bidirectional communication channel with a listening application must provide an <b>IPrintAsyncNotifyCallback</b> object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//prnasnot/nn-prnasnot-iprintasyncnotifycallback
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintAsyncNotifyCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintAsyncNotifyCallback
     * @type {Guid}
     */
    static IID => Guid("{7def34c1-9d92-4c99-b3b3-db94a9d4191b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnEventNotify", "ChannelClosed"]

    /**
     * 
     * @param {IPrintAsyncNotifyChannel} pChannel 
     * @param {IPrintAsyncNotifyDataObject} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/prnasnot/nf-prnasnot-iprintasyncnotifycallback-oneventnotify
     */
    OnEventNotify(pChannel, pData) {
        result := ComCall(3, this, "ptr", pChannel, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPrintAsyncNotifyChannel} pChannel 
     * @param {IPrintAsyncNotifyDataObject} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/prnasnot/nf-prnasnot-iprintasyncnotifycallback-channelclosed
     */
    ChannelClosed(pChannel, pData) {
        result := ComCall(4, this, "ptr", pChannel, "ptr", pData, "HRESULT")
        return result
    }
}
