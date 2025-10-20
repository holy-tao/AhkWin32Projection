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
     * 
     * @param {Pointer<Int32>} Category 
     * @returns {HRESULT} 
     */
    get_Category(Category) {
        result := ComCall(7, this, "int*", Category, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Category 
     * @returns {HRESULT} 
     */
    put_Category(Category) {
        result := ComCall(8, this, "int", Category, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} MediaMajorType 
     * @returns {HRESULT} 
     */
    get_MediaMajorType(MediaMajorType) {
        result := ComCall(9, this, "ptr", MediaMajorType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} MediaMajorType 
     * @returns {HRESULT} 
     */
    put_MediaMajorType(MediaMajorType) {
        MediaMajorType := MediaMajorType is String ? BSTR.Alloc(MediaMajorType).Value : MediaMajorType

        result := ComCall(10, this, "ptr", MediaMajorType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} MediaMajorTypeGuid 
     * @returns {HRESULT} 
     */
    get__MediaMajorType(MediaMajorTypeGuid) {
        result := ComCall(11, this, "ptr", MediaMajorTypeGuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} MediaMajorTypeGuid 
     * @returns {HRESULT} 
     */
    put__MediaMajorType(MediaMajorTypeGuid) {
        result := ComCall(12, this, "ptr", MediaMajorTypeGuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} MediaSubType 
     * @returns {HRESULT} 
     */
    get_MediaSubType(MediaSubType) {
        result := ComCall(13, this, "ptr", MediaSubType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} MediaSubType 
     * @returns {HRESULT} 
     */
    put_MediaSubType(MediaSubType) {
        MediaSubType := MediaSubType is String ? BSTR.Alloc(MediaSubType).Value : MediaSubType

        result := ComCall(14, this, "ptr", MediaSubType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} MediaSubTypeGuid 
     * @returns {HRESULT} 
     */
    get__MediaSubType(MediaSubTypeGuid) {
        result := ComCall(15, this, "ptr", MediaSubTypeGuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} MediaSubTypeGuid 
     * @returns {HRESULT} 
     */
    put__MediaSubType(MediaSubTypeGuid) {
        result := ComCall(16, this, "ptr", MediaSubTypeGuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} MediaFormatType 
     * @returns {HRESULT} 
     */
    get_MediaFormatType(MediaFormatType) {
        result := ComCall(17, this, "ptr", MediaFormatType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} MediaFormatType 
     * @returns {HRESULT} 
     */
    put_MediaFormatType(MediaFormatType) {
        MediaFormatType := MediaFormatType is String ? BSTR.Alloc(MediaFormatType).Value : MediaFormatType

        result := ComCall(18, this, "ptr", MediaFormatType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} MediaFormatTypeGuid 
     * @returns {HRESULT} 
     */
    get__MediaFormatType(MediaFormatTypeGuid) {
        result := ComCall(19, this, "ptr", MediaFormatTypeGuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} MediaFormatTypeGuid 
     * @returns {HRESULT} 
     */
    put__MediaFormatType(MediaFormatTypeGuid) {
        result := ComCall(20, this, "ptr", MediaFormatTypeGuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<AM_MEDIA_TYPE>} MediaType 
     * @returns {HRESULT} 
     */
    get_MediaType(MediaType) {
        result := ComCall(21, this, "ptr", MediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<AM_MEDIA_TYPE>} MediaType 
     * @returns {HRESULT} 
     */
    put_MediaType(MediaType) {
        result := ComCall(22, this, "ptr", MediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IComponentType>} NewCT 
     * @returns {HRESULT} 
     */
    Clone(NewCT) {
        result := ComCall(23, this, "ptr", NewCT, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
