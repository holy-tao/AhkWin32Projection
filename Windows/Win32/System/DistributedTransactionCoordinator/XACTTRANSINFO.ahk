#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BOID.ahk" { BOID }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct XACTTRANSINFO {
    #StructPack 4

    uow : BOID

    isoLevel : Int32

    isoFlags : UInt32

    grfTCSupported : UInt32

    grfRMSupported : UInt32

    grfTCSupportedRetaining : UInt32

    grfRMSupportedRetaining : UInt32

}
