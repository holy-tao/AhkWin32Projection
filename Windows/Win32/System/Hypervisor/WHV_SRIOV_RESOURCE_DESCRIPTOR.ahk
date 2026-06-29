#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LUID.ahk" { LUID }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_SRIOV_RESOURCE_DESCRIPTOR {
    #StructPack 4

    PnpInstanceId : WCHAR[200]

    VirtualFunctionId : LUID

    VirtualFunctionIndex : UInt16

    Reserved : UInt16

}
