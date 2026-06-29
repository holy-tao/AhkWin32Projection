#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct AUDIORESOURCEMANAGEMENT_RESOURCEGROUP {
    #StructPack 4

    ResourceGroupAcquired : BOOL

    ResourceGroupName : WCHAR[256]

}
