#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a string that optionally has dictionary information associated with it. The xml APIs use WS_XML_STRINGs to identify prefixes, localNames and namespaces.
 * @remarks
 * 
 * The string is represented as UTF-8 encoded bytes, not WCHARs.  It is not required to be zero terminated.
 *       
 * 
 * The macros <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-ws_xml_string_value">WS_XML_STRING_VALUE</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd323562(v=vs.85)">WS_XML_STRING_NULL</a>  and
 *         <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-ws_xml_string_dictionary_value">WS_XML_STRING_DICTIONARY_VALUE</a> can be used to initialize this structure.
 *       
 * 
 * The dictionary information is used by the binary encoding to write a more compact xml document.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_xml_string
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_STRING extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The number of bytes in the UTF-8 encoded representation of the string.
     * @type {Integer}
     */
    length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The string encoded as UTF-8 bytes.
     * @type {Pointer<Integer>}
     */
    bytes {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to the dictionary that contains the string.  If the string is not part of a dictionary
     *           then the value may be <b>NULL</b>.
     * @type {Pointer<WS_XML_DICTIONARY>}
     */
    dictionary {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A value that uniquely identifies the string within the specified dictionary.
     *           The entry at dictionary-&gt;strings[id] should identify this string.
     *         
     * 
     * If the dictionary is <b>NULL</b>, then this value is unused.
     * @type {Integer}
     */
    id {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
