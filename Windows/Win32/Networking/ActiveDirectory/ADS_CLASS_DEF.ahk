#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The ADS_CLASS_DEF structure is used only as a part of IDirectorySchemaMgmt, which is an obsolete interface. The information that follows is provided for legacy purposes only. The ADS_CLASS_DEF structure holds the definitions of an object class.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_class_def
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct ADS_CLASS_DEF {
    #StructPack 8

    /**
     * The null-terminated Unicode string that specifies the class name.
     */
    pszClassName : PWSTR

    /**
     * The number of mandatory class attributes.
     */
    dwMandatoryAttrs : UInt32

    /**
     * Pointer to an array of  null-terminated Unicode strings that contain the names of the mandatory attributes.
     */
    ppszMandatoryAttrs : PWSTR.Ptr

    /**
     * Number of optional attributes of the class.
     */
    optionalAttrs : UInt32

    /**
     * Pointer to an array of null-terminated Unicode strings that contain the names of the optional attributes.
     */
    ppszOptionalAttrs : IntPtr

    /**
     * Number of naming attributes.
     */
    dwNamingAttrs : UInt32

    /**
     * Pointer to an array of null-terminated Unicode strings that contain the names of the naming attributes.
     */
    ppszNamingAttrs : IntPtr

    /**
     * Number of super classes of an object of this class.
     */
    dwSuperClasses : UInt32

    /**
     * Pointer to an array of null-terminated Unicode strings that contain the names of the super classes.
     */
    ppszSuperClasses : IntPtr

    /**
     * Flags that indicate the object of the class is a container when it is <b>TRUE</b> and not a container when <b>FALSE</b>.
     */
    fIsContainer : BOOL

}
