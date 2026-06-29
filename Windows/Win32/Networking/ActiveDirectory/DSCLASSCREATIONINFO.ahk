#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Used with the IDsDisplaySpecifier::GetClassCreationInfo method to hold data about the class creation wizard objects for an object class.
 * @see https://learn.microsoft.com/windows/win32/api/dsclient/ns-dsclient-dsclasscreationinfo
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DSCLASSCREATIONINFO {
    #StructPack 8

    dwFlags : UInt32

    /**
     * Contains the class identifier of the class creation wizard dialog box. This member is not used if <b>dwFlags</b> does not contain <b>DSCCIF_HASWIZARDDIALOG</b>.
     */
    clsidWizardDialog : Guid

    /**
     * Contains the class identifier of the primary property page of the class creation wizard. This member is not used if <b>dwFlags</b> does not contain <b>DSCCIF_HASWIZARDPRIMARYPAGE</b>.
     */
    clsidWizardPrimaryPage : Guid

    /**
     * Contains the number of elements in the <b>aWizardExtensions</b> array.
     */
    cWizardExtensions : UInt32

    /**
     * Contains an array of the class identifiers of the  property page extensions. <b>cWizardExtensions</b> specifies the number of elements in this array.
     */
    aWizardExtensions : IntPtr[1]

}
