#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_REGION {
    #StructPack 8

    Version : UInt32

    Size : UInt32

    Flags : UInt32

    NfitHandle : UInt32

    LogicalDeviceGuid : Guid

    AddressRangeType : Guid

    AssociatedId : UInt32

    Length : Int64

    StartingDPA : Int64

    BaseSPA : Int64

    SPAOffset : Int64

    RegionOffset : Int64

}
