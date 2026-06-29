#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AUDIT_PARAM.ahk" { AUDIT_PARAM }

/**
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct AUDIT_PARAMS {
    #StructPack 8

    Length : UInt32

    Flags : UInt32

    Count : UInt16

    Parameters : AUDIT_PARAM.Ptr

}
