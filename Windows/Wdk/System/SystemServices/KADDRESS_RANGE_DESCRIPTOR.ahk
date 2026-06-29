#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KADDRESS_RANGE.ahk" { KADDRESS_RANGE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KADDRESS_RANGE_DESCRIPTOR {
    #StructPack 8

    AddressRanges : KADDRESS_RANGE.Ptr

    AddressRangeCount : IntPtr

}
