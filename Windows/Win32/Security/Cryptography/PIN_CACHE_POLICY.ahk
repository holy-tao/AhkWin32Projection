#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PIN_CACHE_POLICY_TYPE.ahk" { PIN_CACHE_POLICY_TYPE }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PIN_CACHE_POLICY {
    #StructPack 4

    dwVersion : UInt32

    PinCachePolicyType : PIN_CACHE_POLICY_TYPE

    dwPinCachePolicyInfo : UInt32

}
