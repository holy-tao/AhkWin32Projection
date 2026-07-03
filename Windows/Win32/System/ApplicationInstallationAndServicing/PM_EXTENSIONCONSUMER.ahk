#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct PM_EXTENSIONCONSUMER {
    #StructPack 8

    ConsumerPID : Guid

    ExtensionID : BSTR

}
