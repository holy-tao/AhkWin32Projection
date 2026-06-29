#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Retrieves the attributes of a recognizer or specifies which attributes to use when you search for an installed recognizer.
 * @remarks
 * The <i>awcFriendlyName</i> parameter may be empty (that is, having the first element set to the null character) when you use this structure as a return value from the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-getrecoattributes">GetRecoAttributes Function</a>. Because this is not an error, the return code for <i>awcFriendlyName</i> in <b>GetRecoAttributes Function</b> will be S_OK, and the other fields will contain data.
 * @see https://learn.microsoft.com/windows/win32/api/rectypes/ns-rectypes-reco_attrs
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct RECO_ATTRS {
    #StructPack 4

    dwRecoCapabilityFlags : UInt32

    /**
     * Vendor who wrote the recognizer.
     */
    awcVendorName : WCHAR[32]

    /**
     * A human-readable name for the recognizer.
     * 
     * Specify this name when you search for an installed recognizer.
     */
    awcFriendlyName : WCHAR[64]

    /**
     * List of language and sublanguage combinations that the recognizer supports. The list is <b>NULL</b> -terminated.
     * 
     * Specify language identifiers when you search for an installed recognizer if the <i>awcFriendlyName</i> member contains an empty string. Use the MAKELANGID macro to create the language identifiers. If the recognizer does not distinguish between writing styles corresponding to different sublanguages, specify SUBLANG_NEUTRAL for the sublanguage identifier.
     */
    awLanguageId : UInt16[64]

}
