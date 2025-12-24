#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IStream.ahk

/**
 * Use this interface to combine several data streams into a single stream.
 * @remarks
 * 
 * To create the  MsftStreamConcatenate object in a script, use IMAPI2.MsftStreamConcatenate as the program identifier when calling CreateObject.
 * 
 * When using this interface, the following  scenarios will result in undefined behaviors, and should be avoided:
 * 
 * <ul>
 * <li>Each partial stream composing the MsftStreamConcatenate object is actually the same stream.</li>
 * <li>Any of the concatenated streams are modified (read from, written to, or seeked on) outside of IMAPI.</li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-istreamconcatenate
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IStreamConcatenate extends IStream{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamConcatenate
     * @type {Guid}
     */
    static IID => Guid("{27354146-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Initialize2", "Append", "Append2"]

    /**
     * Initializes this stream from two input streams.
     * @param {IStream} stream1 An <b>IStream</b> interface of the first stream to add to this stream.
     * @param {IStream} stream2 An <b>IStream</b> interface of the second stream to add to this stream.
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
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-istreamconcatenate-initialize
     */
    Initialize(stream1, stream2) {
        result := ComCall(14, this, "ptr", stream1, "ptr", stream2, "HRESULT")
        return result
    }

    /**
     * Initializes this stream from an array of input streams.
     * @param {Pointer<IStream>} streams Array of  <b>IStream</b> interfaces of the streams to add to this stream.
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
     * This stream has already been initialized.
     * 
     * Value: 0x80070057
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-istreamconcatenate-initialize2
     */
    Initialize2(streams, streamCount) {
        result := ComCall(15, this, "ptr*", streams, "uint", streamCount, "HRESULT")
        return result
    }

    /**
     * Appends a stream to this stream.
     * @param {IStream} stream An <b>IStream</b> interface of the stream to append to this stream.
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
     * 
     * Value: 0x80004001
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-istreamconcatenate-append
     */
    Append(stream) {
        result := ComCall(16, this, "ptr", stream, "HRESULT")
        return result
    }

    /**
     * Appends an array of streams to this stream.
     * @param {Pointer<IStream>} streams Array of  <b>IStream</b> interfaces of the streams to append to this stream.
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
     * 
     * Value: 0x80004001
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-istreamconcatenate-append2
     */
    Append2(streams, streamCount) {
        result := ComCall(17, this, "ptr*", streams, "uint", streamCount, "HRESULT")
        return result
    }
}
