#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IStream.ahk

/**
 * Use this interface to combine several data streams into a single stream by alternately interspersing portions of each.
 * @remarks
 * 
 * To create the <b>MsftStreamInterleave</b> object in a script, use IMAPI2.MsftStreamInterleave as the program identifier when calling <b>CreateObject</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-istreaminterleave
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IStreamInterleave extends IStream{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamInterleave
     * @type {Guid}
     */
    static IID => Guid("{27354147-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize"]

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
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-istreaminterleave-initialize
     */
    Initialize(streams, interleaveSizes, streamCount) {
        interleaveSizesMarshal := interleaveSizes is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "ptr*", streams, interleaveSizesMarshal, interleaveSizes, "uint", streamCount, "HRESULT")
        return result
    }
}
