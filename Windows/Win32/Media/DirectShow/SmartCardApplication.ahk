#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ApplicationTypeType.ahk" { ApplicationTypeType }

/**
 * The SmartCardApplication structure identifies a smart card application.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface_enums/ns-bdaiface_enums-smartcardapplication
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct SmartCardApplication {
    #StructPack 8

    /**
     * Member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/applicationtypetype">ApplicationTypeType</a> enumeration.
     */
    ApplicationType : ApplicationTypeType

    /**
     * Application version.
     */
    ApplicationVersion : UInt16

    /**
     * Application name.
     */
    pbstrApplicationName : BSTR

    /**
     * Application URL.
     */
    pbstrApplicationURL : BSTR

}
