#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct CLEANLOCALSTORAGE {
    #StructPack 8

    pInterface : IUnknown

    pStorage : IntPtr

    flags : UInt32

}
