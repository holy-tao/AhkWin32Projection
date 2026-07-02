#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PKDEFERRED_ROUTINE.ahk" { PKDEFERRED_ROUTINE }
#Import ".\PDRIVER_CPE_EXCEPTION_CALLBACK.ahk" { PDRIVER_CPE_EXCEPTION_CALLBACK }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct CPE_DRIVER_INFO {
    #StructPack 8

    ExceptionCallback : PDRIVER_CPE_EXCEPTION_CALLBACK

    DpcCallback : PKDEFERRED_ROUTINE

    DeviceContext : IntPtr

}
