#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Controls how a network byte stream transfers data to a local cache.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfbytestreamcachecontrol
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFByteStreamCacheControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFByteStreamCacheControl
     * @type {Guid}
     */
    static IID => Guid("{f5042ea4-7a96-4a75-aa7b-2be1ef7f88d5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StopBackgroundTransfer"]

    /**
     * Stops the background transfer of data to the local cache.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfbytestreamcachecontrol-stopbackgroundtransfer
     */
    StopBackgroundTransfer() {
        result := ComCall(3, this, "HRESULT")
        return result
    }
}
