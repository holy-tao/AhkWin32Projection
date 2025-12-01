#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the identifiers that identify the metadata properties of a provider.
 * @remarks
 * This list of identifiers in this enumeration are for those properties that cannot change. To get the configuration for a channel, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetchannelconfigproperty">EvtGetChannelConfigProperty</a> function.
 * 
 * You cannot use the following property identifiers when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetpublishermetadataproperty">EvtGetPublisherMetadataProperty</a> function: 
 * 
 * <ul>
 * <li><b>EvtPublisherMetadataChannelReferencePath</b></li>
 * <li><b>EvtPublisherMetadataChannelReferenceIndex</b></li>
 * <li><b>EvtPublisherMetadataChannelReferenceID</b></li>
 * <li><b>EvtPublisherMetadataChannelReferenceFlags</b></li>
 * <li><b>EvtPublisherMetadataChannelReferenceMessageID</b></li>
 * <li><b>EvtPublisherMetadataLevelName</b></li>
 * <li><b>EvtPublisherMetadataLevelValue</b></li>
 * <li><b>EvtPublisherMetadataLevelMessageID</b></li>
 * <li><b>EvtPublisherMetadataTaskName</b></li>
 * <li><b>EvtPublisherMetadataTaskEventGuid</b></li>
 * <li><b>EvtPublisherMetadataTaskValue</b></li>
 * <li><b>EvtPublisherMetadataTaskMessageID</b></li>
 * <li><b>EvtPublisherMetadataOpcodeName</b></li>
 * <li><b>EvtPublisherMetadataOpcodeValue</b></li>
 * <li><b>EvtPublisherMetadataOpcodeMessageID</b></li>
 * <li><b>EvtPublisherMetadataKeywordName</b></li>
 * <li><b>EvtPublisherMetadataKeywordValue</b></li>
 * <li><b>EvtPublisherMetadataKeywordMessageID</b></li>
 * </ul>
 * To use these identifiers, you must first retrieve the handle to the property's parent object.  To retrieve the channel properties, you must first retrieve the handle to the parent object using the <b>EvtPublisherMetadataChannelReferences</b> identifier; to retrieve the level properties, you must first retrieve the handle to the parent object using the <b>EvtPublisherMetadataLevels</b> identifier; to retrieve the task properties, you must first retrieve the handle to the parent object using the <b>EvtPublisherMetadataTasks</b> identifier; to retrieve the opcode properties, you must first retrieve the handle to the parent object using the <b>EvtPublisherMetadataOpcodes</b> identifier; and to retrieve the keyword properties, you must first retrieve the handle to the parent object using the <b>EvtPublisherMetadataKeywords</b> identifier. 
 * 
 * The handle points to an array of objects that contain the metadata for child type that the provider defines. To determine how many objects are in the array, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetobjectarraysize">EvtGetObjectArraySize</a> function. To access a property of one of the objects, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetobjectarrayproperty">EvtGetObjectArrayProperty</a> function and specify the identifier of the property that you want to retrieve.
 * @see https://learn.microsoft.com/windows/win32/api/winevt/ne-winevt-evt_publisher_metadata_property_id
 * @namespace Windows.Win32.System.EventLog
 * @version v4.0.30319
 */
class EVT_PUBLISHER_METADATA_PROPERTY_ID extends Win32Enum{

    /**
     * Identifies the <b>guid</b> attribute of the provider. The variant type for this property is <b>EvtVarTypeGuid</b>.
     * @type {Integer (Int32)}
     */
    static EvtPublisherMetadataPublisherGuid => 0

    /**
     * Identifies the <b>resourceFilePath</b> attribute of the provider. The variant type for this property is <b>EvtVarTypeString</b>.
     * @type {Integer (Int32)}
     */
    static EvtPublisherMetadataResourceFilePath => 1

    /**
     * Identifies the <b>parameterFilePath</b> attribute of the provider. The variant type for this property is <b>EvtVarTypeString</b>.
     * @type {Integer (Int32)}
     */
    static EvtPublisherMetadataParameterFilePath => 2

    /**
     * Identifies the <b>messageFilePath</b> attribute of the provider. The variant type for this property is <b>EvtVarTypeString</b>.
     * @type {Integer (Int32)}
     */
    static EvtPublisherMetadataMessageFilePath => 3

    /**
     * Identifies the <b>helpLink</b> attribute of the provider. The variant type for this property is <b>EvtVarTypeString</b>.
     * @type {Integer (Int32)}
     */
    static EvtPublisherMetadataHelpLink => 4

    /**
     * Identifies the <b>message</b> attribute of the provider. The metadata is the resource identifier assigned to the message string. To get the message string, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtformatmessage">EvtFormatMessage</a> function. The variant type for this property is <b>EvtVarTypeUInt32</b>. If the provider does not specify a message, the value is –1.
     * @type {Integer (Int32)}
     */
    static EvtPublisherMetadataPublisherMessageID => 5

    /**
     * Identifies the <b>channels</b> child element of the provider. The variant type for this property is <b>EvtVarTypeEvtHandle</b>. To access the metadata of the channels that the provider defines or imports, use this handle when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetobjectarrayproperty">EvtGetObjectArrayProperty</a> function. For details, see Remarks. When you are done with the handle, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtclose">EvtClose</a> function.
     * @type {Integer (Int32)}
     */
    static EvtPublisherMetadataChannelReferences => 6

    /**
     * Identifies the <b>name</b> attribute of the channel. Use this identifier when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetobjectarrayproperty">EvtGetObjectArrayProperty</a> function. For details, see Remarks. The variant type for this property is <b>EvtVarTypeString</b>.
     * @type {Integer (Int32)}
     */
    static EvtPublisherMetadataChannelReferencePath => 7

    /**
     * Identifies the zero-based index value of the channel in the list of channels. Use this identifier when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetobjectarrayproperty">EvtGetObjectArrayProperty</a> function. For details, see Remarks. The variant type for this property is <b>EvtVarTypeUInt32</b>.
     * @type {Integer (Int32)}
     */
    static EvtPublisherMetadataChannelReferenceIndex => 8

    /**
     * Identifies the <b>value</b> attribute of the channel. Use this identifier when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetobjectarrayproperty">EvtGetObjectArrayProperty</a> function. For details, see Remarks. The variant type for this property is <b>EvtVarTypeUInt32</b>.
     * @type {Integer (Int32)}
     */
    static EvtPublisherMetadataChannelReferenceID => 9

    /**
     * Identifies the flags value that indicates whether this channel is imported from another provider. The channel is imported if the EvtChannelReferenceImported flag value is set. Use this identifier when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetobjectarrayproperty">EvtGetObjectArrayProperty</a> function. For details, see Remarks. The variant type for this property is <b>EvtVarTypeUInt32</b>.
     * @type {Integer (Int32)}
     */
    static EvtPublisherMetadataChannelReferenceFlags => 10

    /**
     * Identifies the <b>message</b> attribute of the channel. Use this identifier when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetobjectarrayproperty">EvtGetObjectArrayProperty</a> function. For details, see Remarks. The variant type for this property is <b>EvtVarTypeUInt32</b>. The property contains the resource identifier that is assigned to the message string. To get the message string, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtformatmessage">EvtFormatMessage</a> function. If the channel does not specify a message, the value is –1.
     * @type {Integer (Int32)}
     */
    static EvtPublisherMetadataChannelReferenceMessageID => 11

    /**
     * Identifies the <b>levels</b> child element of the provider. The variant type for this property is <b>EvtVarTypeEvtHandle</b>. To access the metadata of the levels that the provider defines or references, use this handle when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetobjectarrayproperty">EvtGetObjectArrayProperty</a> function. For details, see Remarks. When you are done with the handle, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtclose">EvtClose</a> function.
     * @type {Integer (Int32)}
     */
    static EvtPublisherMetadataLevels => 12

    /**
     * Identifies the <b>name</b> attribute of the level. Use this identifier when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetobjectarrayproperty">EvtGetObjectArrayProperty</a> function. For details, see Remarks. The variant type for this property is <b>EvtVarTypeString</b>.
     * @type {Integer (Int32)}
     */
    static EvtPublisherMetadataLevelName => 13

    /**
     * Identifies the <b>value</b> attribute of the level. Use this identifier when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetobjectarrayproperty">EvtGetObjectArrayProperty</a> function. For details, see Remarks. The variant type for this property is <b>EvtVarTypeUInt32</b>.
     * @type {Integer (Int32)}
     */
    static EvtPublisherMetadataLevelValue => 14

    /**
     * Identifies the <b>message</b> attribute of the level. Use this identifier when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetobjectarrayproperty">EvtGetObjectArrayProperty</a> function. For details, see Remarks. The variant type for this property is <b>EvtVarTypeUInt32</b>. The property contains the resource identifier that is assigned to the message string. To get the message string, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtformatmessage">EvtFormatMessage</a> function. If the level does not specify a message, the value is –1.
     * @type {Integer (Int32)}
     */
    static EvtPublisherMetadataLevelMessageID => 15

    /**
     * Identifies the <b>tasks</b> child element of the provider. The variant type for this property is <b>EvtVarTypeEvtHandle</b>. To access the metadata of the tasks that the provider defines, use this handle when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetobjectarrayproperty">EvtGetObjectArrayProperty</a> function. For details, see Remarks. When you are done with the handle, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtclose">EvtClose</a> function.
     * @type {Integer (Int32)}
     */
    static EvtPublisherMetadataTasks => 16

    /**
     * Identifies the <b>name</b> attribute of the task. Use this identifier when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetobjectarrayproperty">EvtGetObjectArrayProperty</a> function. For details, see Remarks. The variant type for this property is <b>EvtVarTypeString</b>.
     * @type {Integer (Int32)}
     */
    static EvtPublisherMetadataTaskName => 17

    /**
     * Identifies the <b>eventGuid</b> attribute of the task. Use this identifier when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetobjectarrayproperty">EvtGetObjectArrayProperty</a> function. For details, see Remarks. The variant type for this property is <b>EvtVarTypeString</b>.
     * @type {Integer (Int32)}
     */
    static EvtPublisherMetadataTaskEventGuid => 18

    /**
     * Identifies the <b>value</b> attribute of the task. Use this identifier when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetobjectarrayproperty">EvtGetObjectArrayProperty</a> function. For details, see Remarks. The variant type for this property is <b>EvtVarTypeUInt32</b>.
     * @type {Integer (Int32)}
     */
    static EvtPublisherMetadataTaskValue => 19

    /**
     * Identifies the <b>message</b> attribute of the task. Use this identifier when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetobjectarrayproperty">EvtGetObjectArrayProperty</a> function. For details, see Remarks. The variant type for this property is <b>EvtVarTypeUInt32</b>. The property contains the resource identifier that is assigned to the message string. To get the message string, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtformatmessage">EvtFormatMessage</a> function. If the task does not specify a message, the value is –1.
     * @type {Integer (Int32)}
     */
    static EvtPublisherMetadataTaskMessageID => 20

    /**
     * Identifies the <b>opcodes</b> child element of the provider. The variant type for this property is <b>EvtVarTypeEvtHandle</b>. To access the metadata of the opcodes that the provider defines or references, use this handle when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetobjectarrayproperty">EvtGetObjectArrayProperty</a> function. For details, see Remarks. When you are done with the handle, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtclose">EvtClose</a> function.
     * @type {Integer (Int32)}
     */
    static EvtPublisherMetadataOpcodes => 21

    /**
     * Identifies the <b>name</b> attribute of the opcode. Use this identifier when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetobjectarrayproperty">EvtGetObjectArrayProperty</a> function. For details, see Remarks. The variant type for this property is <b>EvtVarTypeString</b>.
     * @type {Integer (Int32)}
     */
    static EvtPublisherMetadataOpcodeName => 22

    /**
     * Identifies the <b>value</b> attribute of the opcode. Use this identifier when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetobjectarrayproperty">EvtGetObjectArrayProperty</a> function. For details, see Remarks. The variant type for this property is <b>EvtVarTypeUInt32</b>. The high word contains the opcode value and the low word contains the task to which it belongs. If the low word is zero, the opcode is defined globally; otherwise, the opcode is task specific. Use the low word value to determine the task that defines the opcode.
     * @type {Integer (Int32)}
     */
    static EvtPublisherMetadataOpcodeValue => 23

    /**
     * Identifies the <b>message</b> attribute of the opcode. Use this identifier when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetobjectarrayproperty">EvtGetObjectArrayProperty</a> function. For details, see Remarks. The variant type for this property is <b>EvtVarTypeUInt32</b>. The property contains the resource identifier that is assigned to the message string. To get the message string, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtformatmessage">EvtFormatMessage</a> function. If the opcode does not specify a message, the value is –1.
     * @type {Integer (Int32)}
     */
    static EvtPublisherMetadataOpcodeMessageID => 24

    /**
     * Identifies the <b>keywords</b> child element of the provider. The variant type for this property is <b>EvtVarTypeEvtHandle</b>. To access the metadata of the keywords that the provider defines, use this handle when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetobjectarrayproperty">EvtGetObjectArrayProperty</a> function. For details, see Remarks. When you are done with the handle, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtclose">EvtClose</a> function.
     * @type {Integer (Int32)}
     */
    static EvtPublisherMetadataKeywords => 25

    /**
     * Identifies the <b>name</b> attribute of the keyword. Use this identifier when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetobjectarrayproperty">EvtGetObjectArrayProperty</a> function. For details, see Remarks. The variant type for this property is <b>EvtVarTypeString</b>.
     * @type {Integer (Int32)}
     */
    static EvtPublisherMetadataKeywordName => 26

    /**
     * Identifies the <b>mask</b> attribute of the keyword. Use this identifier when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetobjectarrayproperty">EvtGetObjectArrayProperty</a> function. For details, see Remarks. The variant type for this property is <b>EvtVarTypeUInt64</b>.
     * @type {Integer (Int32)}
     */
    static EvtPublisherMetadataKeywordValue => 27

    /**
     * Identifies the <b>message</b> attribute of the keyword. Use this identifier when calling the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetobjectarrayproperty">EvtGetObjectArrayProperty</a> function. For details, see Remarks. The variant type for this property is <b>EvtVarTypeUInt32</b>. The property contains the resource identifier that is assigned to the message string. To get the message string, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtformatmessage">EvtFormatMessage</a> function. If the keyword does not specify a message, the value is –1.
     * @type {Integer (Int32)}
     */
    static EvtPublisherMetadataKeywordMessageID => 28

    /**
     * This enumeration value marks the end of the enumeration values.
     * @type {Integer (Int32)}
     */
    static EvtPublisherMetadataPropertyIdEND => 29
}
