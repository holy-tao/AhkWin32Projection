#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a set of unique strings. This information is used by the binary encoding to write a more compact xml document.
 * @remarks
 * 
 * All strings and values within a dictionary must be unique.  Dictionaries are
 *         always assumed to be well-formed, so it is up to the creator of the dictionary
 *         to ensure that this is the case.
 *       
 * 
 * A dictionary might be declared as:
 *       
 * 
 * <pre class="syntax" xml:space="preserve"><code>struct PurchaseOrderDictionary
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
 * </code></pre>
 * Strings from the dictionary might be used as:
 *       
 * 
 * <pre class="syntax" xml:space="preserve"><c>WsWriteStartElement(xmlWriter, NULL, &amp;purchaseOrderDictionary.purchaseOrder, &amp;purchaseOrderDictionary.purchaseOrderNamespace, error);</c></pre>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_xml_dictionary
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_XML_DICTIONARY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A guid that uniquely identifies the set of strings represented by the dictionary.
     *           The guid is never transmitted or persisted, and needs to only be unique for the lifetime of the process.
     * @type {Pointer<Guid>}
     */
    guid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The set of unique strings that comprise the dictionary.
     * @type {Pointer<WS_XML_STRING>}
     */
    strings {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies the number of strings in the dictionary.
     * @type {Integer}
     */
    stringCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Indicates if the dictionary and its contents are declared const and that they will be kept valid for the
     *           entire lifetime of any object with which strings in the dictionary are used.
     *         
     * 
     * If this is <b>TRUE</b>, then the strings can be manipulated more efficiently.
     * @type {BOOL}
     */
    isConst {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
