#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The FaxGetPageData function returns to a fax client application the first page of data for a fax job.
 * @remarks
 * A fax client application can call the <b>FaxGetPageData</b> function for administrative purposes, to display a thumbnail sketch of the fax documents in the fax queue.
 * 
 * The fax service creates fax documents as TIFF Class F files based on the Tagged Image File Format (TIFF) 6.0 specification. The <b>FaxGetPageData</b> function returns a TIFF data stream that has a Modified Modified READ (MMR) two-dimensional encoding data compression format. The calling application must decode the data stream. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-image-format">Fax Image Format</a>.
 * 
 * The <b>FaxGetPageData</b> function allocates the memory required for the <i>Buffer</i> parameter. An application must call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nc-winfax-pfaxfreebuffer">FaxFreeBuffer</a> function to deallocate the resources associated with this parameter.
 * 
 * For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-displaying-documents-in-the-fax-job-queue">Displaying Documents in the Fax Job Queue</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-freeing-fax-resources">Freeing Fax Resources</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/winfax/nc-winfax-pfaxgetpagedata
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class PFAXGETPAGEDATA extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {HANDLE} FaxHandle 
     * @param {Integer} JobId 
     * @param {Pointer<Pointer<Integer>>} Buffer_ 
     * @param {Pointer<Integer>} BufferSize 
     * @param {Pointer<Integer>} ImageWidth 
     * @param {Pointer<Integer>} ImageHeight 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(FaxHandle, JobId, Buffer_, BufferSize, ImageWidth, ImageHeight) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle

        Buffer_Marshal := Buffer_ is VarRef ? "ptr*" : "ptr"
        BufferSizeMarshal := BufferSize is VarRef ? "uint*" : "ptr"
        ImageWidthMarshal := ImageWidth is VarRef ? "uint*" : "ptr"
        ImageHeightMarshal := ImageHeight is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", FaxHandle, "uint", JobId, Buffer_Marshal, Buffer_, BufferSizeMarshal, BufferSize, ImageWidthMarshal, ImageWidth, ImageHeightMarshal, ImageHeight, "int")
        return result
    }
}
