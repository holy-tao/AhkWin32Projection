#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * Is used on the server (receiving) side of a remote invocation.
 * @see https://docs.microsoft.com/windows/win32/api//callobj/nn-callobj-icallunmarshal
 * @namespace Windows.Win32.System.Com.CallObj
 * @version v4.0.30319
 */
class ICallUnmarshal extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICallUnmarshal
     * @type {Guid}
     */
    static IID => Guid("{5333b003-2e42-11d2-b89d-00c04fb9618a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Unmarshal", "ReleaseMarshalData"]

    /**
     * Turns a marshaled packet of data back into an activation record that can then be invoked or manipulated in some other way.
     * @param {Integer} iMethod The method number. If this parameter is -1, the method number will be determined from the data to be unmarshaled.
     * @param {Pointer<Void>} pBuffer A pointer to the buffer from which the activation record is to be created.
     * @param {Integer} cbBuffer The size of the buffer, in bytes.
     * @param {BOOL} fForceBufferCopy Indicates whether the buffer should be copied and retained (nonzero) or the buffer will remain valid (zero).
     * @param {Integer} dataRep The data representation with which the data was marshaled.
     * @param {Pointer<CALLFRAME_MARSHALCONTEXT>} pcontext A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/callobj/ns-callobj-callframe_marshalcontext">CALLFRAME_MARSHALCONTEXT</a> structure that contains information about the context in which unmarshaling is to be carried out.
     * @param {Pointer<Integer>} pcbUnmarshalled A pointer to the number of bytes that were successfully unmarshaled.
     * @param {Pointer<ICallFrame>} ppFrame A call frame bound to the umarshaled invocation.
     * @returns {HRESULT} This method can return the following values.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//callobj/nf-callobj-icallunmarshal-unmarshal
     */
    Unmarshal(iMethod, pBuffer, cbBuffer, fForceBufferCopy, dataRep, pcontext, pcbUnmarshalled, ppFrame) {
        pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"
        pcbUnmarshalledMarshal := pcbUnmarshalled is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", iMethod, pBufferMarshal, pBuffer, "uint", cbBuffer, "int", fForceBufferCopy, "uint", dataRep, "ptr", pcontext, pcbUnmarshalledMarshal, pcbUnmarshalled, "ptr*", ppFrame, "HRESULT")
        return result
    }

    /**
     * Releases resources that may be held by interface pointers residing in a packet of marshaled data. This method finds all interface pointers in the packet and calls the CoReleaseMarshalData function on each interface pointer.
     * @param {Integer} iMethod The method number.
     * @param {Pointer<Void>} pBuffer A pointer to the buffer containing the marshaled out parameters.
     * @param {Integer} cbBuffer The size of the buffer, in bytes.
     * @param {Integer} ibFirstRelease The first byte in the buffer to be released. A value of zero implies that the interface pointers in the whole buffer are to be released. The idea is that marshaled interface pointers prior to the indicated byte are assumed to have already been released by some other mechanism.
     * @param {Integer} dataRep The data representation with which the data was marshaled.
     * @param {Pointer<CALLFRAME_MARSHALCONTEXT>} pcontext A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/callobj/ns-callobj-callframe_marshalcontext">CALLFRAME_MARSHALCONTEXT</a> structure that contains information about the context in which unmarshaling is to be carried out.
     * @returns {HRESULT} This method can return the following values.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//callobj/nf-callobj-icallunmarshal-releasemarshaldata
     */
    ReleaseMarshalData(iMethod, pBuffer, cbBuffer, ibFirstRelease, dataRep, pcontext) {
        pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "uint", iMethod, pBufferMarshal, pBuffer, "uint", cbBuffer, "uint", ibFirstRelease, "uint", dataRep, "ptr", pcontext, "HRESULT")
        return result
    }
}
