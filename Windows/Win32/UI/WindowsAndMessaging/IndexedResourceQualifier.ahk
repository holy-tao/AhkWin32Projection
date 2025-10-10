#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the context under which a resource is appropriate.
 * @see https://docs.microsoft.com/windows/win32/api//resourceindexer/ns-resourceindexer-indexedresourcequalifier
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class IndexedResourceQualifier extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The name of the qualifier, such as "language", "contrast", or "scale".
     * @type {Pointer<Char>}
     */
    name {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

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
     * @type {Pointer<Char>}
     */
    value {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
