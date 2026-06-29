#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AUTHZ_SECURITY_ATTRIBUTE_V1.ahk" { AUTHZ_SECURITY_ATTRIBUTE_V1 }

/**
 * Specifies one or more security attributes and values.
 * @see https://learn.microsoft.com/windows/win32/api/authz/ns-authz-authz_security_attributes_information
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct AUTHZ_SECURITY_ATTRIBUTES_INFORMATION {
    #StructPack 8


    struct _Attribute {
        pAttributeV1 : AUTHZ_SECURITY_ATTRIBUTE_V1.Ptr

    }

    /**
     * The  version of this structure. Currently the only value supported is 1.
     */
    Version : UInt16

    /**
     * Reserved. Do not use.
     */
    Reserved : UInt16

    /**
     * The number of attributes specified by the <b>Attribute</b> member.
     */
    AttributeCount : UInt32

    Attribute : AUTHZ_SECURITY_ATTRIBUTES_INFORMATION._Attribute

}
