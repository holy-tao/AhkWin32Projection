#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\MediaFoundation\AM_MEDIA_TYPE.ahk
#Include .\IComponentType.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IComponentType interface is implemented on ComponentType objects, and contains methods for setting and retrieving various properties for a Component.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IComponentType)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-icomponenttype
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IComponentType extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComponentType
     * @type {Guid}
     */
    static IID => Guid("{6a340dc0-0311-11d3-9d8e-00c04f72d980}")

    /**
     * The class identifier for ComponentType
     * @type {Guid}
     */
    static CLSID => Guid("{823535a0-0318-11d3-9d8e-00c04f72d980}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Category", "put_Category", "get_MediaMajorType", "put_MediaMajorType", "get__MediaMajorType", "put__MediaMajorType", "get_MediaSubType", "put_MediaSubType", "get__MediaSubType", "put__MediaSubType", "get_MediaFormatType", "put_MediaFormatType", "get__MediaFormatType", "put__MediaFormatType", "get_MediaType", "put_MediaType", "Clone"]

    /**
     * @type {Integer} 
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
     * @returns {Integer} Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/componentcategory">ComponentCategory</a> data type that will receive the category.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponenttype-get_category
     */
    get_Category() {
        result := ComCall(7, this, "int*", &Category := 0, "HRESULT")
        return Category
    }

    /**
     * The put_Category method sets the component category.
     * @param {Integer} Category A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/componentcategory">ComponentCategory</a> value that specifies the new category for this component type.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponenttype-put_category
     */
    put_Category(Category) {
        result := ComCall(8, this, "int", Category, "HRESULT")
        return result
    }

    /**
     * The get_MediaMajorType method retrieves the DirectShow media major type as a BSTR.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that will receive the GUID.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponenttype-get_mediamajortype
     */
    get_MediaMajorType() {
        MediaMajorType := BSTR()
        result := ComCall(9, this, "ptr", MediaMajorType, "HRESULT")
        return MediaMajorType
    }

    /**
     * The put_MediaMajorType method sets the DirectShow media major type.
     * @param {BSTR} MediaMajorType <b>BSTR</b> that specifies the GUID.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponenttype-put_mediamajortype
     */
    put_MediaMajorType(MediaMajorType) {
        MediaMajorType := MediaMajorType is String ? BSTR.Alloc(MediaMajorType).Value : MediaMajorType

        result := ComCall(10, this, "ptr", MediaMajorType, "HRESULT")
        return result
    }

    /**
     * The get__MediaMajorType method retrieves the DirectShow media format type as a GUID.
     * @returns {Guid} Pointer to a GUID that will receive the major type.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponenttype-get__mediamajortype
     */
    get__MediaMajorType() {
        MediaMajorTypeGuid := Guid()
        result := ComCall(11, this, "ptr", MediaMajorTypeGuid, "HRESULT")
        return MediaMajorTypeGuid
    }

    /**
     * The put__MediaMajorType method sets the DirectShow media major type.
     * @param {Pointer<Guid>} MediaMajorTypeGuid <b>REFCLSID</b> that specifies the media major type.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponenttype-put__mediamajortype
     */
    put__MediaMajorType(MediaMajorTypeGuid) {
        result := ComCall(12, this, "ptr", MediaMajorTypeGuid, "HRESULT")
        return result
    }

    /**
     * The get_MediaSubType method retrieves the DirectShow media subtype as a BSTR.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that will receive the GUID.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponenttype-get_mediasubtype
     */
    get_MediaSubType() {
        MediaSubType := BSTR()
        result := ComCall(13, this, "ptr", MediaSubType, "HRESULT")
        return MediaSubType
    }

    /**
     * The put_MediaSubType method sets the DirectShow media subtype.
     * @param {BSTR} MediaSubType <b>BSTR</b> that specifies the GUID.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponenttype-put_mediasubtype
     */
    put_MediaSubType(MediaSubType) {
        MediaSubType := MediaSubType is String ? BSTR.Alloc(MediaSubType).Value : MediaSubType

        result := ComCall(14, this, "ptr", MediaSubType, "HRESULT")
        return result
    }

    /**
     * The get__MediaSubType method retrieves the DirectShow media subtype as a GUID.
     * @returns {Guid} Pointer to a GUID that will receive the major type.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponenttype-get__mediasubtype
     */
    get__MediaSubType() {
        MediaSubTypeGuid := Guid()
        result := ComCall(15, this, "ptr", MediaSubTypeGuid, "HRESULT")
        return MediaSubTypeGuid
    }

    /**
     * The put__MediaSubType method sets the DirectShow media subtype.
     * @param {Pointer<Guid>} MediaSubTypeGuid <b>REFCLSID</b> that specifies the media sub type.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponenttype-put__mediasubtype
     */
    put__MediaSubType(MediaSubTypeGuid) {
        result := ComCall(16, this, "ptr", MediaSubTypeGuid, "HRESULT")
        return result
    }

    /**
     * The get_MediaFormatType method retrieves the DirectShow media format type as a BSTR.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that will receive the GUID.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponenttype-get_mediaformattype
     */
    get_MediaFormatType() {
        MediaFormatType := BSTR()
        result := ComCall(17, this, "ptr", MediaFormatType, "HRESULT")
        return MediaFormatType
    }

    /**
     * The put_MediaFormatType method sets the DirectShow media format type.
     * @param {BSTR} MediaFormatType <b>BSTR</b> that specifies the GUID.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponenttype-put_mediaformattype
     */
    put_MediaFormatType(MediaFormatType) {
        MediaFormatType := MediaFormatType is String ? BSTR.Alloc(MediaFormatType).Value : MediaFormatType

        result := ComCall(18, this, "ptr", MediaFormatType, "HRESULT")
        return result
    }

    /**
     * The get__MediaFormatType method retrieves the DirectShow media format type as a GUID.
     * @returns {Guid} Pointer to a GUID that will receive the format type.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponenttype-get__mediaformattype
     */
    get__MediaFormatType() {
        MediaFormatTypeGuid := Guid()
        result := ComCall(19, this, "ptr", MediaFormatTypeGuid, "HRESULT")
        return MediaFormatTypeGuid
    }

    /**
     * The put__MediaFormatType method sets the DirectShow media format type.
     * @param {Pointer<Guid>} MediaFormatTypeGuid <b>REFCLSID</b> that specifies the media format type.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponenttype-put__mediaformattype
     */
    put__MediaFormatType(MediaFormatTypeGuid) {
        result := ComCall(20, this, "ptr", MediaFormatTypeGuid, "HRESULT")
        return result
    }

    /**
     * The get_MediaType method retrieves the DirectShow AM_MEDIA_TYPE structure for the component.
     * @returns {AM_MEDIA_TYPE} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure that will be filled in with the values associated with the current <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd693036(v=vs.85)">ComponentType</a>.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponenttype-get_mediatype
     */
    get_MediaType() {
        MediaType := AM_MEDIA_TYPE()
        result := ComCall(21, this, "ptr", MediaType, "HRESULT")
        return MediaType
    }

    /**
     * The put_MediaType method sets the DirectShow AM_MEDIA_TYPE structure for the component.
     * @param {Pointer<AM_MEDIA_TYPE>} MediaType An <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure that specifies the major type, subtype, format, and so on.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponenttype-put_mediatype
     */
    put_MediaType(MediaType) {
        result := ComCall(22, this, "ptr", MediaType, "HRESULT")
        return result
    }

    /**
     * The Clone method creates a new copy of this component type.
     * @returns {IComponentType} Address of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponenttype">IComponentType</a> interface pointer that will be set to the returned interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-icomponenttype-clone
     */
    Clone() {
        result := ComCall(23, this, "ptr*", &NewCT := 0, "HRESULT")
        return IComponentType(NewCT)
    }
}
