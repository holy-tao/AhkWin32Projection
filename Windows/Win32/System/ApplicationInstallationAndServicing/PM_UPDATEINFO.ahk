#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct PM_UPDATEINFO {
    #StructPack 8

    ProductID : Guid

    PackagePath : BSTR

    InstanceID : Guid

    pbLicense : IntPtr

    cbLicense : UInt32

    MarketplaceAppVersion : BSTR

    DeploymentOptions : UInt32

}
