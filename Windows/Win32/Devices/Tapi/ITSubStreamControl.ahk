#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IEnumSubStream.ahk" { IEnumSubStream }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\ITSubStream.ahk" { ITSubStream }

/**
 * The ITSubStreamControl interface exposes methods that allow an application to enumerate, create, or remove substreams. Many MSPs do not support this interface.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itsubstreamcontrol
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITSubStreamControl extends IDispatch {
    /**
     * The interface identifier for ITSubStreamControl
     * @type {Guid}
     */
    static IID := Guid("{ee3bd607-3868-11d2-a045-00c04fb6809f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITSubStreamControl interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        CreateSubStream     : IntPtr
        RemoveSubStream     : IntPtr
        EnumerateSubStreams : IntPtr
        get_SubStreams      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITSubStreamControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    SubStreams {
        get => this.get_SubStreams()
    }

    /**
     * The CreateSubStream method creates a substream.
     * @remarks
     * Many MSPs do not support dynamic creation of substreams, and simply return TAPI_E_MAXSTREAMS in their implementation of this method.
     * 
     * TAPI calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itsubstream">ITSubStream</a> interface returned by <b>ITSubStreamControl::CreateSubStream</b>. The application must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the 
     * <b>ITSubStream</b> interface to free resources associated with it.
     * @returns {ITSubStream} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itsubstream">ITSubStream</a> interface created.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itsubstreamcontrol-createsubstream
     */
    CreateSubStream() {
        result := ComCall(7, this, "ptr*", &ppSubStream := 0, "HRESULT")
        return ITSubStream(ppSubStream)
    }

    /**
     * The RemoveSubStream method removes a substream.
     * @remarks
     * Some MSPs may not support the advanced concept of creating and removing substreams, and simply return TAPI_E_NOTSUPPORTED.
     * @param {ITSubStream} pSubStream Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itsubstream">ITSubStream</a> to be removed.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
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
     * The <i>pSubStream</i> parameter does not point to a valid interface.
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
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_INVALIDSTREAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pSubStream</i> parameter does not point to a valid substream.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itsubstreamcontrol-removesubstream
     */
    RemoveSubStream(pSubStream) {
        result := ComCall(8, this, "ptr", pSubStream, "HRESULT")
        return result
    }

    /**
     * The EnumerateSubStreams method enumerates currently available media substreams. Provided for C and C++ applications. Automation client applications such as Visual Basic must use the get_SubStreams method.
     * @remarks
     * TAPI calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumsubstream">IEnumSubStream</a> interface returned by <b>ITSubStreamControl::EnumerateSubStreams</b>. The application must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the 
     * <b>IEnumSubStream</b> interface to free resources associated with it.
     * @returns {IEnumSubStream} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumsubstream">IEnumSubStream</a> enumeration of substreams.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itsubstreamcontrol-enumeratesubstreams
     */
    EnumerateSubStreams() {
        result := ComCall(9, this, "ptr*", &ppEnumSubStream := 0, "HRESULT")
        return IEnumSubStream(ppEnumSubStream)
    }

    /**
     * The get_SubStreams method creates a collection of substreams currently available. Provided for Automation client applications, such as those written in Visual Basic. C and C++ applications must use the EnumerateSubStreams method.
     * @remarks
     * TAPI calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itsubstream">ITSubStream</a> interface returned by <b>ITSubStreamControl::get_SubStreams</b>. The application must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the 
     * <b>ITSubStream</b> interface to free resources associated with it.
     * @returns {VARIANT} Pointer to <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itsubstream">ITSubStream</a> interface pointers.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itsubstreamcontrol-get_substreams
     */
    get_SubStreams() {
        pVariant := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, pVariant, "HRESULT")
        return pVariant
    }

    Query(iid) {
        if (ITSubStreamControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateSubStream := CallbackCreate(GetMethod(implObj, "CreateSubStream"), flags, 2)
        this.vtbl.RemoveSubStream := CallbackCreate(GetMethod(implObj, "RemoveSubStream"), flags, 2)
        this.vtbl.EnumerateSubStreams := CallbackCreate(GetMethod(implObj, "EnumerateSubStreams"), flags, 2)
        this.vtbl.get_SubStreams := CallbackCreate(GetMethod(implObj, "get_SubStreams"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateSubStream)
        CallbackFree(this.vtbl.RemoveSubStream)
        CallbackFree(this.vtbl.EnumerateSubStreams)
        CallbackFree(this.vtbl.get_SubStreams)
    }
}
