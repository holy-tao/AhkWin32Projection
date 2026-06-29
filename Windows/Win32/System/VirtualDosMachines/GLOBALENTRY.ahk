#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.VirtualDosMachines
 */
export default struct GLOBALENTRY {
    #StructPack 8

    dwSize : UInt32

    dwAddress : UInt32

    dwBlockSize : UInt32

    hBlock : HANDLE

    wcLock : UInt16

    wcPageLock : UInt16

    wFlags : UInt16

    wHeapPresent : BOOL

    hOwner : HANDLE

    wType : UInt16

    wData : UInt16

    dwNext : UInt32

    dwNextAlt : UInt32

}
