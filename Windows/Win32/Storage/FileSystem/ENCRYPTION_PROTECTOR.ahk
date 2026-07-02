#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Security\SID.ahk" { SID }

/**
 * Under WIP policy, includes a single identity that a file is protected to.
 * @see https://learn.microsoft.com/windows/win32/DevNotes/encryption_protector-structure
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct ENCRYPTION_PROTECTOR {
    #StructPack 8

    cbTotalLength : UInt32

    pUserSid : SID.Ptr

    lpProtectorDescriptor : PWSTR

}
