#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * The IFillLockBytes interface enables downloading code to write data asynchronously to a structured storage byte array.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-ifilllockbytes
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
     * @param {Pointer} pv Pointer to the data to be appended to the end of an existing byte array. This operation does not create a danger of a memory leak or a buffer overrun.
     * @param {Integer} cb Size of <i>pv</i> in bytes.
     * @returns {Integer} Number of bytes that were successfully written.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ifilllockbytes-fillappend
     */
    FillAppend(pv, cb) {
        result := ComCall(3, this, "ptr", pv, "uint", cb, "uint*", &pcbWritten := 0, "HRESULT")
        return pcbWritten
    }

    /**
     * The FillAt method writes a new block of data to a specified location in the byte array.
     * @param {Integer} ulOffset The offset, expressed in number of bytes, from the first element of the byte array.
     * @param {Pointer} pv Pointer to the data to be written at the location specified by <i>uIOffset</i>.
     * @param {Integer} cb Size of <i>pv</i> in bytes.
     * @returns {Integer} Number of bytes that were successfully written.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ifilllockbytes-fillat
     */
    FillAt(ulOffset, pv, cb) {
        result := ComCall(4, this, "uint", ulOffset, "ptr", pv, "uint", cb, "uint*", &pcbWritten := 0, "HRESULT")
        return pcbWritten
    }

    /**
     * The SetFillSize method sets the expected size of the byte array.
     * @param {Integer} ulSize Size in bytes of the byte array object that is to be filled in subsequent calls to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ifilllockbytes-fillappend">IFillLockBytes::FillAppend</a>.
     * @returns {HRESULT} This function supports the standard return values E_OUTOFMEMORY, E_UNEXPECTED, E_INVALIDARG, and E_FAIL.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ifilllockbytes-setfillsize
     */
    SetFillSize(ulSize) {
        result := ComCall(5, this, "uint", ulSize, "HRESULT")
        return result
    }

    /**
     * The Terminate method informs the byte array that the download has been terminated, either successfully or unsuccessfully.
     * @param {BOOL} bCanceled Download is complete. If <b>TRUE</b>, the download was terminated unsuccessfully. If <b>FALSE</b>, the download terminated successfully.
     * @returns {HRESULT} This function supports the standard return values E_OUTOFMEMORY, E_UNEXPECTED, E_INVALIDARG, and E_FAIL.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ifilllockbytes-terminate
     */
    Terminate(bCanceled) {
        result := ComCall(6, this, "int", bCanceled, "HRESULT")
        return result
    }
}
