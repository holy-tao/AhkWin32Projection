#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct REFERENCE {
    #StructPack 8

    SpinLock : IntPtr

    ReferenceCount : UInt16

    Closing : BOOLEAN

}
