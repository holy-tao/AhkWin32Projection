#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RTL_SPLAY_LINKS.ahk" { RTL_SPLAY_LINKS }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct TUNNEL {
    #StructPack 8

    Mutex : IntPtr

    Cache : RTL_SPLAY_LINKS.Ptr

    TimerQueue : IntPtr

    NumEntries : UInt16

}
