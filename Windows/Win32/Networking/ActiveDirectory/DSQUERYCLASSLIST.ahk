#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DSQUERYCLASSLIST structure describes a list of classes against which a directory service query is made.
 * @remarks
 * The class list is retrieved by the form pages upon receiving a DSQPM_GETCLASSLIST page message.
 * @see https://learn.microsoft.com/windows/win32/api/dsquery/ns-dsquery-dsqueryclasslist
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DSQUERYCLASSLIST {
    #StructPack 4

    /**
     * Size, in bytes, of this structure.
     */
    cbStruct : UInt32

    /**
     * Number of the classes in the array.
     */
    cClasses : Int32

    /**
     * Offset to the class names of Unicode strings.
     */
    offsetClass : UInt32[1]

}
