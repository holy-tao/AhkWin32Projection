#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A type description that is used with WS_ENUM_TYPE and is required. It provides information used in serializing and deserializing values of an enumeration.
 * @remarks
 * 
  * The following examples illustrates initializing an enum description.  This 
  *                 example illustrates the use of the nameIndices field, but this field could
  *                 be <b>NULL</b> instead.
  *             
  * 
  * <pre class="syntax" xml:space="preserve"><code>
  * enum
  * {
  *     Red = 10,
  *     Green = 20,
  *     Blue = 30,
  * };
  * 
  * WS_XML_STRING redString = WS_XML_STRING_VALUE("red");
  * WS_XML_STRING greenString = WS_XML_STRING_VALUE("green");
  * WS_XML_STRING blueString = WS_XML_STRING_VALUE("blue");
  * 
  * // sorted by ascending numeric value
  * WS_ENUM_VALUE valueArray[3] =
  * {
  *     { Red, &amp;redString },
  *     { Green, &amp;greenString },
  *     { Blue, &amp;blueString },
  * };
  * 
  * // sorted by ascending name
  * ULONG nameIndices[3] =
  * {
  *     2, // "blue"
  *     1, // "green"
  *     0, // "red"
  * };
  * 
  * WS_ENUM_DESCRIPTION enumDescription;
  * enumDescription.maxByteCount = 5; // "green"
  * enumDescription.values = valueArray;
  * enumDescription.valueCount = 3;
  * enumDescription.nameIndices = nameIndices;
  * </code></pre>
  * 
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_enum_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_ENUM_DESCRIPTION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Points to an array of enumeration values and their
     *                     corresponding names.
     *                 
     * 
     * There must not be duplicate values or names in
     *                     the array.
     * @type {Pointer<WS_ENUM_VALUE>}
     */
    values {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The number of items in the values array.
     * @type {Integer}
     */
    valueCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The length, in UTF8 bytes, of the longest name
     *                     in the values array.
     * @type {Integer}
     */
    maxByteCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * An optional array that provides information which can improve
     *                     the performance of mapping enumeration values to names and back.
     *                     This array may <b>NULL</b>, in which case an O(n) lookup is used,
     *                     which may be sufficient for small numbers of enumerated values.
     *                 
     * 
     * If non-<b>NULL</b>, the following must be true:
     *                 
     * 
     * <ul>
     * <li>The values array is required to be sorted by value, in ascending order.
     *                     </li>
     * <li>The nameIndices array points to an array that has valueCount items. 
     *                     </li>
     * <li>The nameIndices array provides the indices of the items in
     *                     the values array as if they were sorted by name in ascending order.
     *                     The names should by sorted by performing a byte-wise comparison of the utf-8 string.
     *                 </li>
     * </ul>
     * @type {Pointer<UInt32>}
     */
    nameIndices {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
