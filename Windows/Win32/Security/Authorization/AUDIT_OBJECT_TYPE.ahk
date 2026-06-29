#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct AUDIT_OBJECT_TYPE {
    #StructPack 4

    ObjectType : Guid

    Flags : UInt16

    Level : UInt16

    AccessMask : UInt32

}
