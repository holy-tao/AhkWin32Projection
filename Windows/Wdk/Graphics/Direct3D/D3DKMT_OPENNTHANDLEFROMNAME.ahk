#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\OBJECT_ATTRIBUTES.ahk" { OBJECT_ATTRIBUTES }
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_OPENNTHANDLEFROMNAME {
    #StructPack 8

    dwDesiredAccess : UInt32

    pObjAttrib : OBJECT_ATTRIBUTES.Ptr

    hNtHandle : HANDLE

}
