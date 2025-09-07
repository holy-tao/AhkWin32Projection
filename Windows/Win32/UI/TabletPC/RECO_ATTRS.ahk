#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Retrieves the attributes of a recognizer or specifies which attributes to use when you search for an installed recognizer.
 * @remarks
 * The <i>awcFriendlyName</i> parameter may be empty (that is, having the first element set to the null character) when you use this structure as a return value from the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-getrecoattributes">GetRecoAttributes Function</a>. Because this is not an error, the return code for <i>awcFriendlyName</i> in <b>GetRecoAttributes Function</b> will be S_OK, and the other fields will contain data.
 * @see https://learn.microsoft.com/windows/win32/api/rectypes/ns-rectypes-reco_attrs
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class RECO_ATTRS extends Win32Struct
{
    static sizeof => 324

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    dwRecoCapabilityFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Vendor who wrote the recognizer.
     * @type {String}
     */
    awcVendorName {
        get => StrGet(this.ptr + 4, 31, "UTF-16")
        set => StrPut(value, this.ptr + 4, 31, "UTF-16")
    }

    /**
     * A human-readable name for the recognizer.
     * 
     * Specify this name when you search for an installed recognizer.
     * @type {String}
     */
    awcFriendlyName {
        get => StrGet(this.ptr + 68, 63, "UTF-16")
        set => StrPut(value, this.ptr + 68, 63, "UTF-16")
    }

    /**
     * List of language and sublanguage combinations that the recognizer supports. The list is <b>NULL</b> -terminated.
     * 
     * Specify language identifiers when you search for an installed recognizer if the <i>awcFriendlyName</i> member contains an empty string. Use the MAKELANGID macro to create the language identifiers. If the recognizer does not distinguish between writing styles corresponding to different sublanguages, specify SUBLANG_NEUTRAL for the sublanguage identifier.
     * @type {Array<UInt16>}
     */
    awLanguageId{
        get {
            if(!this.HasProp("__awLanguageIdProxyArray"))
                this.__awLanguageIdProxyArray := Win32FixedArray(this.ptr + 196, 2, Primitive, "ushort")
            return this.__awLanguageIdProxyArray
        }
    }
}
