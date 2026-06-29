#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ICallFrame.ahk" { ICallFrame }
#Import ".\CALLFRAME_MARSHALCONTEXT.ahk" { CALLFRAME_MARSHALCONTEXT }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * Is used on the server (receiving) side of a remote invocation.
 * @see https://learn.microsoft.com/windows/win32/api/callobj/nn-callobj-icallunmarshal
 * @namespace Windows.Win32.System.Com.CallObj
 */
export default struct ICallUnmarshal extends IUnknown {
    /**
     * The interface identifier for ICallUnmarshal
     * @type {Guid}
     */
    static IID := Guid("{5333b003-2e42-11d2-b89d-00c04fb9618a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICallUnmarshal interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Unmarshal          : IntPtr
        ReleaseMarshalData : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICallUnmarshal.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallunmarshal-unmarshal
     */
    Unmarshal(iMethod, pBuffer, cbBuffer, fForceBufferCopy, dataRep, pcontext, pcbUnmarshalled, ppFrame) {
        pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"
        pcbUnmarshalledMarshal := pcbUnmarshalled is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", iMethod, pBufferMarshal, pBuffer, "uint", cbBuffer, BOOL, fForceBufferCopy, "uint", dataRep, CALLFRAME_MARSHALCONTEXT.Ptr, pcontext, pcbUnmarshalledMarshal, pcbUnmarshalled, ICallFrame.Ptr, ppFrame, "HRESULT")
        return result
    }

    /**
     * Releases resources that may be held by interface pointers residing in a packet of marshaled data. This method finds all interface pointers in the packet and calls the CoReleaseMarshalData function on each interface pointer.
     * @remarks
     * To clean up resources held in the marshaled buffer, the <b>ReleaseMarshalData</b> method must be called. However when the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-mshlflags">MSHLFLAGS</a> enumeration is set to normal, this is done automatically when unmarshaling.
     * 
     * <b>ReleaseMarshalData</b> can be used on both marshaled in and out parameters.
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
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallunmarshal-releasemarshaldata
     */
    ReleaseMarshalData(iMethod, pBuffer, cbBuffer, ibFirstRelease, dataRep, pcontext) {
        pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "uint", iMethod, pBufferMarshal, pBuffer, "uint", cbBuffer, "uint", ibFirstRelease, "uint", dataRep, CALLFRAME_MARSHALCONTEXT.Ptr, pcontext, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICallUnmarshal.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Unmarshal := CallbackCreate(GetMethod(implObj, "Unmarshal"), flags, 9)
        this.vtbl.ReleaseMarshalData := CallbackCreate(GetMethod(implObj, "ReleaseMarshalData"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Unmarshal)
        CallbackFree(this.vtbl.ReleaseMarshalData)
    }
}
