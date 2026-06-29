#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\TERMINAL_DIRECTION.ahk" { TERMINAL_DIRECTION }
#Import ".\IEnumStream.ahk" { IEnumStream }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITStream.ahk" { ITStream }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The ITStreamControl interface represents the media streaming features of a call and exposes methods that allow an application to enumerate, create, or remove streams.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itstreamcontrol
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITStreamControl extends IDispatch {
    /**
     * The interface identifier for ITStreamControl
     * @type {Guid}
     */
    static IID := Guid("{ee3bd604-3868-11d2-a045-00c04fb6809f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITStreamControl interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        CreateStream     : IntPtr
        RemoveStream     : IntPtr
        EnumerateStreams : IntPtr
        get_Streams      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITStreamControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    Streams {
        get => this.get_Streams()
    }

    /**
     * The CreateStream method creates a new media stream.
     * @remarks
     * Many MSPs do not support dynamic creation of streams, and simply return TAPI_E_MAXSTREAMS in their implementation of this method. Default streams are automatically available when a call is created, so most applications do not have to use this method.
     * 
     * Stream creation or removal may involve interaction with a remote endpoint, resulting in a CMC_REMOTE_REQUEST rather than the CMC_LOCAL_REQUEST messages that are received when a stream is stopped or started.
     * 
     * TAPI calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itstream">ITStream</a> interface returned by <b>ITStreamControl::CreateStream</b>. The application must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the 
     * <b>ITStream</b> interface to free resources associated with it.
     * @param {Integer} lMediaType Indicates 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapimediatype--constants">media type</a> for stream.
     * @param {TERMINAL_DIRECTION} td Indicates the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-terminal_direction">TERMINAL_DIRECTION</a>.
     * @returns {ITStream} Pointer to pointer for newly created 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itstream">ITStream</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itstreamcontrol-createstream
     */
    CreateStream(lMediaType, td) {
        result := ComCall(7, this, "int", lMediaType, TERMINAL_DIRECTION, td, "ptr*", &ppStream := 0, "HRESULT")
        return ITStream(ppStream)
    }

    /**
     * The RemoveStream method removes a media stream.
     * @remarks
     * Some MSPs may not support the advanced concept of creating and removing streams, and simply return TAPI_E_NOTSUPPORTED.
     * 
     * Stream creation or removal may involve interaction with a remote endpoint, resulting in a CMC_REMOTE_REQUEST rather than the CMC_LOCAL_REQUEST messages that are received when a stream is stopped or started.
     * @param {ITStream} pStream Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itstream">ITStream</a> interface.
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
     * The <i>pStream</i> parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TAPI_E_NOTSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This operation is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itstreamcontrol-removestream
     */
    RemoveStream(pStream) {
        result := ComCall(8, this, "ptr", pStream, "HRESULT")
        return result
    }

    /**
     * The EnumerateStreams method enumerates currently available media streams. Provided for C and C++ applications. Automation client applications such as Visual Basic must use the get_Streams method.
     * @remarks
     * TAPI calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumstream">IEnumStream</a> interface returned by <b>ITStreamControl::EnumerateStreams</b>. The application must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the 
     * <b>IEnumStream</b> interface to free resources associated with it.
     * @returns {IEnumStream} Pointer to pointer for 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumstream">IEnumStream</a> enumerator.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itstreamcontrol-enumeratestreams
     */
    EnumerateStreams() {
        result := ComCall(9, this, "ptr*", &ppEnumStream := 0, "HRESULT")
        return IEnumStream(ppEnumStream)
    }

    /**
     * The get_Streams method creates a collection of media streams currently available on the call. Provided for Automation client applications, such as those written in Visual Basic. C and C++ applications must use the EnumerateStreams method.
     * @remarks
     * TAPI calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itstream">ITStream</a> interface returned by <b>ITStreamControl::get_Stream</b>. The application must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the 
     * <b>ITStream</b> interface to free resources associated with it.
     * @returns {VARIANT} Pointer to <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itstream">ITStream</a> interface pointers.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itstreamcontrol-get_streams
     */
    get_Streams() {
        pVariant := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, pVariant, "HRESULT")
        return pVariant
    }

    Query(iid) {
        if (ITStreamControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateStream := CallbackCreate(GetMethod(implObj, "CreateStream"), flags, 4)
        this.vtbl.RemoveStream := CallbackCreate(GetMethod(implObj, "RemoveStream"), flags, 2)
        this.vtbl.EnumerateStreams := CallbackCreate(GetMethod(implObj, "EnumerateStreams"), flags, 2)
        this.vtbl.get_Streams := CallbackCreate(GetMethod(implObj, "get_Streams"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateStream)
        CallbackFree(this.vtbl.RemoveStream)
        CallbackFree(this.vtbl.EnumerateStreams)
        CallbackFree(this.vtbl.get_Streams)
    }
}
