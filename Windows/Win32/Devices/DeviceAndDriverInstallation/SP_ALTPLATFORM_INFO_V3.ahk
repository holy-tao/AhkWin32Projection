#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @architecture X64, Arm64
 */
export default struct SP_ALTPLATFORM_INFO_V3 {
    #StructPack 4

    cbSize : UInt32 := this.Size

    Platform : UInt32

    MajorVersion : UInt32

    MinorVersion : UInt32

    ProcessorArchitecture : UInt16

    Reserved : UInt16

    FirstValidatedMajorVersion : UInt32

    FirstValidatedMinorVersion : UInt32

    ProductType : Int8

    SuiteMask : UInt16

    BuildNumber : UInt32

    static __New() {
        DefineProp(this.Prototype, 'Flags', { type: UInt16, offset: 18 })
        this.DeleteProp("__New")
    }
}
