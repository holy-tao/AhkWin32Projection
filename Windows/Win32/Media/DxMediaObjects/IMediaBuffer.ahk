#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMediaBuffer interface provides methods for manipulating a data buffer. Buffers passed to the IMediaObject::ProcessInput and ProcessOutput methods must implement this interface.
 * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nn-mediaobj-imediabuffer
 * @namespace Windows.Win32.Media.DxMediaObjects
 * @version v4.0.30319
 */
class IMediaBuffer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaBuffer
     * @type {Guid}
     */
    static IID => Guid("{59eff8b9-938c-4a26-82f2-95cb84cdc837}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetLength", "GetMaxLength", "GetBufferAndLength"]

    /**
     * The SetLength method specifies the length of the data currently in the buffer.
     * @param {Integer} cbLength Size of the data, in bytes. The value must not exceed the buffer's maximum size. Call the <a href="https://docs.microsoft.com/windows/desktop/api/mediaobj/nf-mediaobj-imediabuffer-getmaxlength">IMediaBuffer::GetMaxLength</a> method to obtain the maximum size.
     * @returns {HRESULT} Returns S_OK if successful. Otherwise, returns an <b>HRESULT</b> value indicating the cause of the error.
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-imediabuffer-setlength
     */
    SetLength(cbLength) {
        result := ComCall(3, this, "uint", cbLength, "HRESULT")
        return result
    }

    /**
     * The GetMaxLength method retrieves the maximum number of bytes this buffer can hold.
     * @returns {Integer} Pointer to a variable that receives the buffer's maximum size, in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-imediabuffer-getmaxlength
     */
    GetMaxLength() {
        result := ComCall(4, this, "uint*", &pcbMaxLength := 0, "HRESULT")
        return pcbMaxLength
    }

    /**
     * The GetBufferAndLength method retrieves the buffer and the size of the valid data in the buffer.
     * @param {Pointer<Pointer<Integer>>} ppBuffer Address of a pointer that receives the buffer array. Can be <b>NULL</b> if <i>pcbLength</i> is not <b>NULL</b>.
     * @param {Pointer<Integer>} pcbLength Pointer to a variable that receives the size of the valid data, in bytes. Can be <b>NULL</b> if <i>ppBuffer</i> is not <b>NULL</b>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those in the following table.
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
     * <b>NULL</b> pointer argument
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nf-mediaobj-imediabuffer-getbufferandlength
     */
    GetBufferAndLength(ppBuffer, pcbLength) {
        ppBufferMarshal := ppBuffer is VarRef ? "ptr*" : "ptr"
        pcbLengthMarshal := pcbLength is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, ppBufferMarshal, ppBuffer, pcbLengthMarshal, pcbLength, "HRESULT")
        return result
    }
}
