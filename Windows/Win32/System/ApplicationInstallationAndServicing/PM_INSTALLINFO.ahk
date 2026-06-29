#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct PM_INSTALLINFO {
    #StructPack 8

    ProductID : Guid

    PackagePath : BSTR

    InstanceID : Guid

    pbLicense : IntPtr

    cbLicense : UInt32

    IsUninstallDisabled : BOOL

    DeploymentOptions : UInt32

    OfferID : Guid

    MarketplaceAppVersion : BSTR

}
