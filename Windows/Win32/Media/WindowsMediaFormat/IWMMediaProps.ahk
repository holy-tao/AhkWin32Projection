#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WM_MEDIA_TYPE.ahk" { WM_MEDIA_TYPE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMMediaProps interface sets and retrieves the WM_MEDIA_TYPE structure for an input, stream, or output.In the case of inputs and streams, the contents of the media type structure determine what actions the writer object will perform on the input data when writing the file. Typically, the input media type is an uncompressed type and the stream is a compressed type, so that the contents of their respective media type structures will determine the settings passed by the writer to the codec that will compress the stream.In the case of outputs, the media type structure determines the settings used to decompress the contents of a stream. The Windows Media codecs are capable of delivering output content in a variety of formats.The methods of IWMMediaProps are inherited by IWMVideoMediaProps, which provides access to additional settings for specifying video media types. The methods are also inherited by IWMInputMediaProps and IWMOutputMediaProps.An instance of the IWMMediaProps interface exists for every stream configuration object, input media properties object, and output media properties object. You can retrieve a pointer to this interface by calling the QueryInterface method of any other interface in one of those objects.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmmediaprops
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMMediaProps extends IUnknown {
    /**
     * The interface identifier for IWMMediaProps
     * @type {Guid}
     */
    static IID := Guid("{96406bce-2b2b-11d3-b36b-00c04f6108ff}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMMediaProps interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetType      : IntPtr
        GetMediaType : IntPtr
        SetMediaType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMMediaProps.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetType method retrieves the major type of the media in the stream, input, or output described by the object to which the current IWMMediaProps interface belongs.
     * @remarks
     * These media types are used by the writer, reader, and profile objects to identify the properties of a media stream that are specific to the media type.
     * 
     * <b>GetType</b> is provided for convenience; it returns the same value as the <b>majortype</b> member of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wm_media_type">WM_MEDIA_TYPE</a>.
     * @returns {Guid} Pointer to a GUID specifying the media type.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmmediaprops-gettype
     */
    GetType() {
        pguidType := Guid()
        result := ComCall(3, this, Guid.Ptr, pguidType, "HRESULT")
        return pguidType
    }

    /**
     * The GetMediaType method retrieves a structure describing the media type.
     * @remarks
     * You must make two calls to <b>GetMediaType</b>. On the first call, pass <b>NULL</b> as <i>pType</i>. On return, the value of <i>pcbType</i> will be set to the buffer size required to hold the <b>WM_MEDIA_TYPE</b> structure. Then you can allocate a buffer of the required size and pass a pointer to it as <i>pType</i> on the second call.
     * @param {Pointer<Integer>} pcbType On input, the size of the <i>pType</i> buffer. On output, if <i>pType</i> is set to <b>NULL</b>, the value this points to is set to the size of the buffer needed to hold the media type structure.
     * @returns {WM_MEDIA_TYPE} Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wm_media_type">WM_MEDIA_TYPE</a> structure. If this parameter is set to <b>NULL</b>, this method returns the size of the buffer required in the <i>pcbType</i> parameter.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmmediaprops-getmediatype
     */
    GetMediaType(pcbType) {
        pcbTypeMarshal := pcbType is VarRef ? "uint*" : "ptr"

        pType := WM_MEDIA_TYPE()
        result := ComCall(4, this, WM_MEDIA_TYPE.Ptr, pType, pcbTypeMarshal, pcbType, "HRESULT")
        return pType
    }

    /**
     * The SetMediaType method specifies the media type.
     * @remarks
     * It is possible to successfully set a media type in this method that will ultimately be rejected as invalid when the profile is set on the writer. For a list of tests that the writer performs on the profile, see <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriter-setprofile">IWMWriter::SetProfile</a>.
     * @param {Pointer<WM_MEDIA_TYPE>} pType Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wm_media_type">WM_MEDIA_TYPE</a> structure describing the input, stream, or output.
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
     * The <i>pType</i> parameter is <b>NULL</b>, cbFormat is 0 or too large, or pbFormat is <b>NULL</b>.
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
     * There is not enough available memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmmediaprops-setmediatype
     */
    SetMediaType(pType) {
        result := ComCall(5, this, WM_MEDIA_TYPE.Ptr, pType, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMMediaProps.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetType := CallbackCreate(GetMethod(implObj, "GetType"), flags, 2)
        this.vtbl.GetMediaType := CallbackCreate(GetMethod(implObj, "GetMediaType"), flags, 3)
        this.vtbl.SetMediaType := CallbackCreate(GetMethod(implObj, "SetMediaType"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetType)
        CallbackFree(this.vtbl.GetMediaType)
        CallbackFree(this.vtbl.SetMediaType)
    }
}
