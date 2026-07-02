#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PPTM_DEVICE_ENABLE.ahk" { PPTM_DEVICE_ENABLE }
#Import ".\PPTM_DEVICE_QUERY_GRANULARITY.ahk" { PPTM_DEVICE_QUERY_GRANULARITY }
#Import ".\PPTM_DEVICE_QUERY_TIME_SOURCE.ahk" { PPTM_DEVICE_QUERY_TIME_SOURCE }
#Import ".\PPTM_DEVICE_DISABLE.ahk" { PPTM_DEVICE_DISABLE }
#Import ".\PINTERFACE_DEREFERENCE.ahk" { PINTERFACE_DEREFERENCE }
#Import ".\PINTERFACE_REFERENCE.ahk" { PINTERFACE_REFERENCE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PTM_CONTROL_INTERFACE {
    #StructPack 8

    Size : UInt16

    Version : UInt16

    Context : IntPtr

    InterfaceReference : PINTERFACE_REFERENCE

    InterfaceDereference : PINTERFACE_DEREFERENCE

    QueryGranularity : PPTM_DEVICE_QUERY_GRANULARITY

    QueryTimeSource : PPTM_DEVICE_QUERY_TIME_SOURCE

    Enable : PPTM_DEVICE_ENABLE

    Disable : PPTM_DEVICE_DISABLE

}
