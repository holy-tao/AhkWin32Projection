#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ADS_CLASS_DEF structure is used only as a part of IDirectorySchemaMgmt, which is an obsolete interface. The information that follows is provided for legacy purposes only. The ADS_CLASS_DEF structure holds the definitions of an object class.
 * @see https://docs.microsoft.com/windows/win32/api//iads/ns-iads-ads_class_def
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_CLASS_DEF extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * The null-terminated Unicode string that specifies the class name.
     * @type {Pointer<Char>}
     */
    pszClassName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The number of mandatory class attributes.
     * @type {Integer}
     */
    dwMandatoryAttrs {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Pointer to an array of  null-terminated Unicode strings that contain the names of the mandatory attributes.
     * @type {Pointer<Char>}
     */
    ppszMandatoryAttrs {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Number of optional attributes of the class.
     * @type {Integer}
     */
    optionalAttrs {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Pointer to an array of null-terminated Unicode strings that contain the names of the optional attributes.
     * @type {Pointer<Char>}
     */
    ppszOptionalAttrs {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Number of naming attributes.
     * @type {Integer}
     */
    dwNamingAttrs {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Pointer to an array of null-terminated Unicode strings that contain the names of the naming attributes.
     * @type {Pointer<Char>}
     */
    ppszNamingAttrs {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Number of super classes of an object of this class.
     * @type {Integer}
     */
    dwSuperClasses {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Pointer to an array of null-terminated Unicode strings that contain the names of the super classes.
     * @type {Pointer<Char>}
     */
    ppszSuperClasses {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Flags that indicate the object of the class is a container when it is <b>TRUE</b> and not a container when <b>FALSE</b>.
     * @type {Integer}
     */
    fIsContainer {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }
}
