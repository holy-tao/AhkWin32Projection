#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\MediaFoundation\AM_MEDIA_TYPE.ahk" { AM_MEDIA_TYPE }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\ComponentCategory.ahk" { ComponentCategory }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IComponentType interface is implemented on ComponentType objects, and contains methods for setting and retrieving various properties for a Component.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IComponentType)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-icomponenttype
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IComponentType extends IDispatch {
    /**
     * The interface identifier for IComponentType
     * @type {Guid}
     */
    static IID := Guid("{6a340dc0-0311-11d3-9d8e-00c04f72d980}")

    /**
     * The class identifier for ComponentType
     * @type {Guid}
     */
    static CLSID := Guid("{823535a0-0318-11d3-9d8e-00c04f72d980}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComponentType interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Category         : IntPtr
        put_Category         : IntPtr
        get_MediaMajorType   : IntPtr
        put_MediaMajorType   : IntPtr
        get__MediaMajorType  : IntPtr
        put__MediaMajorType  : IntPtr
        get_MediaSubType     : IntPtr
        put_MediaSubType     : IntPtr
        get__MediaSubType    : IntPtr
        put__MediaSubType    : IntPtr
        get_MediaFormatType  : IntPtr
        put_MediaFormatType  : IntPtr
        get__MediaFormatType : IntPtr
        put__MediaFormatType : IntPtr
        get_MediaType        : IntPtr
        put_MediaType        : IntPtr
        Clone                : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComponentType.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ComponentCategory} 
     */
    Category {
        get => this.get_Category()
        set => this.put_Category(value)
    }

    /**
     * @type {BSTR} 
     */
    MediaMajorType {
        get => this.get_MediaMajorType()
        set => this.put_MediaMajorType(value)
    }

    /**
     * @type {Guid} 
     */
    _MediaMajorType {
        get => this.get__MediaMajorType()
        set => this.put__MediaMajorType(value)
    }

    /**
     * @type {BSTR} 
     */
    MediaSubType {
        get => this.get_MediaSubType()
        set => this.put_MediaSubType(value)
    }

    /**
     * @type {Guid} 
     */
    _MediaSubType {
        get => this.get__MediaSubType()
        set => this.put__MediaSubType(value)
    }

    /**
     * @type {BSTR} 
     */
    MediaFormatType {
        get => this.get_MediaFormatType()
        set => this.put_MediaFormatType(value)
    }

    /**
     * @type {Guid} 
     */
    _MediaFormatType {
        get => this.get__MediaFormatType()
        set => this.put__MediaFormatType(value)
    }

    /**
     * @type {AM_MEDIA_TYPE} 
     */
    MediaType {
        get => this.get_MediaType()
        set => this.put_MediaType(value)
    }

    /**
     * The get_Category method retrieves the component category.
     * @returns {ComponentCategory} Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/componentcategory">ComponentCategory</a> data type that will receive the category.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-get_category
     */
    get_Category() {
        result := ComCall(7, this, "int*", &Category := 0, "HRESULT")
        return Category
    }

    /**
     * The put_Category method sets the component category.
     * @param {ComponentCategory} Category A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/componentcategory">ComponentCategory</a> value that specifies the new category for this component type.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-put_category
     */
    put_Category(Category) {
        result := ComCall(8, this, ComponentCategory, Category, "HRESULT")
        return result
    }

    /**
     * The get_MediaMajorType method retrieves the DirectShow media major type as a BSTR.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that will receive the GUID.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-get_mediamajortype
     */
    get_MediaMajorType() {
        MediaMajorType := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, MediaMajorType, "HRESULT")
        return MediaMajorType
    }

    /**
     * The put_MediaMajorType method sets the DirectShow media major type.
     * @param {BSTR} MediaMajorType <b>BSTR</b> that specifies the GUID.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-put_mediamajortype
     */
    put_MediaMajorType(MediaMajorType) {
        MediaMajorType := MediaMajorType is String ? BSTR.Alloc(MediaMajorType).Value : MediaMajorType

        result := ComCall(10, this, BSTR, MediaMajorType, "HRESULT")
        return result
    }

    /**
     * The get__MediaMajorType method retrieves the DirectShow media format type as a GUID.
     * @remarks
     * This method is available through C++ only. Note the two underscores in the method name as compared to the one underscore for the method that uses a <b>BSTR</b> as a parameter.
     * @returns {Guid} Pointer to a GUID that will receive the major type.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-get__mediamajortype
     */
    get__MediaMajorType() {
        MediaMajorTypeGuid := Guid()
        result := ComCall(11, this, Guid.Ptr, MediaMajorTypeGuid, "HRESULT")
        return MediaMajorTypeGuid
    }

    /**
     * The put__MediaMajorType method sets the DirectShow media major type.
     * @remarks
     * This method is available through C++ only. Note the two underscores in the method name as compared to the one underscore for the method that uses a <b>BSTR</b> as a parameter.
     * @param {Pointer<Guid>} MediaMajorTypeGuid <b>REFCLSID</b> that specifies the media major type.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-put__mediamajortype
     */
    put__MediaMajorType(MediaMajorTypeGuid) {
        result := ComCall(12, this, Guid.Ptr, MediaMajorTypeGuid, "HRESULT")
        return result
    }

    /**
     * The get_MediaSubType method retrieves the DirectShow media subtype as a BSTR.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that will receive the GUID.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-get_mediasubtype
     */
    get_MediaSubType() {
        MediaSubType := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, MediaSubType, "HRESULT")
        return MediaSubType
    }

    /**
     * The put_MediaSubType method sets the DirectShow media subtype.
     * @param {BSTR} MediaSubType <b>BSTR</b> that specifies the GUID.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-put_mediasubtype
     */
    put_MediaSubType(MediaSubType) {
        MediaSubType := MediaSubType is String ? BSTR.Alloc(MediaSubType).Value : MediaSubType

        result := ComCall(14, this, BSTR, MediaSubType, "HRESULT")
        return result
    }

    /**
     * The get__MediaSubType method retrieves the DirectShow media subtype as a GUID.
     * @remarks
     * This method is available through C++ only. Note the two underscores in the method name as compared to the one underscore for the method that uses a <b>BSTR</b> as a parameter.
     * @returns {Guid} Pointer to a GUID that will receive the major type.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-get__mediasubtype
     */
    get__MediaSubType() {
        MediaSubTypeGuid := Guid()
        result := ComCall(15, this, Guid.Ptr, MediaSubTypeGuid, "HRESULT")
        return MediaSubTypeGuid
    }

    /**
     * The put__MediaSubType method sets the DirectShow media subtype.
     * @remarks
     * This method is available through C++ only. Note the two underscores in the method name as compared to the one underscore for the method that uses a <b>BSTR</b> as a parameter.
     * @param {Pointer<Guid>} MediaSubTypeGuid <b>REFCLSID</b> that specifies the media sub type.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-put__mediasubtype
     */
    put__MediaSubType(MediaSubTypeGuid) {
        result := ComCall(16, this, Guid.Ptr, MediaSubTypeGuid, "HRESULT")
        return result
    }

    /**
     * The get_MediaFormatType method retrieves the DirectShow media format type as a BSTR.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that will receive the GUID.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-get_mediaformattype
     */
    get_MediaFormatType() {
        MediaFormatType := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, MediaFormatType, "HRESULT")
        return MediaFormatType
    }

    /**
     * The put_MediaFormatType method sets the DirectShow media format type.
     * @param {BSTR} MediaFormatType <b>BSTR</b> that specifies the GUID.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-put_mediaformattype
     */
    put_MediaFormatType(MediaFormatType) {
        MediaFormatType := MediaFormatType is String ? BSTR.Alloc(MediaFormatType).Value : MediaFormatType

        result := ComCall(18, this, BSTR, MediaFormatType, "HRESULT")
        return result
    }

    /**
     * The get__MediaFormatType method retrieves the DirectShow media format type as a GUID.
     * @remarks
     * This method is available through C++ only. Note the two underscores in the method name as compared to the one underscore for the method that uses a <b>BSTR</b> as a parameter.
     * @returns {Guid} Pointer to a GUID that will receive the format type.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-get__mediaformattype
     */
    get__MediaFormatType() {
        MediaFormatTypeGuid := Guid()
        result := ComCall(19, this, Guid.Ptr, MediaFormatTypeGuid, "HRESULT")
        return MediaFormatTypeGuid
    }

    /**
     * The put__MediaFormatType method sets the DirectShow media format type.
     * @remarks
     * This method is available through C++ only. Note the two underscores in the method name as compared to the one underscore for the method that uses a <b>BSTR</b> as a parameter.
     * @param {Pointer<Guid>} MediaFormatTypeGuid <b>REFCLSID</b> that specifies the media format type.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-put__mediaformattype
     */
    put__MediaFormatType(MediaFormatTypeGuid) {
        result := ComCall(20, this, Guid.Ptr, MediaFormatTypeGuid, "HRESULT")
        return result
    }

    /**
     * The get_MediaType method retrieves the DirectShow AM_MEDIA_TYPE structure for the component.
     * @returns {AM_MEDIA_TYPE} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure that will be filled in with the values associated with the current <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd693036(v=vs.85)">ComponentType</a>.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-get_mediatype
     */
    get_MediaType() {
        _MediaType := AM_MEDIA_TYPE()
        result := ComCall(21, this, AM_MEDIA_TYPE.Ptr, _MediaType, "HRESULT")
        return _MediaType
    }

    /**
     * The put_MediaType method sets the DirectShow AM_MEDIA_TYPE structure for the component.
     * @param {Pointer<AM_MEDIA_TYPE>} _MediaType An <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure that specifies the major type, subtype, format, and so on.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-put_mediatype
     */
    put_MediaType(_MediaType) {
        result := ComCall(22, this, AM_MEDIA_TYPE.Ptr, _MediaType, "HRESULT")
        return result
    }

    /**
     * The Clone method creates a new copy of this component type.
     * @returns {IComponentType} Address of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponenttype">IComponentType</a> interface pointer that will be set to the returned interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-clone
     */
    Clone() {
        result := ComCall(23, this, "ptr*", &NewCT := 0, "HRESULT")
        return IComponentType(NewCT)
    }

    Query(iid) {
        if (IComponentType.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Category := CallbackCreate(GetMethod(implObj, "get_Category"), flags, 2)
        this.vtbl.put_Category := CallbackCreate(GetMethod(implObj, "put_Category"), flags, 2)
        this.vtbl.get_MediaMajorType := CallbackCreate(GetMethod(implObj, "get_MediaMajorType"), flags, 2)
        this.vtbl.put_MediaMajorType := CallbackCreate(GetMethod(implObj, "put_MediaMajorType"), flags, 2)
        this.vtbl.get__MediaMajorType := CallbackCreate(GetMethod(implObj, "get__MediaMajorType"), flags, 2)
        this.vtbl.put__MediaMajorType := CallbackCreate(GetMethod(implObj, "put__MediaMajorType"), flags, 2)
        this.vtbl.get_MediaSubType := CallbackCreate(GetMethod(implObj, "get_MediaSubType"), flags, 2)
        this.vtbl.put_MediaSubType := CallbackCreate(GetMethod(implObj, "put_MediaSubType"), flags, 2)
        this.vtbl.get__MediaSubType := CallbackCreate(GetMethod(implObj, "get__MediaSubType"), flags, 2)
        this.vtbl.put__MediaSubType := CallbackCreate(GetMethod(implObj, "put__MediaSubType"), flags, 2)
        this.vtbl.get_MediaFormatType := CallbackCreate(GetMethod(implObj, "get_MediaFormatType"), flags, 2)
        this.vtbl.put_MediaFormatType := CallbackCreate(GetMethod(implObj, "put_MediaFormatType"), flags, 2)
        this.vtbl.get__MediaFormatType := CallbackCreate(GetMethod(implObj, "get__MediaFormatType"), flags, 2)
        this.vtbl.put__MediaFormatType := CallbackCreate(GetMethod(implObj, "put__MediaFormatType"), flags, 2)
        this.vtbl.get_MediaType := CallbackCreate(GetMethod(implObj, "get_MediaType"), flags, 2)
        this.vtbl.put_MediaType := CallbackCreate(GetMethod(implObj, "put_MediaType"), flags, 2)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Category)
        CallbackFree(this.vtbl.put_Category)
        CallbackFree(this.vtbl.get_MediaMajorType)
        CallbackFree(this.vtbl.put_MediaMajorType)
        CallbackFree(this.vtbl.get__MediaMajorType)
        CallbackFree(this.vtbl.put__MediaMajorType)
        CallbackFree(this.vtbl.get_MediaSubType)
        CallbackFree(this.vtbl.put_MediaSubType)
        CallbackFree(this.vtbl.get__MediaSubType)
        CallbackFree(this.vtbl.put__MediaSubType)
        CallbackFree(this.vtbl.get_MediaFormatType)
        CallbackFree(this.vtbl.put_MediaFormatType)
        CallbackFree(this.vtbl.get__MediaFormatType)
        CallbackFree(this.vtbl.put__MediaFormatType)
        CallbackFree(this.vtbl.get_MediaType)
        CallbackFree(this.vtbl.put_MediaType)
        CallbackFree(this.vtbl.Clone)
    }
}
