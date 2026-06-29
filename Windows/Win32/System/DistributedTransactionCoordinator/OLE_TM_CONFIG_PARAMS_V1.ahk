#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct OLE_TM_CONFIG_PARAMS_V1 {
    #StructPack 4

    dwVersion : UInt32

    dwcConcurrencyHint : UInt32

}
