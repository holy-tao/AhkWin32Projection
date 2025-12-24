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
     * Starts a write request on the channel.
     * @param {Integer} cbSize The size, in bytes, of the buffer to which to write.
     * @param {Pointer<Integer>} pBuffer A pointer to a buffer on the channel to which to write the data. You can reuse this buffer as soon as the call returns.
     * @param {IUnknown} pReserved Reserved for future use. The value must be <b>NULL</b>.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful.
     * @see https://docs.microsoft.com/windows/win32/api//tsvirtualchannels/nf-tsvirtualchannels-iwtsvirtualchannel-write
     */
    Write(cbSize, pBuffer, pReserved) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", cbSize, pBufferMarshal, pBuffer, "ptr", pReserved, "HRESULT")
        return result
    }

    /**
     * Closes the channel.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful.
     * @see https://docs.microsoft.com/windows/win32/api//tsvirtualchannels/nf-tsvirtualchannels-iwtsvirtualchannel-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
