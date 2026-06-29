#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The TF_LANGBARITEMINFO structure is used to hold information about a language bar item.
 * @see https://learn.microsoft.com/windows/win32/api/ctfutb/ns-ctfutb-tf_langbariteminfo
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct TF_LANGBARITEMINFO {
    #StructPack 4

    /**
     * Contains the <b>CLSID</b> of the text service that owns the language bar item. This can be CLSID_NULL if the item is not provided by a text service.
     */
    clsidService : Guid

    /**
     * Contains a <b>GUID</b> value that identifies the language bar item.
     * 
     * Starting with Windows 8, this value should be GUID_LBI_INPUTMODE (or the language bar item will be ignored). For more information, see [Third-party input method editors](https://docs.microsoft.com/en-us/windows/win32/w8cookbook/third-party-input-method-editors#manifestation) in the Compatibility cookbook for Windows.
     */
    guidItem : Guid

    /**
     * Contains a combination of one or more of the <a href="https://docs.microsoft.com/windows/desktop/TSF/tf-lbi-style--constants">TF_LBI_STYLE_*</a> values.
     */
    dwStyle : UInt32

    /**
     * Specifies the sort order of the language bar item, relative to other language bar items owned by the text service. A lower number indicates that the item will be displayed prior to an item with a higher sort number.
     * 
     * This value is only used if <b>clsidService</b> identifies a registered text service. For more information about registering a text service, see <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfinputprocessorprofiles-register">ITfInputProcessorProfiles::Register</a>.
     */
    ulSort : UInt32

    /**
     * Contains the description string for the item in Unicode format. The description string is displayed in the language bar options menu for menu items. This buffer can hold up to TF_LBI_DESC_MAXLEN characters.
     */
    szDescription : WCHAR[32]

}
