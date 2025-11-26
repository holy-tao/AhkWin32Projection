#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The INSSBuffer interface is the basic interface of a buffer object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsbuffer/nn-wmsbuffer-inssbuffer
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class INSSBuffer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INSSBuffer
     * @type {Guid}
     */
    static IID => Guid("{e1cd3524-03d7-11d2-9eed-006097d2d7cf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLength", "SetLength", "GetMaxLength", "GetBuffer", "GetBufferAndLength"]

    /**
     * The GetLength method retrieves the size of the used portion of the buffer controlled by the buffer object.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the length of the buffer, in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//wmsbuffer/nf-wmsbuffer-inssbuffer-getlength
     */
    GetLength() {
        result := ComCall(3, this, "uint*", &pdwLength := 0, "HRESULT")
        return pdwLength
    }

    /**
     * The SetLength method specifies the size of the used portion of the buffer.
     * @param {Integer} dwLength <b>DWORD</b> containing the size of the used portion, in bytes.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
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
     * <i>dwLength</i> is greater than the buffer size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsbuffer/nf-wmsbuffer-inssbuffer-setlength
     */
    SetLength(dwLength) {
        result := ComCall(4, this, "uint", dwLength, "HRESULT")
        return result
    }

    /**
     * The GetMaxLength method retrieves the maximum size to which a buffer can be set.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the maximum length, in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//wmsbuffer/nf-wmsbuffer-inssbuffer-getmaxlength
     */
    GetMaxLength() {
        result := ComCall(5, this, "uint*", &pdwLength := 0, "HRESULT")
        return pdwLength
    }

    /**
     * The GetBuffer method retrieves the location of the buffer controlled by the buffer object.
     * @returns {Pointer<Integer>} Pointer to a pointer to the buffer.
     * @see https://docs.microsoft.com/windows/win32/api//wmsbuffer/nf-wmsbuffer-inssbuffer-getbuffer
     */
    GetBuffer() {
        result := ComCall(6, this, "ptr*", &ppdwBuffer := 0, "HRESULT")
        return ppdwBuffer
    }

    /**
     * The GetBufferAndLength method retrieves the location and size of the used portion of the buffer controlled by the buffer object.
     * @param {Pointer<Pointer<Integer>>} ppdwBuffer Pointer to a pointer to the buffer.
     * @param {Pointer<Integer>} pdwLength Pointer to a <b>DWORD</b> containing the length of the buffer, in bytes.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>ppdwBuffer</i> or <i>pdwLength</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsbuffer/nf-wmsbuffer-inssbuffer-getbufferandlength
     */
    GetBufferAndLength(ppdwBuffer, pdwLength) {
        ppdwBufferMarshal := ppdwBuffer is VarRef ? "ptr*" : "ptr"
        pdwLengthMarshal := pdwLength is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, ppdwBufferMarshal, ppdwBuffer, pdwLengthMarshal, pdwLength, "HRESULT")
        return result
    }
}
