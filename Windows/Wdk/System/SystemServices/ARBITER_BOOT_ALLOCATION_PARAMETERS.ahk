#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\System\Kernel\LIST_ENTRY.ahk" { LIST_ENTRY }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct ARBITER_BOOT_ALLOCATION_PARAMETERS {
    #StructPack 8

    ArbitrationList : LIST_ENTRY.Ptr

}
