#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 * @architecture X64, Arm64
 */
export default struct DBIMPLICITSESSION {
    #StructPack 8

    pUnkOuter : IUnknown

    piid : Guid.Ptr

    pSession : IUnknown

}
