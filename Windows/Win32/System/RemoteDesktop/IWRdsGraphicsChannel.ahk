#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * This interface is used by the RemoteFX graphics services to send and receive data to a virtual graphics channel.
 * @see https://docs.microsoft.com/windows/win32/api//wrdsgraphicschannels/nn-wrdsgraphicschannels-iwrdsgraphicschannel
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWRdsGraphicsChannel extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWRdsGraphicsChannel
     * @type {Guid}
     */
    static IID => Guid("{684b7a0b-edff-43ad-d5a2-4a8d5388f401}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Write", "Close", "Open"]

    /**
     * 
     * @param {Integer} cbSize 
     * @param {Pointer<Integer>} pBuffer 
     * @param {IUnknown} pContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannel-write
     */
    Write(cbSize, pBuffer, pContext) {
        result := ComCall(3, this, "uint", cbSize, "char*", pBuffer, "ptr", pContext, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannel-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWRdsGraphicsChannelEvents} pChannelEvents 
     * @param {IUnknown} pOpenContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wrdsgraphicschannels/nf-wrdsgraphicschannels-iwrdsgraphicschannel-open
     */
    Open(pChannelEvents, pOpenContext) {
        result := ComCall(5, this, "ptr", pChannelEvents, "ptr", pOpenContext, "HRESULT")
        return result
    }
}
