#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * The IFillLockBytes interface enables downloading code to write data asynchronously to a structured storage byte array.
 * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nn-objidl-ifilllockbytes
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class IFillLockBytes extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFillLockBytes
     * @type {Guid}
     */
    static IID => Guid("{99caf010-415e-11cf-8814-00aa00b569f5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FillAppend", "FillAt", "SetFillSize", "Terminate"]

    /**
     * The FillAppend method writes a new block of bytes to the end of a byte array.
     * @remarks
     * The 
     * <b>FillAppend</b> method is used for sequential downloading, where bytes are written to the end of the byte array in the order in which they are received. This method obtains the current size of the byte array (for example, lockbytes object) and writes a new block of data to the end of the array. As each block of data becomes available, the downloader calls this method to write it to the byte array. Subsequent calls by the compound file implementation to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ilockbytes-readat">ILockBytes::ReadAt</a> return any available data or return E_PENDING if data is currently unavailable.
     * @param {Pointer} pv Pointer to the data to be appended to the end of an existing byte array. This operation does not create a danger of a memory leak or a buffer overrun.
     * @param {Integer} cb Size of <i>pv</i> in bytes.
     * @returns {Integer} Number of bytes that were successfully written.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-ifilllockbytes-fillappend
     */
    FillAppend(pv, cb) {
        result := ComCall(3, this, "ptr", pv, "uint", cb, "uint*", &pcbWritten := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcbWritten
    }

    /**
     * The FillAt method writes a new block of data to a specified location in the byte array.
     * @remarks
     * The 
     * <b>FillAt</b> method is used for nonsequential downloading (for example, HTTP byte range requests). In nonsequential downloading the caller specifies ranges in the byte array where various blocks of data are to be written. Subsequent calls by the compound file implementation to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ilockbytes-readat">ILockBytes::ReadAt</a> are passed by the byte array wrapper object's own implementation of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a> to the underlying byte array. This method is not currently implemented and will return E_NOTIMPL.
     * 
     * <div class="alert"><b>Note</b>  The system-supplied 
     * <a href="https://docs.microsoft.com/windows/desktop/Stg/ifilllockbytes-implementation">IFillLockBytes</a> implementation does not support 
     * <b>FillAt</b> and returns E_NOTIMPL.</div>
     * <div> </div>
     * @param {Integer} ulOffset The offset, expressed in number of bytes, from the first element of the byte array.
     * @param {Pointer} pv Pointer to the data to be written at the location specified by <i>uIOffset</i>.
     * @param {Integer} cb Size of <i>pv</i> in bytes.
     * @returns {Integer} Number of bytes that were successfully written.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-ifilllockbytes-fillat
     */
    FillAt(ulOffset, pv, cb) {
        result := ComCall(4, this, "uint", ulOffset, "ptr", pv, "uint", cb, "uint*", &pcbWritten := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcbWritten
    }

    /**
     * The SetFillSize method sets the expected size of the byte array.
     * @remarks
     * If 
     * <b>SetFillSize</b> has not been called, any call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ilockbytes-readat">ILockBytes::ReadAt</a> that attempts to access data that has not yet been written using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ifilllockbytes-fillappend">IFillLockBytes::FillAppend</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ifilllockbytes-fillat">IFillLockBytes::FillAt</a> will return a new error message, E_PENDING. After 
     * <b>SetFillSize</b> has been called, any call to 
     * <b>ReadAt</b> that attempts to access data beyond the current size, as set by 
     * <b>SetFillSize</b>, returns E_FAIL instead of E_PENDING.
     * @param {Integer} ulSize Size in bytes of the byte array object that is to be filled in subsequent calls to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ifilllockbytes-fillappend">IFillLockBytes::FillAppend</a>.
     * @returns {HRESULT} This function supports the standard return values E_OUTOFMEMORY, E_UNEXPECTED, E_INVALIDARG, and E_FAIL.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-ifilllockbytes-setfillsize
     */
    SetFillSize(ulSize) {
        result := ComCall(5, this, "uint", ulSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Terminate method informs the byte array that the download has been terminated, either successfully or unsuccessfully.
     * @remarks
     * After this method has been called, the byte array will no longer return E_PENDING.
     * @param {BOOL} bCanceled Download is complete. If <b>TRUE</b>, the download was terminated unsuccessfully. If <b>FALSE</b>, the download terminated successfully.
     * @returns {HRESULT} This function supports the standard return values E_OUTOFMEMORY, E_UNEXPECTED, E_INVALIDARG, and E_FAIL.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-ifilllockbytes-terminate
     */
    Terminate(bCanceled) {
        result := ComCall(6, this, "int", bCanceled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
