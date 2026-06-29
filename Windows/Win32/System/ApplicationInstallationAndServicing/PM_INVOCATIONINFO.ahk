#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BSTR.ahk" { BSTR }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct PM_INVOCATIONINFO {
    #StructPack 8

    URIBaseOrAUMID : BSTR

    URIFragmentOrArgs : BSTR

}
