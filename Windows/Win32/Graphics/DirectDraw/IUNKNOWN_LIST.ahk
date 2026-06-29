#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct IUNKNOWN_LIST {
    #StructPack 8

    lpLink : IUNKNOWN_LIST.Ptr

    lpGuid : Guid.Ptr

    lpIUnknown : IUnknown

}
