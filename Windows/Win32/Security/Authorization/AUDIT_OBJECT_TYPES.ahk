#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AUDIT_OBJECT_TYPE.ahk" { AUDIT_OBJECT_TYPE }

/**
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct AUDIT_OBJECT_TYPES {
    #StructPack 8

    Count : UInt16

    Flags : UInt16

    pObjectTypes : AUDIT_OBJECT_TYPE.Ptr

}
