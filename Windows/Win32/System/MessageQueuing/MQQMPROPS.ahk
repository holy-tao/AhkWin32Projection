#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct MQQMPROPS {
    #StructPack 8

    cProp : UInt32

    aPropID : IntPtr

    aPropVar : PROPVARIANT.Ptr

    aStatus : IntPtr

}
