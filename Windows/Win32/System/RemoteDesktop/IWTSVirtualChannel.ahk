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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Write", "Close"]

    /**
     * 
     * @param {Integer} cbSize 
     * @param {Pointer<Integer>} pBuffer 
     * @param {IUnknown} pReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nf-tsvirtualchannels-iwtsvirtualchannel-write
     */
    Write(cbSize, pBuffer, pReserved) {
        result := ComCall(3, this, "uint", cbSize, "char*", pBuffer, "ptr", pReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nf-tsvirtualchannels-iwtsvirtualchannel-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
