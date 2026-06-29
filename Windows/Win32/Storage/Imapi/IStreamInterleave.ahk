#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Use this interface to combine several data streams into a single stream by alternately interspersing portions of each.
 * @remarks
 * To create the <b>MsftStreamInterleave</b> object in a script, use IMAPI2.MsftStreamInterleave as the program identifier when calling <b>CreateObject</b>.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/nn-imapi2-istreaminterleave
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IStreamInterleave extends IStream {
    /**
     * The interface identifier for IStreamInterleave
     * @type {Guid}
     */
    static IID := Guid("{27354147-7f64-5b0f-8f00-5d77afbe261e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IStreamInterleave interfaces
    */
    struct Vtbl extends IStream.Vtbl {
        Initialize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IStreamInterleave.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initialize this interleaved stream from an array of input streams and interleave sizes.
     * @param {Pointer<IStream>} streams Array of  <b>IStream</b> interfaces of the streams to add to this stream.
     * @param {Pointer<Integer>} interleaveSizes Array of interleave sizes, in bytes, with one entry per stream. The interleave size array is the number of contiguous bytes of a given stream to write on the disc before writing starts for the next stream.
     * @param {Integer} streamCount Number of streams in <i>streams</i>.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer is not valid.
     * 
     * Value: 0x80004003
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failed to allocate the required memory.
     * 
     * Value: 0x8007000E
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more arguments are not valid.
     * 
     * Value: 0x80070057
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-istreaminterleave-initialize
     */
    Initialize(streams, interleaveSizes, streamCount) {
        interleaveSizesMarshal := interleaveSizes is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, IStream.Ptr, streams, interleaveSizesMarshal, interleaveSizes, "uint", streamCount, "HRESULT")
        return result
    }

    Query(iid) {
        if (IStreamInterleave.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
    }
}
