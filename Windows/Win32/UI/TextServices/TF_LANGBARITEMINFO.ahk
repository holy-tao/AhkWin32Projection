#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The TF_LANGBARITEMINFO structure is used to hold information about a language bar item.
 * @see https://docs.microsoft.com/windows/win32/api//ctfutb/ns-ctfutb-tf_langbariteminfo
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TF_LANGBARITEMINFO extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Contains the <b>CLSID</b> of the text service that owns the language bar item. This can be CLSID_NULL if the item is not provided by a text service.
     * @type {Pointer<Guid>}
     */
    clsidService {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Contains a <b>GUID</b> value that identifies the language bar item.
     * @type {Pointer<Guid>}
     */
    guidItem {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Contains a combination of one or more of the <a href="https://docs.microsoft.com/windows/desktop/TSF/tf-lbi-style--constants">TF_LBI_STYLE_*</a> values.
     * @type {Integer}
     */
    dwStyle {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies the sort order of the language bar item, relative to other language bar items owned by the text service. A lower number indicates that the item will be displayed prior to an item with a higher sort number.
     * 
     * This value is only used if <b>clsidService</b> identifies a registered text service. For more information about registering a text service, see <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfinputprocessorprofiles-register">ITfInputProcessorProfiles::Register</a>.
     * @type {Integer}
     */
    ulSort {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Contains the description string for the item in Unicode format. The description string is displayed in the language bar options menu for menu items. This buffer can hold up to TF_LBI_DESC_MAXLEN characters.
     * @type {String}
     */
    szDescription {
        get => StrGet(this.ptr + 24, 31, "UTF-16")
        set => StrPut(value, this.ptr + 24, 31, "UTF-16")
    }
}
