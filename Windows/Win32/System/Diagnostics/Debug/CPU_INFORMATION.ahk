#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct CPU_INFORMATION {
    #StructPack 8


    struct _X86CpuInfo {
        VendorId : UInt32[3]

        VersionInformation : UInt32

        FeatureInformation : UInt32

        AMDExtendedCpuFeatures : UInt32

    }

    struct _OtherCpuInfo {
        ProcessorFeatures : Int64[2]

    }

    X86CpuInfo : CPU_INFORMATION._X86CpuInfo

    static __New() {
        DefineProp(this.Prototype, 'OtherCpuInfo', { type: CPU_INFORMATION._OtherCpuInfo, offset: 0 })
        this.DeleteProp("__New")
    }
}
