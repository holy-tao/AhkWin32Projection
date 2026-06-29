#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\Document.ahk" { Document }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\Frame.ahk" { Frame }

/**
 * @namespace Windows.Win32.System.Mmc
 */
export default struct _Application extends IDispatch {
    /**
     * The interface identifier for _Application
     * @type {Guid}
     */
    static IID := Guid("{a3afb9cc-b653-4741-86ab-f0470ec1384c}")

    /**
     * The class identifier for _Application
     * @type {Guid}
     */
    static CLSID := Guid("{a3afb9cc-b653-4741-86ab-f0470ec1384c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for _Application interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Help             : IntPtr
        Quit             : IntPtr
        get_Document     : IntPtr
        Load             : IntPtr
        get_Frame        : IntPtr
        get_Visible      : IntPtr
        Show             : IntPtr
        Hide             : IntPtr
        get_UserControl  : IntPtr
        put_UserControl  : IntPtr
        get_VersionMajor : IntPtr
        get_VersionMinor : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := _Application.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Document} 
     */
    Document {
        get => this.get_Document()
    }

    /**
     * @type {Frame} 
     */
    Frame {
        get => this.get_Frame()
    }

    /**
     * @type {BOOL} 
     */
    Visible {
        get => this.get_Visible()
    }

    /**
     * @type {BOOL} 
     */
    UserControl {
        get => this.get_UserControl()
        set => this.put_UserControl(value)
    }

    /**
     * @type {Integer} 
     */
    VersionMajor {
        get => this.get_VersionMajor()
    }

    /**
     * @type {Integer} 
     */
    VersionMinor {
        get => this.get_VersionMinor()
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Help() {
        ComCall(7, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Quit() {
        ComCall(8, this)
    }

    /**
     * 
     * @returns {Document} 
     */
    get_Document() {
        result := ComCall(9, this, "ptr*", &_Document := 0, "HRESULT")
        return Document(_Document)
    }

    /**
     * Reads texel data without any filtering or sampling.
     * @param {BSTR} Filename 
     * @returns {HRESULT} <span id="Object"></span><span id="object"></span><span id="OBJECT"></span>*Object*
     * 
     * A [texture-object](dx-graphics-hlsl-to-type.md) type (except TextureCube or TextureCubeArray).
     * 
     * 
     * <span id="Location"></span><span id="location"></span><span id="LOCATION"></span>*Location*
     * 
     * \[in\] The texture coordinates; the last component specifies the mipmap level. This method uses a 0-based coordinate system and not a 0.0-1.0 UV system. The argument type is dependent on the texture-object type.
     * 
     * 
     * 
     * | Object Type                                  | Parameter Type |
     * |----------------------------------------------|----------------|
     * | Buffer                                       | int            |
     * | Texture1D, Texture2DMS                       | int2           |
     * | Texture1DArray, Texture2D, Texture2DMSArray  | int3           |
     * | Texture2DArray, Texture3D                    | int4           |
     * 
     * 
     * 
     *  
     * 
     * For example, to access a 2D texture, supply integer texel coordinates for the first two components and a mipmap level for the third component.
     * 
     * > [!Note]  
     * > When one or more of the coordinates in *Location* exceed the u, v, or w mipmap level dimensions of the texture, **Load** returns zero in all components. Direct3D guarantees to return zero for any resource that is accessed out of bounds.
     * 
     *  
     * 
     * 
     * <span id="SampleIndex"></span><span id="sampleindex"></span><span id="SAMPLEINDEX"></span>*SampleIndex*
     * 
     * \[in\] A sampling index. Required for multi-sample textures. Not supported for other textures.
     * 
     * 
     * 
     * | Texture Type                                                                                                   | Parameter Type |
     * |----------------------------------------------------------------------------------------------------------------|----------------|
     * | Texture1D, Texture1DArray, Texture2D, Texture2DArray, Texture3D, Texture2DArray, TextureCube, TextureCubeArray | not supported  |
     * | Texture2DMS, Texture2DMSArray¹                                                                                 | int            |
     * 
     * 
     * <span id="Offset"></span><span id="offset"></span><span id="OFFSET"></span>*Offset*
     * 
     * \[in\] An optional offset applied to the texture coordinates before sampling. The offset type is dependent on the texture-object type, and needs to be static.
     * 
     * 
     * 
     * | Texture Type                                             | Parameter Type |
     * |----------------------------------------------------------|----------------|
     * | Texture1D, Texture1DArray                                | int            |
     * | Texture2D, Texture2DArray, Texture2DMS, Texture2DMSArray | int2           |
     * | Texture3D                                                | int3           |
     * 
     * 
     * 
     *  
     * 
     * > [!Note]  
     * > *SampleIndex* must always be specified first with multi-sample textures.
     * 
     *  
     * 
     * 
     * 
     * The return type matches the type in the *Object* declaration. For example, a Texture2D object that was declared as "Texture2d&lt;uint4&gt; myTexture;" has a return value of type **uint4**.
     * @see https://learn.microsoft.com/windows/win32/direct3dhlsl/dx-graphics-hlsl-to-load
     */
    Load(Filename) {
        Filename := Filename is String ? BSTR.Alloc(Filename).Value : Filename

        result := ComCall(10, this, BSTR, Filename, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Frame} 
     */
    get_Frame() {
        result := ComCall(11, this, "ptr*", &_Frame := 0, "HRESULT")
        return Frame(_Frame)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_Visible() {
        result := ComCall(12, this, BOOL.Ptr, &Visible := 0, "HRESULT")
        return Visible
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Show() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * This article provides a detailed overview of the hide meeting update option property with additional remarks.
     * @remarks
     * To provide any of the store functionality, the store provider must implement [IMAPIProp : IUnknown](imapipropiunknown.md) and return a valid property tag for any of these properties passed to an [IMAPIProp::GetIDsFromNames](imapiprop-getidsfromnames.md) call. When the property tag for any of these properties is passed to [IMAPIProp::GetProps](imapiprop-getprops.md), the store provider must also return the correct property value. Store providers can call [HrGetOneProp](hrgetoneprop.md) and [HrSetOneProp](hrsetoneprop.md) to get or set these properties. 
     *   
     * To retrieve the value of this property, the client should first use [IMAPIProp::GetIDsFromNames](imapiprop-getidsfromnames.md) to obtain the property tag, and then specify this property tag in [IMAPIProp::GetProps](imapiprop-getprops.md) to get the value. When calling [IMAPIProp::GetIDsFromNames](imapiprop-getidsfromnames.md), specify the following values for the [MAPINAMEID](mapinameid.md) structure pointed at by the input parameter  _lppPropNames_:
     *   
     * |Property |Value |
     * |:-----|:-----|
     * |lpGuid:  <br/> |PS_PUBLIC_STRINGS  <br/> |
     * |ulKind:  <br/> |MNID_STRING  <br/> |
     * |Kind.lpwstrName:  <br/> |L"urn:schemas-microsoft-com:office:outlook#allornonemtgupdatedlg"  <br/> |
     *    
     * A store provider that uses a server to send meeting updates can modify the **Send Update to Attendees** dialog box. This functionality is useful because when the server sends a meeting update, the server does not know which attendees have been added or deleted by the user since the initial meeting request. When this property is **true**, the **Send update only to added or deleted attendees** option is not displayed in the **Send Update to Attendees** dialog box. 
     *   
     * This property is ignored if the version of Outlook is earlier than Microsoft Office Outlook 2003 Service Pack 1, or if its value is **false**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/hide-meeting-update-option-property
     */
    Hide() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_UserControl() {
        result := ComCall(15, this, BOOL.Ptr, &UserControl := 0, "HRESULT")
        return UserControl
    }

    /**
     * 
     * @param {BOOL} UserControl 
     * @returns {HRESULT} 
     */
    put_UserControl(UserControl) {
        result := ComCall(16, this, BOOL, UserControl, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VersionMajor() {
        result := ComCall(17, this, "int*", &VersionMajor := 0, "HRESULT")
        return VersionMajor
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VersionMinor() {
        result := ComCall(18, this, "int*", &VersionMinor := 0, "HRESULT")
        return VersionMinor
    }

    Query(iid) {
        if (_Application.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Help := CallbackCreate(GetMethod(implObj, "Help"), flags, 1)
        this.vtbl.Quit := CallbackCreate(GetMethod(implObj, "Quit"), flags, 1)
        this.vtbl.get_Document := CallbackCreate(GetMethod(implObj, "get_Document"), flags, 2)
        this.vtbl.Load := CallbackCreate(GetMethod(implObj, "Load"), flags, 2)
        this.vtbl.get_Frame := CallbackCreate(GetMethod(implObj, "get_Frame"), flags, 2)
        this.vtbl.get_Visible := CallbackCreate(GetMethod(implObj, "get_Visible"), flags, 2)
        this.vtbl.Show := CallbackCreate(GetMethod(implObj, "Show"), flags, 1)
        this.vtbl.Hide := CallbackCreate(GetMethod(implObj, "Hide"), flags, 1)
        this.vtbl.get_UserControl := CallbackCreate(GetMethod(implObj, "get_UserControl"), flags, 2)
        this.vtbl.put_UserControl := CallbackCreate(GetMethod(implObj, "put_UserControl"), flags, 2)
        this.vtbl.get_VersionMajor := CallbackCreate(GetMethod(implObj, "get_VersionMajor"), flags, 2)
        this.vtbl.get_VersionMinor := CallbackCreate(GetMethod(implObj, "get_VersionMinor"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Help)
        CallbackFree(this.vtbl.Quit)
        CallbackFree(this.vtbl.get_Document)
        CallbackFree(this.vtbl.Load)
        CallbackFree(this.vtbl.get_Frame)
        CallbackFree(this.vtbl.get_Visible)
        CallbackFree(this.vtbl.Show)
        CallbackFree(this.vtbl.Hide)
        CallbackFree(this.vtbl.get_UserControl)
        CallbackFree(this.vtbl.put_UserControl)
        CallbackFree(this.vtbl.get_VersionMajor)
        CallbackFree(this.vtbl.get_VersionMinor)
    }
}
