#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct WIN_TRUST_ACTDATA_SUBJECT_ONLY {
    #StructPack 8

    SubjectType : Guid.Ptr

    Subject : IntPtr

}
