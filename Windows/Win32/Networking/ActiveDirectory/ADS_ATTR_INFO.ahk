#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ADSTYPE.ahk" { ADSTYPE }
#Import ".\ADSVALUE.ahk" { ADSVALUE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Used to contain one or more attribute values for use with the IDirectoryObject::CreateDSObject, IDirectoryObject::GetObjectAttributes, or IDirectoryObject::SetObjectAttributes method.
 * @remarks
 * In ADSI, attributes and properties are used interchangeably. Set attributes, when creating a directory service object, using the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-idirectoryobject-createdsobject">IDirectoryObject::CreateDSObject</a> method. The  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-idirectoryobject">IDirectoryObject</a> interface also supports the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-idirectoryobject-getobjectattributes">IDirectoryObject::GetObjectAttributes</a> and  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-idirectoryobject-setobjectattributes">IDirectoryObject::SetObjectAttributes</a> methods for retrieving and modifying the attributes of the object in a directory.
 * 
 * Memory for the array of <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-adsvalue">ADSVALUE</a> structures is not allocated with this structure.
 * 
 * The value of the <b>dwControlCode</b> member is ignored when the structure is used as an OUT parameter.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_attr_info
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct ADS_ATTR_INFO {
    #StructPack 8

    /**
     * The null-terminated Unicode string that contains the attribute name.
     */
    pszAttrName : PWSTR

    /**
     * Contains one of the <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-attribute-modification-types">ADSI Attribute Modification Types</a> values that determines the type of operation to be performed on the attribute value.
     */
    dwControlCode : UInt32

    /**
     * A value from the  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-adstypeenum">ADSTYPEENUM</a> enumeration that indicates the data type of the attribute.
     */
    dwADsType : ADSTYPE

    /**
     * Pointer to an array of  <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-adsvalue">ADSVALUE</a> structures that contain values for the attribute.
     */
    pADsValues : ADSVALUE.Ptr

    /**
     * Size of the <b>pADsValues</b> array.
     */
    dwNumValues : UInt32

}
