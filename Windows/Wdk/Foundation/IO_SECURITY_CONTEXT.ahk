#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Win32\Security\SECURITY_QUALITY_OF_SERVICE.ahk" { SECURITY_QUALITY_OF_SERVICE }
#Import ".\ACCESS_STATE.ahk" { ACCESS_STATE }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct IO_SECURITY_CONTEXT {
    #StructPack 8

    SecurityQos : SECURITY_QUALITY_OF_SERVICE.Ptr

    AccessState : ACCESS_STATE.Ptr

    DesiredAccess : UInt32

    FullCreateOptions : UInt32

}
