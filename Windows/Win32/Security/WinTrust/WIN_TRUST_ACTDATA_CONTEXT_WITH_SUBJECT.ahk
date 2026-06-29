#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct WIN_TRUST_ACTDATA_CONTEXT_WITH_SUBJECT {
    #StructPack 8

    hClientToken : HANDLE

    SubjectType : Guid.Ptr

    Subject : IntPtr

}
