#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines if the property is contained in a structure or array.
 * @see https://learn.microsoft.com/windows/win32/api/tdh/ne-tdh-property_flags
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class PROPERTY_FLAGS extends Win32Enum{

    /**
     * The property information is contained in the <b>structType</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-event_property_info">EVENT_PROPERTY_INFO</a> structure.
     * @type {Integer (Int32)}
     */
    static PropertyStruct => 1

    /**
     * Use the <b>lengthPropertyIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-event_property_info">EVENT_PROPERTY_INFO</a> structure to locate the property that contains the length value of the property.
     * @type {Integer (Int32)}
     */
    static PropertyParamLength => 2

    /**
     * Use the <b>countPropertyIndex</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-event_property_info">EVENT_PROPERTY_INFO</a> structure to locate the property that contains the size of the array.
     * @type {Integer (Int32)}
     */
    static PropertyParamCount => 4

    /**
     * Indicates that the MOF data is in XML format (the event data contains within itself a fully-rendered XML description). This flag is set if the MOF property contains the XMLFragment qualifier.
     * @type {Integer (Int32)}
     */
    static PropertyWBEMXmlFragment => 8

    /**
     * Indicates that the length member of the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-event_property_info">EVENT_PROPERTY_INFO</a> structure contains a fixed length, e.g. as specified in the provider manifest with &lt;data length="12" … /&gt;. This flag will not be set for a variable-length field, e.g. &lt;data length="LengthField" … /&gt;, nor will this flag be set for fields where the length is not specified in the manifest, e.g. int32 or null-terminated string. As an example, if <i>PropertyParamLength</i> is unset, length is 0, and InType is <b>TDH_INTYPE_UNICODESTRING</b>, we must check the <i>PropertyParamFixedLength</i> flag to determine the length of the string. If <i>PropertyParamFixedLength</i> is set, the string length is fixed at 0. If <i>PropertyParamFixedLength</i> is unset, the string is null-terminated.
     * @type {Integer (Int32)}
     */
    static PropertyParamFixedLength => 16

    /**
     * Indicates that the count member of the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-event_property_info">EVENT_PROPERTY_INFO</a> structure contains a fixed array count, e.g. as specified in the provider manifest with &lt;data count="12" … /&gt;. This flag will not be set for a variable-length array, e.g. &lt;data count="ArrayCount" … /&gt;, nor will this flag be set for non-array fields. As an example, if <i>PropertyParamCount</i> is unset and count is 1, PropertyParamFixedCount flag must be checked to determine whether the field is a scalar value or a single-element array. If <i>PropertyParamFixedCount</i> is set, the field is a single-element array. If PropertyParamFixedCount is unset, the field is a scalar value, not an array.
     * 
     * <div class="alert"><b>Caution</b>  This flag is new in the Windows 10 SDK. Earlier versions of the manifest compiler did not set this flag. For compatibility with manifests compiled with earlier versions of the compiler, event processing tools should only use this flag when determining whether to present a field with a fixed count of 1 as an array or a scalar.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static PropertyParamFixedCount => 32

    /**
     * Indicates that the <b>Tags</b> field contains valid field tag data.
     * @type {Integer (Int32)}
     */
    static PropertyHasTags => 64

    /**
     * Indicates that the <b>Type</b> is described with a custom schema. 
     * 
     * <div class="alert"><b>Note</b>  This flag is new in the Windows 10 SDK.</div>
     * <div> </div>
     * @type {Integer (Int32)}
     */
    static PropertyHasCustomSchema => 128
}
