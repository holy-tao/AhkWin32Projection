#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\OUTPUTDUPL_CONTEXT_DEBUG_STATUS.ahk" { OUTPUTDUPL_CONTEXT_DEBUG_STATUS }
#Import "..\..\..\Win32\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct OUTPUTDUPL_CONTEXT_DEBUG_INFO {
    #StructPack 8

    Status : OUTPUTDUPL_CONTEXT_DEBUG_STATUS

    ProcessID : HANDLE

    AccumulatedPresents : UInt32

    LastPresentTime : Int64

    LastMouseTime : Int64

    ProcessName : CHAR[16]

}
