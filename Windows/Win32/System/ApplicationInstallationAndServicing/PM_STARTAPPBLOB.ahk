#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\PM_APPLICATION_STATE.ahk" { PM_APPLICATION_STATE }
#Import ".\PM_APPLICATION_INSTALL_TYPE.ahk" { PM_APPLICATION_INSTALL_TYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct PM_STARTAPPBLOB {
    #StructPack 8

    cbSize : UInt32 := this.Size

    ProductID : Guid

    AppTitle : BSTR

    IconPath : BSTR

    IsUninstallable : BOOL

    AppInstallType : PM_APPLICATION_INSTALL_TYPE

    InstanceID : Guid

    State : PM_APPLICATION_STATE

    IsModern : BOOL

    IsModernLightUp : BOOL

    LightUpSupportMask : UInt16

}
