#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class ADS_ATTR_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The null-terminated Unicode string that contains the attribute name.
     * @type {PWSTR}
     */
    pszAttrName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Contains one of the <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-attribute-modification-types">ADSI Attribute Modification Types</a> values that determines the type of operation to be performed on the attribute value.
     * @type {Integer}
     */
    dwControlCode {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A value from the  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-adstypeenum">ADSTYPEENUM</a> enumeration that indicates the data type of the attribute.
     * @type {Integer}
     */
    dwADsType {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Pointer to an array of  <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-adsvalue">ADSVALUE</a> structures that contain values for the attribute.
     * @type {Pointer<ADSVALUE>}
     */
    pADsValues {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Size of the <b>pADsValues</b> array.
     * @type {Integer}
     */
    dwNumValues {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
