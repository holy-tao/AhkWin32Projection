#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IStream.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for encapsulating MAPI properties that are not supported by a messaging system into binary streams that can be attached to messages.
 * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/itnefiunknown
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITnef extends IUnknown{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddProps", "ExtractProps", "Finish", "OpenTaggedBody", "SetProps", "EncodeRecips", "FinishComponent"]

    /**
     * ITnefAddProps enables the calling service provider or gateway to add properties to the encapsulation of a message or an attachment.
     * @remarks
     * Transport providers, message store providers, and gateways call the **ITnef::AddProps** method to list properties to be included in or excluded from the Transport-Neutral Encapsulation Format (TNEF) processing of a message or an attachment. By using successive calls, the provider or gateway can specify a list of properties to add and encode or to exclude from being encoded. Providers and gateways can also use **AddProps** to provide information about any special handling attachments should be given. 
     *   
     *  **AddProps** is supported only for TNEF objects that are opened with the TNEF_ENCODE flag for the [OpenTnefStream](opentnefstream.md) or [OpenTnefStreamEx](opentnefstreamex.md) function. 
     *   
     * Note that no actual TNEF encoding happens for **AddProps** until the [ITnef::Finish](itnef-finish.md) method is called. This functionality means that pointers passed into **AddProps** must remain valid until after the call to **Finish** is made. At that point, all objects and data passed in with **AddProps** calls can be released or freed.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls how properties are included in or excluded from encapsulation. The following flags can be set:
     *     
     * TNEF_PROP_ATTACHMENTS_ONLY 
     *   
     * > Encodes only the properties in the _lpPropList_ parameter that are part of attachments in the message. 
     *     
     * TNEF_PROP_CONTAINED 
     *   
     * > Encodes only properties from the attachment specified by the  _ulElemID_ parameter. If the  _lpvData_ parameter is not NULL, the data pointed to is written into the attachment's encapsulation in the file indicated by the **PR_ATTACH_TRANSPORT_NAME** ([PidTagAttachTransportName](pidtagattachtransportname-canonical-property.md)) property.
     *     
     * TNEF_PROP_CONTAINED_TNEF 
     *   
     * > Encodes only properties from the message or attachment specified by the  _ulElemID_ parameter. If this flag is set, the value in  _lpvData_ must be an [IStream](/windows/desktop/api/objidl/nn-objidl-istream) pointer. 
     *     
     * TNEF_PROP_EXCLUDE 
     *   
     * > Encodes all properties not specified in the _lpPropList_ parameter. 
     *     
     * TNEF_PROP_INCLUDE 
     *   
     * > Encodes all properties specified in  _lpPropList_. 
     *     
     * TNEF_PROP_MESSAGE_ONLY 
     *   
     * > Encodes only those properties specified in  _lpPropList_ that are part of the message itself.
     * @param {Integer} ulElemID > [in] An attachment's **PR_ATTACH_NUM** ([PidTagAttachNumber](pidtagattachnumber-canonical-property.md)) property, which contains a number that uniquely identifies the attachment in its parent message. The  _ulElemID_ parameter is used when special handling is requested for an attachment. The  _ulElemID_ parameter should be 0 unless the TNEF_PROP_CONTAINED or TNEF_PROP_CONTAINED_TNEF flag is set in the _ulFlags_ parameter.
     * @param {Pointer<Void>} lpvData > [in] A pointer to attachment data used to replace the data of the attachment specified in  _ulElemID_. The  _lpvData_ parameter should be NULL unless TNEF_PROP_CONTAINED or TNEF_PROP_CONTAINED_TNEF is set in  _ulFlags_.
     * @param {Pointer<SPropTagArray>} lpPropList > [in] A pointer to the list of properties to include in or exclude from encapsulation.
     * @returns {HRESULT} S_OK 
     *   
     * > The call succeeded and has returned the expected value or values.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/itnef-addprops
     */
    AddProps(ulFlags, ulElemID, lpvData, lpPropList) {
        lpvDataMarshal := lpvData is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "uint", ulFlags, "uint", ulElemID, lpvDataMarshal, lpvData, "ptr", lpPropList, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @remarks
     * Transport providers, message store providers, and gateways call the **ITnef::ExtractProps** method to extract (that is, decode) properties from the encapsulation of a message or an attachment that was passed to the [OpenTnefStream](opentnefstream.md) function. The calling provider or gateway can specify a list of properties to decode. Providers and gateways can also use **ExtractProps** to provide information about any special handling for attachments.
     *   
     *  **ExtractProps** populates the original message passed into **OpenTnefStream** with the decoded properties. Subsequent **ExtractProps** calls go back to the message and extract the new list of properties.
     *   
     * Unlike the [ITnef::AddProps](itnef-addprops.md) method, which queues requested actions until the **ITnef::Finish** method is called, the **ExtractProps** method decodes the encapsulated properties immediately when it is called. For that reason, the target message for encapsulation decoding should be relatively empty. Existing properties in the target message are overwritten by encapsulated properties.
     *   
     *  **ExtractProps** is supported only for objects that are opened with the TNEF_DECODE flag for the **OpenTnefStream** or [OpenTnefStreamEx](opentnefstreamex.md) function.
     *   
     * The TNEF implementation reports TNEF stream encoding problems without stopping the **ExtractProps** process. The [STnefProblemArray](stnefproblemarray.md) structure returned in  _lpProblems_ indicates which TNEF attributes or MAPI properties, if any, could not be processed. The value returned in the **scode** member of the one of the **STnefProblem** structures contained in **STnefProblemArray** indicates the specific problem. The provider or gateway can work on the assumption that all properties or attributes for which **ExtractProps** does not return a problem report were processed successfully.
     *   
     * > [!NOTE]
     * > If a property in the MAPI encapsulation block cannot be processed and leaves the stream unreliable during the decoding of a TNEF stream, decoding of the encapsulation block is stopped and a problem is reported. The problem array for this type of problem contains 0L for the **ulPropTag** member, `attMAPIProps` or `attAttachment` for the **ulAttribute** member, and MAPI_E_UNABLE_TO_COMPLETE for the **scode** member. Note that the decoding of the stream is not halted, just the decoding of the MAPI encapsulation block. The stream decoding continues with the next attribute block.
     *   
     * If a provider or gateway does not work with problem arrays, it can pass NULL in  _lppProblems_; in this case, no problem array is returned.
     *   
     * The value returned in  _lpProblems_ is valid only if the call returns S_OK. When S_OK is returned, the provider or gateway should check the values returned in the **STnefProblemArray** structure. If an error occurs on the call, the **STnefProblemArray** structure is not filled in and the calling provider or gateway should not use or free the structure. If no error occurs on the call, the calling provider or gateway must release the memory for the **STnefProblemArray** structure by calling the [MAPIFreeBuffer](mapifreebuffer.md) function.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls how properties are decoded. The following flags can be set:
     * 
     * TNEF_PROP_EXCLUDE
     *   
     * > Decodes all properties not specified in the _lpPropList_ parameter.
     * 
     * TNEF_PROP_INCLUDE
     *   
     * > Decodes all properties specified in  _lpPropList_.
     * @param {Pointer<SPropTagArray>} lpPropList > [in] A pointer to the list of properties to include in or exclude from the decoding operation.
     * @param {Pointer<Pointer<STnefProblemArray>>} lpProblems > [out] A pointer to a pointer to a returned [STnefProblemArray](stnefproblemarray.md) structure. The **STnefProblemArray** structure indicates which properties, if any, were not encoded properly. If NULL is passed in the _lpProblems_ parameter, no property problem array is returned.
     * @returns {HRESULT} S_OK
     *   
     * > The call succeeded and returned the expected value or values.
     * 
     * MAPI_E_CORRUPT_DATA
     *   
     * > Data being decoded into a stream is corrupted.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/itnef-extractprops
     */
    ExtractProps(ulFlags, lpPropList, lpProblems) {
        lpProblemsMarshal := lpProblems is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", ulFlags, "ptr", lpPropList, lpProblemsMarshal, lpProblems, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * ITnefFinish finishes processing for all Transport-Neutral Encapsulation Format (TNEF) operations that are queued and waiting.
     * @remarks
     * Transport providers, message store providers, and gateways call the **ITnef::Finish** method to perform the encoding of all properties for which encoding was requested in calls to the [ITnef::AddProps](itnef-addprops.md) and [ITnef::SetProps](itnef-setprops.md) methods. If the TNEF object was opened with the TNEF_ENCODE flag for the [OpenTnefStream](opentnefstream.md) or [OpenTnefStreamEx](opentnefstreamex.md) function, the **Finish** method encodes the requested properties into the encapsulation stream passed to that object. If the TNEF object was opened with the TNEF_DECODE flag, the **Finish** method decodes the properties from the TNEF stream and writes them back to the message they belong to. 
     *   
     * After the **Finish** call, the pointer to the encapsulation stream points to the end of the TNEF data. If the provider or gateway needs to use the TNEF stream data after the **Finish** call, it must reset the stream pointer to the beginning of the TNEF stream data. 
     *   
     * The TNEF implementation reports TNEF stream encoding problems without stopping the **Finish** process. The [STnefProblemArray](stnefproblemarray.md) structure returned in the _lpProblem_ parameter indicates which TNEF attributes or MAPI properties, if any, could not be processed. The value returned in the **scode** member of the one of the **STnefProblem** structures contained in **STnefProblemArray** indicates the specific problem. The provider or gateway can work on the assumption that all properties or attributes for which **Finish** does not return a problem report were processed successfully. 
     *   
     * If a provider or gateway does not work with problem arrays, it can pass NULL in  _lpProblem_; in this case, no problem array is returned. 
     *   
     * The value returned in  _lpProblem_ is valid only if the call returns S_OK. When S_OK is returned, the provider or gateway should check the values returned in the **STnefProblemArray** structure. If an error occurs on the call, the **STnefProblemArray** structure is not filled in and the calling provider or gateway should not use or free the structure. If no error occurs on the call, the calling provider or gateway must release the memory for the **STnefProblemArray** by calling the [MAPIFreeBuffer](mapifreebuffer.md) function.
     * @param {Integer} ulFlags > [in] Reserved; must be zero.
     * @param {Pointer<Integer>} lpKey > [out] A pointer to the **PR_ATTACH_NUM** ([PidTagAttachNumber](pidtagattachnumber-canonical-property.md)) key property of an attachment. The TNEF encapsulation object uses this key to match an attachment to its attachment placement tag in a message. This key should be unique to each attachment.
     * @param {Pointer<Pointer<STnefProblemArray>>} lpProblems 
     * @returns {HRESULT} S_OK 
     *   
     * > The call succeeded and returned the expected value or values.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/itnef-finish
     */
    Finish(ulFlags, lpKey, lpProblems) {
        lpKeyMarshal := lpKey is VarRef ? "ushort*" : "ptr"
        lpProblemsMarshal := lpProblems is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "uint", ulFlags, lpKeyMarshal, lpKey, lpProblemsMarshal, lpProblems, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @remarks
     * Transport providers, message store providers, and gateways call the **ITnef::OpenTaggedBody** method to open a stream interface on the text of an encapsulated message (that is, on a TNEF object). 
     *   
     * As part of its processing, **OpenTaggedBody** either inserts or parses attachment tags that indicate the position of any attachments or OLE objects in the message text. The attachment tags are in the following format: 
     *   
     *  **[[** _attachment name_ **:** _n_ **in** _attachment container name_ **]]**
     *   
     *  _attachment name_ describes the attachment object;  _n_ is a number that identifies the attachment that is part of a sequence, incrementing from the value passed in the _lpKey_ parameter of the [OpenTnefStream](opentnefstream.md) or [OpenTnefStreamEx](opentnefstreamex.md) function; and  _attachment container name_ describes the physical component where the attachment object resides. 
     *   
     *  **OpenTaggedBody** reads out message text and inserts an attachment tag wherever an attachment object originally appeared in the text. The original message text is not changed. 
     *   
     * When a message that has tags is passed to a stream, the tags are stripped out and the attachment objects are relocated in the position of the tags in the stream.
     * @param {IMessage} lpMessage > [in] A pointer to the message with which the stream is associated. This message is not required to be the same message that is passed in the call to the [OpenTnefStream](opentnefstream.md) or [OpenTnefStreamEx](opentnefstreamex.md) function.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls how the stream interface is opened. The following flags can be set:
     *     
     * MAPI_CREATE 
     *   
     * > If a property does not exist in the current message, it should be created. If the property does exist, the current data in the property should be replaced with the data from the Transport-Neutral Encapsulation Format (TNEF) stream. When an implementation sets the MAPI_CREATE flag, it should also set the MAPI_MODIFY flag.
     *     
     * MAPI_MODIFY 
     *   
     * > Requests read/write permission. The default interface is read-only. MAPI_MODIFY must be set whenever MAPI_CREATE is set.
     * @returns {IStream} > [out] A pointer to a pointer to a stream object that contains the text from the **PR_BODY** ([PidTagBody](pidtagbody-canonical-property.md)) property of the passed-in encapsulated message and that supports the [IStream](/windows/win32/stg/istream-compound-file-implementation) interface.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/itnef-opentaggedbody
     */
    OpenTaggedBody(lpMessage, ulFlags) {
        result := ComCall(6, this, "ptr", lpMessage, "uint", ulFlags, "ptr*", &lppStream := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStream(lppStream)
    }

    /**
     * 
     * @remarks
     * Transport providers, message store providers, and gateways call the **ITnef::SetProps** method to set properties to include in the encapsulation of a message or an attachment without modifying the original message or attachment. Any properties set with this call override existing properties in the encapsulated message. 
     *   
     *  **SetProps** is supported only for TNEF objects that are opened with the TNEF_ENCODE flag for the [OpenTnefStream](opentnefstream.md) or [OpenTnefStreamEx](opentnefstreamex.md) function. Any number of properties can be set with this call. 
     *   
     * > [!NOTE]
     * > No actual TNEF encoding for **SetProps** happens until after the [ITnef::Finish](itnef-finish.md) method is called. This functionality means that pointers passed into **SetProps** must remain valid until after the call to **Finish** is made. At that point, all objects and data passed into **SetProps** calls can be released or freed.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls how property values are set. The following flag can be set:
     *     
     * TNEF_PROP_CONTAINED 
     *   
     * > Encodes only properties from the message or attachment specified by the  _ulElemID_ parameter.
     * @param {Integer} ulElemID > [in] An attachment's **PR_ATTACH_NUM** ([PidTagAttachNumber](pidtagattachnumber-canonical-property.md)) property, which contains a number that uniquely identifies the attachment in its parent message.
     * @param {Integer} cValues > [in] The number of property values in the [SPropValue](spropvalue.md) structure pointed to by the  _lpProps_ parameter.
     * @param {Pointer<SPropValue>} lpProps > [in] A pointer to an **SPropValue** structure that contains the property values of the properties to set.
     * @returns {HRESULT} S_OK 
     *   
     * > The call succeeded and returned the expected value or values.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/itnef-setprops
     */
    SetProps(ulFlags, ulElemID, cValues, lpProps) {
        result := ComCall(7, this, "uint", ulFlags, "uint", ulElemID, "uint", cValues, "ptr", lpProps, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @remarks
     * Transport providers, message store providers, and gateways call the **ITnef::EncodeRecips** method to perform TNEF encoding for a particular recipient table view. TNEF encoding is useful, for example, if a provider or gateway requires a particular column set, sort order, or restriction for the recipient table. 
     *   
     * A provider or gateway passes the table view to be encoded in the _lpRecipientTable_ parameter. The TNEF implementation encodes the recipient table with the given view, using the given column set, sort order, restriction, and position. If a provider or gateway passes NULL in  _lpRecipientTable_, TNEF gets the recipient table from the message being encoded by using the [IMessage::GetRecipientTable](imessage-getrecipienttable.md) method, and processes every row of the table into the TNEF stream by using the table's current settings. 
     *   
     * Calling **EncodeRecips** with NULL in  _lpRecipientTable_ thus encodes all message recipients and is equivalent to calling the [ITnef::AddProps](itnef-addprops.md) method with the TNEF_PROP_INCLUDE flag in its  _ulFlags_ parameter and the **PR_MESSAGE_RECIPIENTS** ([PidTagMessageRecipients](pidtagmessagerecipients-canonical-property.md)) property in its  _lpPropList_ parameter. 
     *   
     * Note that it is rarely necessary to call **EncodeRecips** unless there is a requirement to encode a particular recipient table view. Foreign messaging systems almost always have facilities for handling recipient lists that are powerful enough to handle the common needs of encoding recipient lists; therefore, these systems almost never require TNEF for this purpose.
     * @param {Integer} ulFlags > [in] Reserved; must be zero.
     * @param {IMAPITable} lpRecipientTable > [in] A pointer to the recipient table for which the view is encoded. The  _lpRecipientTable_ parameter can be NULL.
     * @returns {HRESULT} S_OK 
     *   
     * > The call succeeded and returned the expected value or values.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/itnef-encoderecips
     */
    EncodeRecips(ulFlags, lpRecipientTable) {
        result := ComCall(8, this, "uint", ulFlags, "ptr", lpRecipientTable, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @remarks
     * Transport providers, message store providers, and gateways call the **ITnef::FinishComponent** method to perform TNEF processing for one component, either a message or an attachment, as indicated by the flag set in the _ulFlags_ parameter.
     *   
     * For component processing to be enabled, the calling provider or gateway pass the TNEF_COMPONENT_ENCODING flag in  _ulFlags_ for the [OpenTnefStream](opentnefstream.md) or [OpenTnefStreamEx](opentnefstreamex.md) function that opened the object to receive encoding.
     *   
     * Passing values in the _lpCustomPropList_ and  _lpCustomProps_ parameters performs component encoding equivalent to that done by the [ITnef::SetProps](itnef-setprops.md) method. Passing a value in the _lpPropList_ parameter performs component encoding equivalent to that done by the [ITnef::AddProps](itnef-addprops.md) method with the TNEF_PROP_INCLUDE flag set in  _ulFlags_. Passing these values enables you to perform encodings with a single call instead of multiple calls.
     *   
     * The TNEF implementation reports TNEF stream encoding problems without stopping the **FinishComponent** process. The **STnefProblemArray** structure returned in  _lppProblems_ indicates which TNEF attributes or MAPI properties, if any, could not be processed. The value returned in the **scode** member of the one of the **STnefProblem** structures contained in **STnefProblemArray** indicates the specific problem. The provider or gateway can work on the assumption that all properties or attributes for which **FinishComponent** does not return a problem report were processed successfully.
     *   
     * If a provider or gateway does not work with problem arrays, it can pass NULL in  _lppProblems_; in this case, no problem array is returned.
     *   
     * The value returned in  _lppProblems_ is valid only if the call returns S_OK. When S_OK is returned, the provider or gateway should check the values returned in the [STnefProblemArray](stnefproblemarray.md) structure. If an error occurs on the call, the **STnefProblemArray** structure is not filled in, and the calling provider or gateway should not use or free the structure. If no error occurs on the call, the calling provider or gateway must release the memory for the **STnefProblemArray** by calling the [MAPIFreeBuffer](mapifreebuffer.md) function.
     * @param {Integer} ulFlags > [in] A bitmask of flags that controls which component will be finished. One or the other of the following flags must be set:
     * 
     * TNEF_COMPONENT_ATTACHMENT
     *   
     * > Processing will be finished for an attachment object; the _ulComponentID_ parameter contains the **PR_ATTACH_NUM** ([PidTagAttachNumber](pidtagattachnumber-canonical-property.md)) property of the attachment.
     * 
     * TNEF_COMPONENT_MESSAGE
     *   
     * > Processing will be finished for a message object.
     * @param {Integer} ulComponentID > [in] 0 to indicate processing for a message, or the **PR_ATTACH_NUM** property of an attachment to be processed. If the TNEF_COMPONENT_MESSAGE flag is set in the _ulFlags_ parameter, _ulComponentID_ must be 0.
     * @param {Pointer<SPropTagArray>} lpCustomPropList > [in] A pointer to an [SPropTagArray](sproptagarray.md) structure that contains property tags that identify the properties passed in the _lpCustomProps_ parameter. There must be a one-to-one correspondence between each property value in _lpCustomProps_ and a property tag in the _lpCustomPropList_ parameter.
     * @param {Pointer<SPropValue>} lpCustomProps > [in] A pointer to an [SPropValue](spropvalue.md) structure that contains property values for the properties to encode.
     * @param {Pointer<SPropTagArray>} lpPropList > [in] A pointer to an **SPropTagArray** structure that contains property tags for the properties to encode.
     * @param {Pointer<Pointer<STnefProblemArray>>} lpProblems 
     * @returns {HRESULT} S_OK
     *   
     * > The call succeeded and has returned the expected value or values.
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/outlook/mapi/itnef-finishcomponent
     */
    FinishComponent(ulFlags, ulComponentID, lpCustomPropList, lpCustomProps, lpPropList, lpProblems) {
        lpProblemsMarshal := lpProblems is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "uint", ulFlags, "uint", ulComponentID, "ptr", lpCustomPropList, "ptr", lpCustomProps, "ptr", lpPropList, lpProblemsMarshal, lpProblems, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
