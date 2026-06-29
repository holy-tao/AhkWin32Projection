#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\APPLICATIONTYPE.ahk" { APPLICATIONTYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct OLE_TM_CONFIG_PARAMS_V2 {
    #StructPack 4

    dwVersion : UInt32

    dwcConcurrencyHint : UInt32

    applicationType : APPLICATIONTYPE

    clusterResourceId : Guid

}
