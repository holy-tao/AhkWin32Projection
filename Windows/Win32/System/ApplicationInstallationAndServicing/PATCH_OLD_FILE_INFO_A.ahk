#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PATCH_RETAIN_RANGE.ahk" { PATCH_RETAIN_RANGE }
#Import ".\PATCH_IGNORE_RANGE.ahk" { PATCH_IGNORE_RANGE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @charset ANSI
 */
export default struct PATCH_OLD_FILE_INFO_A {
    #StructPack 8

    SizeOfThisStruct : UInt32

    OldFileName : PSTR

    IgnoreRangeCount : UInt32

    IgnoreRangeArray : PATCH_IGNORE_RANGE.Ptr

    RetainRangeCount : UInt32

    RetainRangeArray : PATCH_RETAIN_RANGE.Ptr

}
