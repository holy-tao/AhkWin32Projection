#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Win32\Security\SECURITY_DESCRIPTOR.ahk" { SECURITY_DESCRIPTOR }
#Import "..\..\Win32\Security\SECURITY_QUALITY_OF_SERVICE.ahk" { SECURITY_QUALITY_OF_SERVICE }
#Import "..\..\Win32\Foundation\OBJECT_ATTRIBUTE_FLAGS.ahk" { OBJECT_ATTRIBUTE_FLAGS }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct OBJECT_ATTRIBUTES32 {
    #StructPack 8

    Length : UInt32

    RootDirectory : UInt32

    ObjectName : UInt32

    Attributes : OBJECT_ATTRIBUTE_FLAGS

    SecurityDescriptor : SECURITY_DESCRIPTOR.Ptr

    SecurityQualityOfService : SECURITY_QUALITY_OF_SERVICE.Ptr

}
