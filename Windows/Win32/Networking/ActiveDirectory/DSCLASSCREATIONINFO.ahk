#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Used with the IDsDisplaySpecifier::GetClassCreationInfo method to hold data about the class creation wizard objects for an object class.
 * @see https://learn.microsoft.com/windows/win32/api/dsclient/ns-dsclient-dsclasscreationinfo
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
class DSCLASSCREATIONINFO extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Contains the class identifier of the class creation wizard dialog box. This member is not used if <b>dwFlags</b> does not contain <b>DSCCIF_HASWIZARDDIALOG</b>.
     * @type {Guid}
     */
    clsidWizardDialog {
        get {
            if(!this.HasProp("__clsidWizardDialog"))
                this.__clsidWizardDialog := Guid(4, this)
            return this.__clsidWizardDialog
        }
    }

    /**
     * Contains the class identifier of the primary property page of the class creation wizard. This member is not used if <b>dwFlags</b> does not contain <b>DSCCIF_HASWIZARDPRIMARYPAGE</b>.
     * @type {Guid}
     */
    clsidWizardPrimaryPage {
        get {
            if(!this.HasProp("__clsidWizardPrimaryPage"))
                this.__clsidWizardPrimaryPage := Guid(20, this)
            return this.__clsidWizardPrimaryPage
        }
    }

    /**
     * Contains the number of elements in the <b>aWizardExtensions</b> array.
     * @type {Integer}
     */
    cWizardExtensions {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Contains an array of the class identifiers of the  property page extensions. <b>cWizardExtensions</b> specifies the number of elements in this array.
     * @type {Array<Pointer>}
     */
    aWizardExtensions {
        get {
            if(!this.HasProp("__aWizardExtensionsProxyArray"))
                this.__aWizardExtensionsProxyArray := Win32FixedArray(this.ptr + 40, 1, Primitive, "ptr")
            return this.__aWizardExtensionsProxyArray
        }
    }
}
