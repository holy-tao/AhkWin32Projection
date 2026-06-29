#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NETWORK_OPEN_INTEGRITY_QUALIFIER.ahk" { NETWORK_OPEN_INTEGRITY_QUALIFIER }
#Import ".\NETWORK_OPEN_LOCATION_QUALIFIER.ahk" { NETWORK_OPEN_LOCATION_QUALIFIER }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct NETWORK_OPEN_ECP_CONTEXT_V0 {
    #StructPack 4


    struct _in {
        Location : NETWORK_OPEN_LOCATION_QUALIFIER

        Integrity : NETWORK_OPEN_INTEGRITY_QUALIFIER

    }

    struct _out {
        Location : NETWORK_OPEN_LOCATION_QUALIFIER

        Integrity : NETWORK_OPEN_INTEGRITY_QUALIFIER

    }

    Size : UInt16

    Reserved : UInt16

    in : NETWORK_OPEN_ECP_CONTEXT_V0._in

    out : NETWORK_OPEN_ECP_CONTEXT_V0._out

}
