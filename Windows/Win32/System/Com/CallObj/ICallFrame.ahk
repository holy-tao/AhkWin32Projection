#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\CALLFRAMEINFO.ahk
#Include .\CALLFRAMEPARAMINFO.ahk
#Include ..\..\Variant\VARIANT.ahk
#Include .\ICallFrame.ahk
#Include ..\IUnknown.ahk

/**
 * Enables manipulation of call frames such as stack frames.
 * @see https://docs.microsoft.com/windows/win32/api//callobj/nn-callobj-icallframe
 * @namespace Windows.Win32.System.Com.CallObj
 * @version v4.0.30319
 */
class ICallFrame extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICallFrame
     * @type {Guid}
     */
    static IID => Guid("{d573b4b0-894e-11d2-b8b6-00c04fb9618a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInfo", "GetIIDAndMethod", "GetNames", "GetStackLocation", "SetStackLocation", "SetReturnValue", "GetReturnValue", "GetParamInfo", "SetParam", "GetParam", "Copy", "Free", "FreeParam", "WalkFrame", "GetMarshalSizeMax", "Marshal", "Unmarshal", "ReleaseMarshalData", "Invoke"]

    /**
     * Retrieves information about the call frame.
     * @returns {CALLFRAMEINFO} A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/callobj/ns-callobj-callframeinfo">CALLFRAMEINFO</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//callobj/nf-callobj-icallframe-getinfo
     */
    GetInfo() {
        pInfo := CALLFRAMEINFO()
        result := ComCall(3, this, "ptr", pInfo, "HRESULT")
        return pInfo
    }

    /**
     * Retrieves the interface ID or the method number.
     * @param {Pointer<Guid>} pIID A pointer to the interface ID.
     * @param {Pointer<Integer>} piMethod A pointer to the method number.
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
     * @see https://docs.microsoft.com/windows/win32/api//callobj/nf-callobj-icallframe-getiidandmethod
     */
    GetIIDAndMethod(pIID, piMethod) {
        piMethodMarshal := piMethod is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pIID, piMethodMarshal, piMethod, "HRESULT")
        return result
    }

    /**
     * Retrieves the method or interface name of this call.
     * @param {Pointer<PWSTR>} pwszInterface A pointer to the interface name.
     * @param {Pointer<PWSTR>} pwszMethod A pointer to the method name.
     * @returns {HRESULT} If the requested name is not available, the return value is a null string. This method can also return the following values.
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
     * @see https://docs.microsoft.com/windows/win32/api//callobj/nf-callobj-icallframe-getnames
     */
    GetNames(pwszInterface, pwszMethod) {
        pwszInterfaceMarshal := pwszInterface is VarRef ? "ptr*" : "ptr"
        pwszMethodMarshal := pwszMethod is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, pwszInterfaceMarshal, pwszInterface, pwszMethodMarshal, pwszMethod, "HRESULT")
        return result
    }

    /**
     * Retrieves the stack location onto which this call frame is bound.
     * @returns {Pointer<Void>} This method returns the requested stack location.
     * @see https://docs.microsoft.com/windows/win32/api//callobj/nf-callobj-icallframe-getstacklocation
     */
    GetStackLocation() {
        result := ComCall(6, this, "ptr")
        return result
    }

    /**
     * Sets the stack location onto which this call frame is bound.
     * @param {Pointer<Void>} pvStack A pointer to the stack location.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//callobj/nf-callobj-icallframe-setstacklocation
     */
    SetStackLocation(pvStack) {
        pvStackMarshal := pvStack is VarRef ? "ptr" : "ptr"

        ComCall(7, this, pvStackMarshal, pvStack)
    }

    /**
     * Sets the return value within the call frame.
     * @param {HRESULT} hr The new return value.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//callobj/nf-callobj-icallframe-setreturnvalue
     */
    SetReturnValue(hr) {
        ComCall(8, this, "int", hr)
    }

    /**
     * Retrieves the return value stored in the call frame.
     * @returns {HRESULT} This method returns the <b>HRESULT</b> value stored in the call frame.
     * @see https://docs.microsoft.com/windows/win32/api//callobj/nf-callobj-icallframe-getreturnvalue
     */
    GetReturnValue() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the information for the specified parameter.
     * @param {Integer} iparam The parameter number.
     * @returns {CALLFRAMEPARAMINFO} A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/callobj/ns-callobj-callframeparaminfo">CALLFRAMEPARAMINFO</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//callobj/nf-callobj-icallframe-getparaminfo
     */
    GetParamInfo(iparam) {
        pInfo := CALLFRAMEPARAMINFO()
        result := ComCall(10, this, "uint", iparam, "ptr", pInfo, "HRESULT")
        return pInfo
    }

    /**
     * Sets the value of a specified parameter in the call frame.
     * @param {Integer} iparam The parameter number.
     * @param {Pointer<VARIANT>} pvar The new value for the parameter.
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
     * @see https://docs.microsoft.com/windows/win32/api//callobj/nf-callobj-icallframe-setparam
     */
    SetParam(iparam, pvar) {
        result := ComCall(11, this, "uint", iparam, "ptr", pvar, "HRESULT")
        return result
    }

    /**
     * Retrieves the value of a specified parameter in the call frame.
     * @param {Integer} iparam The parameter number.
     * @returns {VARIANT} The value of the parameter.
     * @see https://docs.microsoft.com/windows/win32/api//callobj/nf-callobj-icallframe-getparam
     */
    GetParam(iparam) {
        pvar := VARIANT()
        result := ComCall(12, this, "uint", iparam, "ptr", pvar, "HRESULT")
        return pvar
    }

    /**
     * Creates a copy of this call frame and all of its associated data.
     * @param {Integer} copyControl Determines whether the copied call frame data can be shared with data in the parent frame by determining its lifetime dependency on the parent frame. For a list of values, see the <a href="https://docs.microsoft.com/windows/win32/api/callobj/ne-callobj-callframe_copy">CALLFRAME_COPY</a> enumeration. If the CALLFRAME_COPY_NESTED flag is set, then the client will be responsible for using the copied call frame in a manner that its lifetime is nested in the lifetime of its parent frame making the data sharable. If the CALLFRAME_COPY_INDEPENDENT is set, then the lifetime of the copied frame will be independent of the parents.
     * @param {ICallFrameWalker} pWalker A pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/callobj/nn-callobj-icallframewalker">ICallFrameWalker</a> interface. The <a href="https://docs.microsoft.com/windows/desktop/api/callobj/nf-callobj-icallframewalker-onwalkinterface">OnWalkInterface</a> method will be called for each interface pointer that is copied. If this parameter is not provided, then any interface pointer that is copied will be passed to <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a>.
     * @returns {ICallFrame} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/callobj/nn-callobj-icallframe">ICallFrame</a> pointer to a copy of the call frame.
     * @see https://docs.microsoft.com/windows/win32/api//callobj/nf-callobj-icallframe-copy
     */
    Copy(copyControl, pWalker) {
        result := ComCall(13, this, "int", copyControl, "ptr", pWalker, "ptr*", &ppFrame := 0, "HRESULT")
        return ICallFrame(ppFrame)
    }

    /**
     * Frees the frame copy to avoid a memory leak.
     * @param {ICallFrame} pframeArgsDest A pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/callobj/nn-callobj-icallframe">ICallFrame</a> interface. Represents the stack pointer of the call frame to which the out parameters should be copied before the frame copy is freed. The destination frame is usually the parent frame from which the frame was originally copied. This parameter is optional.
     * 
     * When freeing a frame and specifying a <i>pframeArgsDest</i> parameter which is in the same memory space as that of the receiver frame, then only the <i>pWalkerCopy</i> parameter is called on each interface pointer.
     * @param {ICallFrameWalker} pWalkerDestFree A pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/callobj/nn-callobj-icallframewalker">ICallFrameWalker</a> interface. If there exist in and out parameters in <i>pframeArgsDest</i>, then the propagation requires that those values be freed. By providing the <i>pWalkerDestFree</i> object, interface pointers will be freed. If <i>pframeArgsDest</i> is <b>NULL</b>, then this parameter must also be <b>NULL</b> and the interface pointers should be released by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method.
     * @param {ICallFrameWalker} pWalkerCopy A pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/callobj/nn-callobj-icallframewalker">ICallFrameWalker</a> interface. When the in and out parameters in <i>pframeArgsDest</i> are freed, then the propagation of out parameters is carried out. If this parameter is not specified, then the interface pointers will be passed to <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a>. This parameter is optional.
     * @param {Integer} freeFlags Flags from the <a href="https://docs.microsoft.com/windows/desktop/api/callobj/ne-callobj-callframe_free">CALLFRAME_FREE</a> enumeration.
     * @param {ICallFrameWalker} pWalkerFree A pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/callobj/nn-callobj-icallframewalker">ICallFrameWalker</a> interface. When specified, a callback is made for each interface pointer encountered while freeing occurs. If this parameter is not specified, then the interface pointers are freed by the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method.
     * @param {Integer} nullFlags Flags from the <a href="https://docs.microsoft.com/windows/desktop/api/callobj/ne-callobj-callframe_null">CALLFRAME_NULL</a> enumeration.
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
     * @see https://docs.microsoft.com/windows/win32/api//callobj/nf-callobj-icallframe-free
     */
    Free(pframeArgsDest, pWalkerDestFree, pWalkerCopy, freeFlags, pWalkerFree, nullFlags) {
        result := ComCall(14, this, "ptr", pframeArgsDest, "ptr", pWalkerDestFree, "ptr", pWalkerCopy, "uint", freeFlags, "ptr", pWalkerFree, "uint", nullFlags, "HRESULT")
        return result
    }

    /**
     * Frees the specified parameter in the frame.
     * @param {Integer} iparam The number of the parameter to be freed.
     * @param {Integer} freeFlags Represents flags from the <a href="https://docs.microsoft.com/windows/desktop/api/callobj/ne-callobj-callframe_free">CALLFRAME_FREE</a> enumeration.
     * @param {ICallFrameWalker} pWalkerFree A pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/callobj/nn-callobj-icallframewalker">ICallFrameWalker</a> interface. When specified, a callback is made for each interface pointer encountered while freeing occurs. If this parameter is not specified, then the interface pointers are freed by the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method.
     * @param {Integer} nullFlags Represents flags from the <a href="https://docs.microsoft.com/windows/desktop/api/callobj/ne-callobj-callframe_null">CALLFRAME_NULL</a> enumeration.
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
     * @see https://docs.microsoft.com/windows/win32/api//callobj/nf-callobj-icallframe-freeparam
     */
    FreeParam(iparam, freeFlags, pWalkerFree, nullFlags) {
        result := ComCall(15, this, "uint", iparam, "uint", freeFlags, "ptr", pWalkerFree, "uint", nullFlags, "HRESULT")
        return result
    }

    /**
     * Searches for interface pointers that are reachable from [in], [in, out], or [out] parameters of the frame.
     * @param {Integer} walkWhat Flags from the <a href="https://docs.microsoft.com/windows/desktop/api/callobj/ne-callobj-callframe_walk">CALLFRAME_WALK</a> enumeration.
     * @param {ICallFrameWalker} pWalker A pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/callobj/nn-callobj-icallframewalker">ICallFrameWalker</a> interface. When specified, a call back is made for each interface pointer encountered. This parameter is optional.
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
     * @see https://docs.microsoft.com/windows/win32/api//callobj/nf-callobj-icallframe-walkframe
     */
    WalkFrame(walkWhat, pWalker) {
        result := ComCall(16, this, "uint", walkWhat, "ptr", pWalker, "HRESULT")
        return result
    }

    /**
     * Retrieves an upper bound on the number of bytes needed to marshal the call frame.
     * @param {Pointer<CALLFRAME_MARSHALCONTEXT>} pmshlContext A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/callobj/ns-callobj-callframe_marshalcontext">CALLFRAME_MARSHALCONTEXT</a> structure containing context information about how marshalling is carried out.
     * @param {Integer} mshlflags Indicates whether the data to be marshaled is to be transmitted back to the client process - the normal case - or written to a global table, where it can be retrieved by multiple clients. For a list of values, see the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-mshlflags">MSHLFLAGS</a> enumeration.
     * @returns {Integer} A pointer to the size of the buffer, in bytes, that will be needed to marshal the call frame.
     * @see https://docs.microsoft.com/windows/win32/api//callobj/nf-callobj-icallframe-getmarshalsizemax
     */
    GetMarshalSizeMax(pmshlContext, mshlflags) {
        result := ComCall(17, this, "ptr", pmshlContext, "int", mshlflags, "uint*", &pcbBufferNeeded := 0, "HRESULT")
        return pcbBufferNeeded
    }

    /**
     * Marshals the call frame by turning its reachable data into a flat buffer without disturbing the frame.
     * @param {Pointer<CALLFRAME_MARSHALCONTEXT>} pmshlContext A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/callobj/ns-callobj-callframe_marshalcontext">CALLFRAME_MARSHALCONTEXT</a> structure containing context information about how marshalling is carried out.
     * @param {Integer} mshlflags Flag indicating whether the data to be marshaled is to be transmitted back to the client process - the normal case - or written to a global table, where it can be retrieved by multiple clients. The possible values are from the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-mshlflags">MSHLFLAGS</a> enumeration.
     * @param {Pointer<Void>} pBuffer A pointer to the buffer into which the marshaled data is to be placed.
     * @param {Integer} cbBuffer The size of the buffer, in bytes.
     * @param {Pointer<Integer>} pcbBufferUsed Receives the size of the buffer that was actually used. This parameter is optional.
     * @param {Pointer<Integer>} pdataRep Receives the NDR data representation with which the data was marshaled. This parameter is optional. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irpcchannelbuffer-getbuffer">IRpcChannelBuffer::GetBuffer</a>.
     * @param {Pointer<Integer>} prpcFlags Receives an RPC flag associated with the call. This parameter is optional. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irpcchannelbuffer-getbuffer">IRpcChannelBuffer::GetBuffer</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//callobj/nf-callobj-icallframe-marshal
     */
    Marshal(pmshlContext, mshlflags, pBuffer, cbBuffer, pcbBufferUsed, pdataRep, prpcFlags) {
        pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"
        pcbBufferUsedMarshal := pcbBufferUsed is VarRef ? "uint*" : "ptr"
        pdataRepMarshal := pdataRep is VarRef ? "uint*" : "ptr"
        prpcFlagsMarshal := prpcFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, "ptr", pmshlContext, "int", mshlflags, pBufferMarshal, pBuffer, "uint", cbBuffer, pcbBufferUsedMarshal, pcbBufferUsed, pdataRepMarshal, pdataRep, prpcFlagsMarshal, prpcFlags, "HRESULT")
        return result
    }

    /**
     * Unmarshals a packet of data containing the previously marshaled [out] parameters of a call into this already existing activation record.
     * @param {Pointer<Void>} pBuffer A pointer to the buffer containing the marshaled [out] values.
     * @param {Integer} cbBuffer The size of the buffer, in bytes.
     * @param {Integer} dataRep The NDR data representation with which the data was marshaled. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irpcchannelbuffer-getbuffer">IRpcChannelBuffer::GetBuffer</a>.
     * @param {Pointer<CALLFRAME_MARSHALCONTEXT>} pcontext A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/callobj/ns-callobj-callframe_marshalcontext">CALLFRAME_MARSHALCONTEXT</a> structure containing context information about how unmarshalling is carried out.
     * @returns {Integer} Receives the number of bytes that were successfully unmarshaled. This parameter is returned even in error situations. This parameter is optional.
     * @see https://docs.microsoft.com/windows/win32/api//callobj/nf-callobj-icallframe-unmarshal
     */
    Unmarshal(pBuffer, cbBuffer, dataRep, pcontext) {
        pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"

        result := ComCall(19, this, pBufferMarshal, pBuffer, "uint", cbBuffer, "uint", dataRep, "ptr", pcontext, "uint*", &pcbUnmarshalled := 0, "HRESULT")
        return pcbUnmarshalled
    }

    /**
     * Releases resources that are held by interface pointers residing in a packet of marshaled data. This method finds all interface pointers in the packet, and calls the CoReleaseMarshalData function on each one.
     * @param {Pointer<Void>} pBuffer A pointer to the buffer containing the marshaled [out] values.
     * @param {Integer} cbBuffer The size of the buffer, in bytes.
     * @param {Integer} ibFirstRelease The first byte in the buffer, which is to be released. A value of zero implies that the interface pointers in the whole buffer are to be released. The marshaled interface pointers are assumed to have been released by some other mechanism.
     * @param {Integer} dataRep The data representation with which the data was marshaled.
     * @param {Pointer<CALLFRAME_MARSHALCONTEXT>} pcontext A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/callobj/ns-callobj-callframe_marshalcontext">CALLFRAME_MARSHALCONTEXT</a> structure containing context information about how un-marshalling is carried out.
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
     * @see https://docs.microsoft.com/windows/win32/api//callobj/nf-callobj-icallframe-releasemarshaldata
     */
    ReleaseMarshalData(pBuffer, cbBuffer, ibFirstRelease, dataRep, pcontext) {
        pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"

        result := ComCall(20, this, pBufferMarshal, pBuffer, "uint", cbBuffer, "uint", ibFirstRelease, "uint", dataRep, "ptr", pcontext, "HRESULT")
        return result
    }

    /**
     * Applies this activation record to an object. In a marshalling situation, typically this is carried out on the server side, and is the means by which the work of the actual object is accomplished.
     * @param {Pointer<Void>} pvReceiver The interface on which the invocation is to occur. The caller is responsible for ensuring that this interface is of the appropriate IID; the implementation will simply do a cast and assume that is the case.
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
     * <dt><b>CALLFRAME_E_ALREADYINVOKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invocation has already been made from this frame.
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
     * @see https://docs.microsoft.com/windows/win32/api//callobj/nf-callobj-icallframe-invoke
     */
    Invoke(pvReceiver) {
        pvReceiverMarshal := pvReceiver is VarRef ? "ptr" : "ptr"

        result := ComCall(21, this, pvReceiverMarshal, pvReceiver, "HRESULT")
        return result
    }
}
