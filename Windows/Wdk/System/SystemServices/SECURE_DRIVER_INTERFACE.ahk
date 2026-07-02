#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PSECURE_DRIVER_PROCESS_DEREFERENCE.ahk" { PSECURE_DRIVER_PROCESS_DEREFERENCE }
#Import ".\PSECURE_DRIVER_PROCESS_REFERENCE.ahk" { PSECURE_DRIVER_PROCESS_REFERENCE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct SECURE_DRIVER_INTERFACE {
    #StructPack 8

    InterfaceHeader : IntPtr

    ProcessReference : PSECURE_DRIVER_PROCESS_REFERENCE

    ProcessDereference : PSECURE_DRIVER_PROCESS_DEREFERENCE

    Reserved : UInt32

}
