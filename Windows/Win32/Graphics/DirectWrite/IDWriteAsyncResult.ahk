#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents the result of an asynchronous operation. A client can use the interface to wait for the operation to complete and to get the result.
 * @remarks
 * 
  * IDWriteAsyncResult is returned by <a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwriteremotefontfilestream-begindownload">IDWriteRemoteFontFileStream::BeginDownload</a> for signaling completion of a font download operation.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/nn-dwrite_3-idwriteasyncresult
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class IDWriteAsyncResult extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDWriteAsyncResult
     * @type {Guid}
     */
    static IID => Guid("{ce25f8fd-863b-4d13-9651-c1f88dc73fe2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetWaitHandle", "GetResult"]

    /**
     * 
     * @returns {HANDLE} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwriteasyncresult-getwaithandle
     */
    GetWaitHandle() {
        result := ComCall(3, this, "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwriteasyncresult-getresult
     */
    GetResult() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
