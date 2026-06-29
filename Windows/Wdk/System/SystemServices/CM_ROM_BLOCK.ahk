#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct CM_ROM_BLOCK {
    #StructPack 4

    Address : UInt32

    Size : UInt32

}
