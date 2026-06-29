#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }
#Import "..\..\Win32\Security\SECURITY_DESCRIPTOR.ahk" { SECURITY_DESCRIPTOR }
#Import "..\..\Win32\Security\SECURITY_QUALITY_OF_SERVICE.ahk" { SECURITY_QUALITY_OF_SERVICE }
#Import "..\..\Win32\Foundation\OBJECT_ATTRIBUTE_FLAGS.ahk" { OBJECT_ATTRIBUTE_FLAGS }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct OBJECT_ATTRIBUTES {
    #StructPack 8

    Length : UInt32

    RootDirectory : HANDLE

    ObjectName : UNICODE_STRING.Ptr

    Attributes : OBJECT_ATTRIBUTE_FLAGS

    SecurityDescriptor : SECURITY_DESCRIPTOR.Ptr

    SecurityQualityOfService : SECURITY_QUALITY_OF_SERVICE.Ptr

}
