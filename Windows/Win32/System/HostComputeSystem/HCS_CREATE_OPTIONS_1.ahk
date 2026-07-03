#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Security\SECURITY_DESCRIPTOR.ahk" { SECURITY_DESCRIPTOR }
#Import ".\HCS_CREATE_OPTIONS.ahk" { HCS_CREATE_OPTIONS }
#Import ".\HCS_EVENT_OPTIONS.ahk" { HCS_EVENT_OPTIONS }

/**
 * @namespace Windows.Win32.System.HostComputeSystem
 */
export default struct HCS_CREATE_OPTIONS_1 {
    #StructPack 8

    Version : HCS_CREATE_OPTIONS

    UserToken : HANDLE

    SecurityDescriptor : SECURITY_DESCRIPTOR.Ptr

    CallbackOptions : HCS_EVENT_OPTIONS

    CallbackContext : IntPtr

    Callback : IntPtr

}
