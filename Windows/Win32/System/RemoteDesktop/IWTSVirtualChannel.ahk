#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Used to control the channel state, and writes on the channel.
 * @see https://docs.microsoft.com/windows/win32/api//tsvirtualchannels/nn-tsvirtualchannels-iwtsvirtualchannel
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWTSVirtualChannel extends IUnknown{
    /**
     * The interface identifier for IWTSVirtualChannel
     * @type {Guid}
     */
    static IID => Guid("{a1230207-d6a7-11d8-b9fd-000bdbd1f198}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} cbSize 
     * @param {Pointer<Byte>} pBuffer 
     * @param {Pointer<IUnknown>} pReserved 
     * @returns {HRESULT} 
     */
    Write(cbSize, pBuffer, pReserved) {
        result := ComCall(3, this, "uint", cbSize, "char*", pBuffer, "ptr", pReserved, "int")
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
}
