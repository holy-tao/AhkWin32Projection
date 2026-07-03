#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct IUNKNOWN_LIST {
    #StructPack 8

    lpLink : IUNKNOWN_LIST.Ptr

    lpGuid : Guid.Ptr

    lpIUnknown : IUnknown

}
