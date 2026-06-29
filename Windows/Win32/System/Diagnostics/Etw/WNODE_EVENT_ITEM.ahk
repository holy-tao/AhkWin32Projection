#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\WNODE_HEADER.ahk" { WNODE_HEADER }

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct WNODE_EVENT_ITEM {
    #StructPack 8

    WnodeHeader : WNODE_HEADER

}
