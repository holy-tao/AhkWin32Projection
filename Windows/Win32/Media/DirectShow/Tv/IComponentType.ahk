#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<Integer>} Category 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-get_category
     */
    get_Category(Category) {
        result := ComCall(7, this, "int*", Category, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Category 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-put_category
     */
    put_Category(Category) {
        result := ComCall(8, this, "int", Category, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} MediaMajorType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-get_mediamajortype
     */
    get_MediaMajorType(MediaMajorType) {
        result := ComCall(9, this, "ptr", MediaMajorType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} MediaMajorType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-put_mediamajortype
     */
    put_MediaMajorType(MediaMajorType) {
        MediaMajorType := MediaMajorType is String ? BSTR.Alloc(MediaMajorType).Value : MediaMajorType

        result := ComCall(10, this, "ptr", MediaMajorType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} MediaMajorTypeGuid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-get__mediamajortype
     */
    get__MediaMajorType(MediaMajorTypeGuid) {
        result := ComCall(11, this, "ptr", MediaMajorTypeGuid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} MediaMajorTypeGuid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-put__mediamajortype
     */
    put__MediaMajorType(MediaMajorTypeGuid) {
        result := ComCall(12, this, "ptr", MediaMajorTypeGuid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} MediaSubType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-get_mediasubtype
     */
    get_MediaSubType(MediaSubType) {
        result := ComCall(13, this, "ptr", MediaSubType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} MediaSubType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-put_mediasubtype
     */
    put_MediaSubType(MediaSubType) {
        MediaSubType := MediaSubType is String ? BSTR.Alloc(MediaSubType).Value : MediaSubType

        result := ComCall(14, this, "ptr", MediaSubType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} MediaSubTypeGuid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-get__mediasubtype
     */
    get__MediaSubType(MediaSubTypeGuid) {
        result := ComCall(15, this, "ptr", MediaSubTypeGuid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} MediaSubTypeGuid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-put__mediasubtype
     */
    put__MediaSubType(MediaSubTypeGuid) {
        result := ComCall(16, this, "ptr", MediaSubTypeGuid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} MediaFormatType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-get_mediaformattype
     */
    get_MediaFormatType(MediaFormatType) {
        result := ComCall(17, this, "ptr", MediaFormatType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} MediaFormatType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-put_mediaformattype
     */
    put_MediaFormatType(MediaFormatType) {
        MediaFormatType := MediaFormatType is String ? BSTR.Alloc(MediaFormatType).Value : MediaFormatType

        result := ComCall(18, this, "ptr", MediaFormatType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} MediaFormatTypeGuid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-get__mediaformattype
     */
    get__MediaFormatType(MediaFormatTypeGuid) {
        result := ComCall(19, this, "ptr", MediaFormatTypeGuid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} MediaFormatTypeGuid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-put__mediaformattype
     */
    put__MediaFormatType(MediaFormatTypeGuid) {
        result := ComCall(20, this, "ptr", MediaFormatTypeGuid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<AM_MEDIA_TYPE>} MediaType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-get_mediatype
     */
    get_MediaType(MediaType) {
        result := ComCall(21, this, "ptr", MediaType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<AM_MEDIA_TYPE>} MediaType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-put_mediatype
     */
    put_MediaType(MediaType) {
        result := ComCall(22, this, "ptr", MediaType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IComponentType>} NewCT 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-icomponenttype-clone
     */
    Clone(NewCT) {
        result := ComCall(23, this, "ptr*", NewCT, "HRESULT")
        return result
    }
}
