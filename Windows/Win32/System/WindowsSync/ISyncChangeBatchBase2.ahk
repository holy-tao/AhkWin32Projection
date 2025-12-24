#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncChangeBatchBase.ahk

/**
 * Represents additional capabilities of an ISyncChangeBatchBase object.
 * @remarks
 * 
 * An <b>ISyncChangeBatchBase2</b> object can be obtained by passing <b>IID_ISyncChangeBatchBase2</b> to the <b>QueryInterface</b> method of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-isyncchangebatchbase">ISyncChangeBatchBase</a> object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isyncchangebatchbase2
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncChangeBatchBase2 extends ISyncChangeBatchBase{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncChangeBatchBase2
     * @type {Guid}
     */
    static IID => Guid("{6fdb596a-d755-4584-bd0c-c0c23a548fbf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SerializeWithOptions"]

    /**
     * Serializes the change batch object data to a byte array, based on the specified version and serialization options.
     * @param {Integer} targetFormatVersion The serialized change batch is compatible with this version.
     * @param {Integer} dwFlags Reserved. Must be zero.
     * @param {Pointer<Integer>} pbBuffer The serialized change batch object data is serialized to this buffer.
     * @param {Pointer<Integer>} pdwSerializedSize The number of bytes in <i>pbBuffer</i>. Returns either the number of bytes that are required to serialize the change batch data when <i>pbBuffer</i> is too small, or the number of bytes written.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
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
     * <i>dwFlags</i> is not zero, or the version that is specified by <i>targetFormatVersion</i> is incompatible with the change batch object data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_MORE_DATA)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pBuffer</i> is too small. In this situation, the required number of bytes is returned in <i>pdwSerializedSize</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The change batch contains a group that was started but not ended.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SYNC_E_INVALID_VERSION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of <i>targetFormatVersion</i> is higher than the version of the object, or the object contains elements that are not compatible with <i>targetFormatVersion</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsync/nf-winsync-isyncchangebatchbase2-serializewithoptions
     */
    SerializeWithOptions(targetFormatVersion, dwFlags, pbBuffer, pdwSerializedSize) {
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"
        pdwSerializedSizeMarshal := pdwSerializedSize is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, "int", targetFormatVersion, "uint", dwFlags, pbBufferMarshal, pbBuffer, pdwSerializedSizeMarshal, pdwSerializedSize, "HRESULT")
        return result
    }
}
