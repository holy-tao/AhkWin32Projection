#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_DICTIONARY.ahk" { WS_XML_DICTIONARY }

/**
 * Represents a string that optionally has dictionary information associated with it. The xml APIs use WS_XML_STRINGs to identify prefixes, localNames and namespaces.
 * @remarks
 * The string is represented as UTF-8 encoded bytes, not WCHARs.  It is not required to be zero terminated.
 *       
 * 
 * The macros <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-ws_xml_string_value">WS_XML_STRING_VALUE</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd323562(v=vs.85)">WS_XML_STRING_NULL</a>  and
 *         <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-ws_xml_string_dictionary_value">WS_XML_STRING_DICTIONARY_VALUE</a> can be used to initialize this structure.
 *       
 * 
 * The dictionary information is used by the binary encoding to write a more compact xml document.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_string
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_STRING {
    #StructPack 8

    /**
     * The number of bytes in the UTF-8 encoded representation of the string.
     */
    length : UInt32

    /**
     * The string encoded as UTF-8 bytes.
     */
    bytes : IntPtr

    __dictionary_ptr : IntPtr
    /**
     * A pointer to the dictionary that contains the string.  If the string is not part of a dictionary
     *           then the value may be <b>NULL</b>.
     */
    dictionary {
        get => (addr := this.__dictionary_ptr) ? WS_XML_DICTIONARY.At(addr) : unset
        set => this.__dictionary_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    /**
     * A value that uniquely identifies the string within the specified dictionary.
     *           The entry at dictionary-&gt;strings[id] should identify this string.
     *         
     * 
     * If the dictionary is <b>NULL</b>, then this value is unused.
     */
    id : UInt32

}
