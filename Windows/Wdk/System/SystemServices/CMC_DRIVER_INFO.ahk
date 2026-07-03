#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PKDEFERRED_ROUTINE.ahk" { PKDEFERRED_ROUTINE }
#Import ".\PDRIVER_CMC_EXCEPTION_CALLBACK.ahk" { PDRIVER_CMC_EXCEPTION_CALLBACK }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct CMC_DRIVER_INFO {
    #StructPack 8

    ExceptionCallback : PDRIVER_CMC_EXCEPTION_CALLBACK

    DpcCallback : PKDEFERRED_ROUTINE

    DeviceContext : IntPtr

}
