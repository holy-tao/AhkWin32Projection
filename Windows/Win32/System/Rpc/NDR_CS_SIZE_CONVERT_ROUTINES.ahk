#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CS_TYPE_LOCAL_SIZE_ROUTINE.ahk" { CS_TYPE_LOCAL_SIZE_ROUTINE }
#Import ".\CS_TYPE_FROM_NETCS_ROUTINE.ahk" { CS_TYPE_FROM_NETCS_ROUTINE }
#Import ".\CS_TYPE_NET_SIZE_ROUTINE.ahk" { CS_TYPE_NET_SIZE_ROUTINE }
#Import ".\CS_TYPE_TO_NETCS_ROUTINE.ahk" { CS_TYPE_TO_NETCS_ROUTINE }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR_CS_SIZE_CONVERT_ROUTINES {
    #StructPack 8

    pfnNetSize : CS_TYPE_NET_SIZE_ROUTINE

    pfnToNetCs : CS_TYPE_TO_NETCS_ROUTINE

    pfnLocalSize : CS_TYPE_LOCAL_SIZE_ROUTINE

    pfnFromNetCs : CS_TYPE_FROM_NETCS_ROUTINE

}
