#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MSIHANDLE.ahk" { MSIHANDLE }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct PMSIHANDLE {
    #StructPack 8

    m_h : MSIHANDLE

}
