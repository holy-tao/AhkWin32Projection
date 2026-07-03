#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct MQMSGPROPS {
    #StructPack 8

    cProp : UInt32

    aPropID : IntPtr

    aPropVar : PROPVARIANT.Ptr

    aStatus : IntPtr

}
