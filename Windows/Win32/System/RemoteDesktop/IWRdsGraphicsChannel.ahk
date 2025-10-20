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
     * 
     * @param {Integer} cbSize 
     * @param {Pointer<Byte>} pBuffer 
     * @param {Pointer<IUnknown>} pContext 
     * @returns {HRESULT} 
     */
    Write(cbSize, pBuffer, pContext) {
        result := ComCall(3, this, "uint", cbSize, "char*", pBuffer, "ptr", pContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWRdsGraphicsChannelEvents>} pChannelEvents 
     * @param {Pointer<IUnknown>} pOpenContext 
     * @returns {HRESULT} 
     */
    Open(pChannelEvents, pOpenContext) {
        result := ComCall(5, this, "ptr", pChannelEvents, "ptr", pOpenContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
