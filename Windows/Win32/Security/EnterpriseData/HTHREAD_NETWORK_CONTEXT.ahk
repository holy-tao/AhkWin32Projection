#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Security.EnterpriseData
 */
export default struct HTHREAD_NETWORK_CONTEXT {
    #StructPack 8

    ThreadId : UInt32

    ThreadContext : HANDLE

}
