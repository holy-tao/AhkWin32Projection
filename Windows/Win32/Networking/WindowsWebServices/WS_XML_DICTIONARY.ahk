#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_XML_STRING.ahk" { WS_XML_STRING }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Represents a set of unique strings. This information is used by the binary encoding to write a more compact xml document.
 * @remarks
 * All strings and values within a dictionary must be unique.  Dictionaries are
 *         always assumed to be well-formed, so it is up to the creator of the dictionary
 *         to ensure that this is the case.
 *       
 * 
 * A dictionary might be declared as:
 *       
 * 
 * 
 * ``` syntax
 * struct PurchaseOrderDictionary
 * {
 *     WS_XML_DICTIONARY dictionary;
 *     WS_XML_STRING quantity;
 *     WS_XML_STRING productName;
 *     WS_XML_STRING purchaseOrder;
 *     WS_XML_STRING purchaseOrderNamespace;
 * };
 * 
 * static PurchaseOrderDictionary purchaseOrderDictionary =
 * {
 *     { 
 *         { // A unique GUID generated from uuidgen  },
 *         &amp;purchaseOrderDictionary.quantity,
 *         4, 
 *         TRUE 
 *     },
 *     WS_XML_STRING_DICTIONARY_VALUE("Quantity",           &amp;purchaseOrderDictionary.dictionary, 0),
 *     WS_XML_STRING_DICTIONARY_VALUE("ProductName",        &amp;purchaseOrderDictionary.dictionary, 1),
 *     WS_XML_STRING_DICTIONARY_VALUE("PurchaseOrder",      &amp;purchaseOrderDictionary.dictionary, 2),
 *     WS_XML_STRING_DICTIONARY_VALUE("http://example.com", &amp;purchaseOrderDictionary.dictionary, 3),
 * };
 * 
 * ```
 * 
 * Strings from the dictionary might be used as:
 *       
 * 
 * 
 * ``` syntax
 * WsWriteStartElement(xmlWriter, NULL, &amp;purchaseOrderDictionary.purchaseOrder, &amp;purchaseOrderDictionary.purchaseOrderNamespace, error);
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_xml_dictionary
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_XML_DICTIONARY {
    #StructPack 8

    /**
     * A guid that uniquely identifies the set of strings represented by the dictionary.
     *           The guid is never transmitted or persisted, and needs to only be unique for the lifetime of the process.
     */
    guid : Guid

    __strings_ptr : IntPtr
    /**
     * The set of unique strings that comprise the dictionary.
     */
    strings {
        get => (addr := this.__strings_ptr) ? WS_XML_STRING.At(addr) : unset
        set => this.__strings_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    /**
     * Specifies the number of strings in the dictionary.
     */
    stringCount : UInt32

    /**
     * Indicates if the dictionary and its contents are declared const and that they will be kept valid for the
     *           entire lifetime of any object with which strings in the dictionary are used.
     *         
     * 
     * If this is <b>TRUE</b>, then the strings can be manipulated more efficiently.
     */
    isConst : BOOL

}
