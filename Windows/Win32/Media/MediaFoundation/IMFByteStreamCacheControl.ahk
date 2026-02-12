#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Controls how a network byte stream transfers data to a local cache. (IMFByteStreamCacheControl)
 * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nn-mfidl-imfbytestreamcachecontrol
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
     * @remarks
     * The byte stream resumes transferring data to the cache if the application does one of the following:
     * 
     * <ul>
     * <li>Reads data from the byte stream.</li>
     * <li>Calls the byte stream's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfbytestreambuffering-enablebuffering">IMFByteStreamBuffering::EnableBuffering</a> method.</li>
     * </ul>
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfbytestreamcachecontrol-stopbackgroundtransfer
     */
    StopBackgroundTransfer() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
