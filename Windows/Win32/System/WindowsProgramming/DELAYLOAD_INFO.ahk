#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DELAYLOAD_PROC_DESCRIPTOR.ahk" { DELAYLOAD_PROC_DESCRIPTOR }
#Import ".\IMAGE_THUNK_DATA64.ahk" { IMAGE_THUNK_DATA64 }
#Import ".\IMAGE_DELAYLOAD_DESCRIPTOR.ahk" { IMAGE_DELAYLOAD_DESCRIPTOR }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @architecture X64, Arm64
 */
export default struct DELAYLOAD_INFO {
    #StructPack 8

    Size : UInt32

    DelayloadDescriptor : IMAGE_DELAYLOAD_DESCRIPTOR.Ptr

    ThunkAddress : IMAGE_THUNK_DATA64.Ptr

    TargetDllName : PSTR

    TargetApiDescriptor : DELAYLOAD_PROC_DESCRIPTOR

    TargetModuleBase : IntPtr

    Unused : IntPtr

    LastError : UInt32

}
