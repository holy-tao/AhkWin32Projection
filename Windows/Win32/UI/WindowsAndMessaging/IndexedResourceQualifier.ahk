#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Represents the context under which a resource is appropriate.
 * @see https://learn.microsoft.com/windows/win32/api/resourceindexer/ns-resourceindexer-indexedresourcequalifier
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct IndexedResourceQualifier {
    #StructPack 8

    /**
     * The name of the qualifier, such as "language", "contrast", or "scale".
     */
    name : PWSTR

    /**
     * The value of the qualifier. You should preserve the case of the qualifier value from the first instance of the qualifier discovered during indexing.
     * 
     * 
     * 
     * The following values are examples of the qualifier values:
     * 
     * <ul>
     * <li>"100", "140", or "180" for scale.</li>
     * <li>"fr-FR" for language.</li>
     * <li>"high" for contrast.
     * </li>
     * </ul>
     */
    value : PWSTR

}
