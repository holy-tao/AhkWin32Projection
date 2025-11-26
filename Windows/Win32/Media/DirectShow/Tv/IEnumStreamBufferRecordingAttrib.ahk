#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IEnumStreamBufferRecordingAttrib.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IEnumStreamBufferRecordingAttrib interface enumerates a collection of attributes on a stream buffer file.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IEnumStreamBufferRecordingAttrib)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-ienumstreambufferrecordingattrib
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IEnumStreamBufferRecordingAttrib extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumStreamBufferRecordingAttrib
     * @type {Guid}
     */
    static IID => Guid("{c18a9162-1e82-4142-8c73-5690fa62fe33}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * The Next method returns a specified number of attributes in the enumeration sequence.
     * @param {Integer} cRequest The number of attributes to retrieve.
     * @param {Pointer<STREAMBUFFER_ATTRIBUTE>} pStreamBufferAttribute Pointer to an array of size <i>cRequest</i>. The array is filled with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/ns-sbe-streambuffer_attribute">STREAMBUFFER_ATTRIBUTE</a> structures.
     * @returns {Integer} Pointer to a variable that receives the number of attributes that are returned in the <i>pStreamBufferAttribute</i> array. This parameter can be <b>NULL</b> if <i>cRequest</i> is 1.
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-ienumstreambufferrecordingattrib-next
     */
    Next(cRequest, pStreamBufferAttribute) {
        result := ComCall(3, this, "uint", cRequest, "ptr", pStreamBufferAttribute, "uint*", &pcReceived := 0, "HRESULT")
        return pcReceived
    }

    /**
     * The Skip method skips over a specified number of attributes.
     * @param {Integer} cRecords The number of attributes to skip.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Skipped past the end of the sequence.
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
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-ienumstreambufferrecordingattrib-skip
     */
    Skip(cRecords) {
        result := ComCall(4, this, "uint", cRecords, "HRESULT")
        return result
    }

    /**
     * The Reset method resets the enumeration sequence to the beginning.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-ienumstreambufferrecordingattrib-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The Clone method makes a copy of the enumerator object. The returned object starts with the same enumeration state as the original.
     * @returns {IEnumStreamBufferRecordingAttrib} Address of a variable that receives a pointer to the <b>IEnumStreamBufferRecordingAttrib</b> interface of the new enumerator.
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-ienumstreambufferrecordingattrib-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppIEnumStreamBufferAttrib := 0, "HRESULT")
        return IEnumStreamBufferRecordingAttrib(ppIEnumStreamBufferAttrib)
    }
}
