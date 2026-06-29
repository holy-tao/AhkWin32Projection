#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct VM_PATCH_INFO {
    #StructPack 8

    dwNumEntries : UInt32

    pVmNames : PWSTR.Ptr

}
