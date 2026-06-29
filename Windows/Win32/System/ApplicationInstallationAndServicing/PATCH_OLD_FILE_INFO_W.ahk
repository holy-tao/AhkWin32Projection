#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PATCH_RETAIN_RANGE.ahk" { PATCH_RETAIN_RANGE }
#Import ".\PATCH_IGNORE_RANGE.ahk" { PATCH_IGNORE_RANGE }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @charset Unicode
 */
export default struct PATCH_OLD_FILE_INFO_W {
    #StructPack 8

    SizeOfThisStruct : UInt32

    OldFileName : PWSTR

    IgnoreRangeCount : UInt32

    IgnoreRangeArray : PATCH_IGNORE_RANGE.Ptr

    RetainRangeCount : UInt32

    RetainRangeArray : PATCH_RETAIN_RANGE.Ptr

}
