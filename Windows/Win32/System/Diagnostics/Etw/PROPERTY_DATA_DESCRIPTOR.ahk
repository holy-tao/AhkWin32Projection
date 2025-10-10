#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Defines the property to retrieve.
 * @remarks
 * 
  * To describe a structure, set PropertyName to the name of the structure and ArrayIndex to ULONG_MAX. 
  * 
  * To describe a member of a structure, define an array of two <b>PROPERTY_DATA_DESCRIPTOR</b> structures. In the first descriptor, set  PropertyName to the name of the structure and ArrayIndex to 0. In the second descriptor, set PropertyName to the name of the member and ArrayIndex to ULONG_MAX.
  * 
  * If the structure is an element of an array of structures, set ArrayIndex in the first descriptor to the zero-based index of the structure in the array.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tdh/ns-tdh-property_data_descriptor
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class PROPERTY_DATA_DESCRIPTOR extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Pointer to a null-terminated Unicode string that contains the case-sensitive property name. You can use the <b>NameOffset</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-event_property_info">EVENT_PROPERTY_INFO</a> structure to get the property name.
     * 
     * The following table lists the possible values of <i>PropertyName</i> for WPP events. Use the suggested TDH data type when formatting the returned buffer from <a href="https://docs.microsoft.com/windows/desktop/api/tdh/nf-tdh-tdhgetproperty">TdhGetProperty</a>.
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>TDH Data Type</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>FormattedString</td>
     * <td>TDH_INTYPE_UNICODESTRING</td>
     * <td>The formatted WPP trace message.</td>
     * </tr>
     * <tr>
     * <td>SequenceNum</td>
     * <td>TDH_INTYPE_UINT32</td>
     * <td>The local or global sequence number of the trace message. Local sequence numbers, which are unique only to this trace session, are the default.</td>
     * </tr>
     * <tr>
     * <td>FunctionName</td>
     * <td>TDH_INTYPE_UNICODESTRING</td>
     * <td>The name of the function that generated the trace message.</td>
     * </tr>
     * <tr>
     * <td>ComponentName</td>
     * <td>TDH_INTYPE_UNICODESTRING</td>
     * <td>The name of the component of the provider that generated the trace message. The component name appears only if it is specified in the tracing code.</td>
     * </tr>
     * <tr>
     * <td>SubComponentName</td>
     * <td>TDH_INTYPE_UNICODESTRING</td>
     * <td>The name of the subcomponent of the provider that generated the trace message. The subcomponent name appears only if it is specified in the tracing code.</td>
     * </tr>
     * <tr>
     * <td>TraceGuid</td>
     * <td>TDH_INTYPE_GUID</td>
     * <td>The GUID associated with the WPP trace message.</td>
     * </tr>
     * <tr>
     * <td>GuidTypeName</td>
     * <td>TDH_INTYPE_UNICODESTRING</td>
     * <td>The file name concatenated with the line number from the source code from which the WPP trace message was traced.</td>
     * </tr>
     * <tr>
     * <td>SystemTime</td>
     * <td>TDH_INTYPE_SYSTEMTIME</td>
     * <td>The time when the WPP trace message was generated.</td>
     * </tr>
     * <tr>
     * <td>FlagsName</td>
     * <td>TDH_INTYPE_UNICODESTRING</td>
     * <td>The names of the trace flags enabling the trace message.</td>
     * </tr>
     * <tr>
     * <td>LevelName</td>
     * <td>TDH_INTYPE_UNICODESTRING</td>
     * <td>The value of the trace level enabling the trace message.</td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    PropertyName {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Zero-based index for accessing elements of a property array. If the property data is not an array or if you want to address the entire array, specify ULONG_MAX (0xFFFFFFFF).
     * @type {Integer}
     */
    ArrayIndex {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
