#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PATCH_RETAIN_RANGE.ahk" { PATCH_RETAIN_RANGE }
#Import ".\PATCH_IGNORE_RANGE.ahk" { PATCH_IGNORE_RANGE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct PATCH_OLD_FILE_INFO {
    #StructPack 8

    SizeOfThisStruct : UInt32

    OldFileNameA : PSTR

    IgnoreRangeCount : UInt32

    IgnoreRangeArray : PATCH_IGNORE_RANGE.Ptr

    RetainRangeCount : UInt32

    RetainRangeArray : PATCH_RETAIN_RANGE.Ptr

    static __New() {
        DefineProp(this.Prototype, 'OldFileNameW', { type: PWSTR, offset: 8 })
        DefineProp(this.Prototype, 'OldFileHandle', { type: HANDLE, offset: 8 })
        this.DeleteProp("__New")
    }
}
