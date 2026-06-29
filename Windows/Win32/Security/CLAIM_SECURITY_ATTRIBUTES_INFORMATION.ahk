#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLAIM_SECURITY_ATTRIBUTE_V1.ahk" { CLAIM_SECURITY_ATTRIBUTE_V1 }

/**
 * Defines the security attributes for the claim.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-claim_security_attributes_information
 * @namespace Windows.Win32.Security
 */
export default struct CLAIM_SECURITY_ATTRIBUTES_INFORMATION {
    #StructPack 8


    struct _Attribute {
        pAttributeV1 : CLAIM_SECURITY_ATTRIBUTE_V1.Ptr

    }

    /**
     * The version of the security attribute. This must be CLAIM_SECURITY_ATTRIBUTES_INFORMATION_VERSION_V1.
     */
    Version : UInt16

    /**
     * This member is currently reserved and must be zero when setting an attribute and is ignored when getting an attribute.
     */
    Reserved : UInt16

    /**
     * The number of values.
     */
    AttributeCount : UInt32

    /**
     * The actual attribute.
     */
    Attribute : CLAIM_SECURITY_ATTRIBUTES_INFORMATION._Attribute

}
