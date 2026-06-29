#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk
#Include .\Frame.ahk
#Include .\Document.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.System.Mmc
 */
class _Application extends IDispatch {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for _Application
     * @type {Guid}
     */
    static IID => Guid("{a3afb9cc-b653-4741-86ab-f0470ec1384c}")

    /**
     * The class identifier for _Application
     * @type {Guid}
     */
    static CLSID => Guid("{a3afb9cc-b653-4741-86ab-f0470ec1384c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Help", "Quit", "get_Document", "Load", "get_Frame", "get_Visible", "Show", "Hide", "get_UserControl", "put_UserControl", "get_VersionMajor", "get_VersionMinor"]

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

        result := ComCall(10, this, "ptr", Filename, "HRESULT")
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
        result := ComCall(12, this, "int*", &Visible := 0, "HRESULT")
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
        result := ComCall(15, this, "int*", &UserControl := 0, "HRESULT")
        return UserControl
    }

    /**
     * 
     * @param {BOOL} UserControl 
     * @returns {HRESULT} 
     */
    put_UserControl(UserControl) {
        result := ComCall(16, this, "int", UserControl, "HRESULT")
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
}
