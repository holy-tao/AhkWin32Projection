#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\RECO_LATTICE.ahk" { RECO_LATTICE }
#Import ".\PACKET_DESCRIPTION.ahk" { PACKET_DESCRIPTION }
#Import ".\HRECOALT.ahk" { HRECOALT }
#Import ".\RECO_ATTRS.ahk" { RECO_ATTRS }
#Import ".\HRECOCONTEXT.ahk" { HRECOCONTEXT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\HRECOWORDLIST.ahk" { HRECOWORDLIST }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\RECO_GUIDE.ahk" { RECO_GUIDE }
#Import ".\CHARACTER_RANGE.ahk" { CHARACTER_RANGE }
#Import "..\..\Graphics\Gdi\XFORM.ahk" { XFORM }
#Import ".\HRECOGNIZER.ahk" { HRECOGNIZER }

/**
 * @namespace Windows.Win32.UI.TabletPC
 */

;@region Functions
/**
 * Creates a recognizer.
 * @param {Pointer<Guid>} pCLSID CLSID of the recognizer. This value is created in the registry when you register the recognizer.
 * @param {Pointer<HRECOGNIZER>} phrec Handle for the recognizer.
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The parameter is an invalid pointer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid argument was received.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_OUTOFMEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Insufficient memory.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-createrecognizer
 * @since windows5.1.2600
 */
export CreateRecognizer(pCLSID, phrec) {
    result := DllCall("inkobjcore.dll\CreateRecognizer", Guid.Ptr, pCLSID, HRECOGNIZER.Ptr, phrec, "HRESULT")
    return result
}

/**
 * Destroys a recognizer.
 * @param {HRECOGNIZER} hrec Handle to the recognizer.
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The parameter is an invalid pointer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid argument was received.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-destroyrecognizer
 * @since windows5.1.2600
 */
export DestroyRecognizer(hrec) {
    result := DllCall("inkobjcore.dll\DestroyRecognizer", HRECOGNIZER, hrec, "HRESULT")
    return result
}

/**
 * Retrieves the attributes of the recognizer.
 * @remarks
 * A gesture recognizer should set the RF_OBJECT bit of the <a href="https://docs.microsoft.com/windows/desktop/api/rectypes/ns-rectypes-reco_attrs">RECO_ATTRS</a><b>::dwRecoCapabilityFlags</b> and should set every element in the <b>RECO_ATTRS</b><b>::awLanguageID</b> array to zero.
 * 
 * A gesture recognizer does not normally use a recognition guide. A gesture recognizer with no guide should clear the RF_LINED_INPUT and RF_BOXED_INPUT bits.
 * 
 * The <i>awcFriendlyName</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/rectypes/ns-rectypes-reco_attrs">RECO_ATTRS</a> structure may be empty (that is, having the first element set to the null character) when you use this structure as a return value from the <b>GetRecoAttributes Function</b>. Because this is not an error, the return code for <i>awcFriendlyName</i> in <b>GetRecoAttributes Function</b> will be S_OK, and the other fields will contain data.
 * @param {HRECOGNIZER} hrec Handle to the recognizer.
 * @param {Pointer<RECO_ATTRS>} pRecoAttrs The attributes of the recognizer. The attributes define the languages and capabilities that the recognizer supports. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/rectypes/ns-rectypes-reco_attrs">RECO_ATTRS</a> structure.
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid argument was received.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The parameter is an invalid pointer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-getrecoattributes
 * @since windows5.1.2600
 */
export GetRecoAttributes(hrec, pRecoAttrs) {
    result := DllCall("inkobjcore.dll\GetRecoAttributes", HRECOGNIZER, hrec, RECO_ATTRS.Ptr, pRecoAttrs, "HRESULT")
    return result
}

/**
 * Creates a recognizer context.
 * @param {HRECOGNIZER} hrec Handle to the recognizer.
 * @param {Pointer<HRECOCONTEXT>} phrc Pointer to the recognizer context.
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The parameter is an invalid pointer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_OUTOFMEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There is insufficient memory to complete the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid argument was received.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-createcontext
 * @since windows5.1.2600
 */
export CreateContext(hrec, phrc) {
    result := DllCall("inkobjcore.dll\CreateContext", HRECOGNIZER, hrec, HRECOCONTEXT.Ptr, phrc, "HRESULT")
    return result
}

/**
 * Destroys a recognizer context.
 * @param {HRECOCONTEXT} hrc Handle to the recognizer context.
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One of the arguments is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The parameter is an invalid pointer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-destroycontext
 * @since windows5.1.2600
 */
export DestroyContext(hrc) {
    result := DllCall("inkobjcore.dll\DestroyContext", HRECOCONTEXT, hrc, "HRESULT")
    return result
}

/**
 * Retrieves a list of properties the recognizer can return for a result range.
 * @param {HRECOGNIZER} hrec Handle to the recognizer.
 * @param {Pointer<Integer>} pPropertyCount On input, the number of GUIDs the <i>pPropertyGuid</i> buffer can hold. On output, the number of GUIDs the <i>pPropertyGuid</i> buffer contains.
 * @param {Pointer<Guid>} pPropertyGuid Array of properties the recognizer can return. The order of the array is arbitrary. For a list of predefined properties, see the recognition <a href="https://docs.microsoft.com/windows/desktop/tablet/property-guids">Property GUIDs</a>. To determine the required size of the buffer, set <i>pPropertyGuid</i> to <b>NULL</b>; use the number of GUIDs to allocate the buffer.
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One of the parameters is an invalid pointer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TPC_E_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>pPropertyGuid</i> buffer is too small.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid argument was received.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-getresultpropertylist
 * @since windows5.1.2600
 */
export GetResultPropertyList(hrec, pPropertyCount, pPropertyGuid) {
    pPropertyCountMarshal := pPropertyCount is VarRef ? "uint*" : "ptr"

    result := DllCall("inkobjcore.dll\GetResultPropertyList", HRECOGNIZER, hrec, pPropertyCountMarshal, pPropertyCount, Guid.Ptr, pPropertyGuid, "HRESULT")
    return result
}

/**
 * Retrieves a packet description that contains the packet properties the recognizer uses.
 * @remarks
 * Typically, recognizers use the (x, y) coordinate properties and ignore the others. If you save the ink to a file for recognition at a later time, use the preferred packet description to only save those properties that the recognizer uses.
 * @param {HRECOGNIZER} hrec Handle to the recognizer.
 * @param {Pointer<PACKET_DESCRIPTION>} pPacketDescription Describes the content of the packets the recognizer uses. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/tpcshrd/ns-tpcshrd-packet_description">PACKET_DESCRIPTION</a> structure.
 * 
 * To retrieve the packet description, initialize the packet description with zeroes and call the <b>GetPreferredPacketDescription</b> function. The function populates the property and button counts, which you use to allocate space for the pPacketProperties and pguidButtons members of the <a href="https://docs.microsoft.com/windows/desktop/api/tpcshrd/ns-tpcshrd-packet_description">PACKET_DESCRIPTION</a> structure. Call the function again to populate the rest of the packet description.
 * 
 * The pguidButtons member of the <a href="https://docs.microsoft.com/windows/desktop/api/tpcshrd/ns-tpcshrd-packet_description">PACKET_DESCRIPTION</a> structure may be zero when <b>GetPreferredPacketDescription</b> returns. This means the packets have no button data, so this member does not have any pguidButtons allocated. In this case, the calling function should leave the pointer <b>NULL</b>.
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The parameter is an invalid pointer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TPC_E_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>pPacketDescription</i> buffer is too small.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid argument was received.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-getpreferredpacketdescription
 * @since windows5.1.2600
 */
export GetPreferredPacketDescription(hrec, pPacketDescription) {
    result := DllCall("inkobjcore.dll\GetPreferredPacketDescription", HRECOGNIZER, hrec, PACKET_DESCRIPTION.Ptr, pPacketDescription, "HRESULT")
    return result
}

/**
 * Returns the ranges of Unicode points that the recognizer supports.
 * @remarks
 * This function is optional.
 * 
 * Some recognizers do not support this capability, but may still include the <b>GetUnicodeRanges Function</b> function. For such recognizers the <b>GetUnicodeRanges</b> function returns E_NOTIMPL.
 * 
 * To control the Unicode ranges used by a specific recognizer context, use the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-getenabledunicoderanges">GetEnabledUnicodeRanges</a> and <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-setenabledunicoderanges">SetEnabledUnicodeRanges</a> functions. These ranges are constrained to be a subset of the ranges returned by <b>GetUnicodeRanges</b>.
 * 
 * Microsoft gesture recognizers use Unicode characters from 0xF000 to 0xF0FF. Each single Unicode value in this range represents a single gesture. For a complete list of Unicode values for gestures, see <a href="https://docs.microsoft.com/windows/desktop/tablet/unicode-range-values-of-gestures">Unicode Range Values of Gestures</a>.
 * @param {HRECOGNIZER} hrec Handle to the recognizer.
 * @param {Pointer<Integer>} pcRanges On input, the number of ranges the <i>pcr</i> buffer can hold. On output, the number of ranges the <i>pcr</i> buffer contains.
 * @param {Pointer<CHARACTER_RANGE>} pcr Array of <a href="https://docs.microsoft.com/windows/desktop/api/rectypes/ns-rectypes-character_range">CHARACTER_RANGE</a> structures. Each structure contains a range of Unicode points that the recognizer supports. The order of the array is arbitrary. To determine the required size of the buffer, set <i>pcr</i> to <b>NULL</b>; use the number of ranges to allocate the <i>pcr</i> buffer.
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One of the parameters is an invalid pointer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TPC_E_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>pcr</i> buffer is too small.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid argument was received.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_OUTOFMEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Insufficient memory.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-getunicoderanges
 * @since windows5.1.2600
 */
export GetUnicodeRanges(hrec, pcRanges, pcr) {
    pcRangesMarshal := pcRanges is VarRef ? "uint*" : "ptr"

    result := DllCall("inkobjcore.dll\GetUnicodeRanges", HRECOGNIZER, hrec, pcRangesMarshal, pcRanges, CHARACTER_RANGE.Ptr, pcr, "HRESULT")
    return result
}

/**
 * Adds an ink stroke to the RecognizerContext.
 * @remarks
 * The recognizer must return properties such as <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognitionalternate-get_baseline">Baseline</a> in ink space coordinates rather than tablet coordinates.
 * 
 * It is recommended that your recognizer place a limit on the number of strokes per context and/or the points allowed in a given stroke. Limit input to 1024 strokes per context and 32767 points per stroke.
 * 
 * Strokes with zero points are not allowed. You should return E_FAIL in such a case.
 * @param {HRECOCONTEXT} hrc The handle to the recognizer context.
 * @param {Pointer<PACKET_DESCRIPTION>} pPacketDesc Describes the contents of the packets. The description must match the contents of the packets in <i>pPacket</i>. If <b>NULL</b>, this function uses the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-getpreferredpacketdescription">GetPreferredPacketDescription</a> function.
 * @param {Integer} cbPacket Size, in bytes, of the <i>pPacket</i> buffer.
 * @param {Pointer<Integer>} pPacket Array of packets that contain tablet space coordinates.
 * @param {Pointer<XFORM>} pXForm Describes the transform that can be applied to ink to transform it from tablet space into ink space. A recognizer may choose to ignore this transform and implement their own ink rotation algorithms. These recognizers should still return properties calculated in the lattice data relative to this transform.
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One of the parameters is an invalid pointer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_OUTOFMEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Unable to allocate memory to complete the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TPC_E_INVALID_PACKET_DESCRIPTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The packet description does not contain the necessary information for the packet to be considered valid. For example, it does not include a GUID_X or GUID_Y property.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TPC_E_OUT_OF_ORDER_CALL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The call to the method was made out of order.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid argument was received.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-addstroke
 * @since windows5.1.2600
 */
export AddStroke(hrc, pPacketDesc, cbPacket, pPacket, pXForm) {
    pPacketMarshal := pPacket is VarRef ? "char*" : "ptr"

    result := DllCall("inkobjcore.dll\AddStroke", HRECOCONTEXT, hrc, PACKET_DESCRIPTION.Ptr, pPacketDesc, "uint", cbPacket, pPacketMarshal, pPacket, XFORM.Ptr, pXForm, "HRESULT")
    return result
}

/**
 * Retrieves the best result string.
 * @param {HRECOCONTEXT} hrc Handle to the recognizer context.
 * @param {Pointer<Integer>} pcSize On input, the number of characters the <i>pwcBestResult</i> buffer can hold. On output, the number of characters the <i>pwcBestResult</i> buffer contains. If <i>pwcBestResult</i> is <b>NULL</b>, the function returns the required size of the buffer that you use to allocate the <i>pwcBestResult</i> buffer.
 * @param {PWSTR} pwcBestResult Recognition result. If the buffer is too small, the function truncates the string. The string is not <b>NULL</b>-terminated. To determine the required size of the buffer, set <i>pwcBestResult</i> to <b>NULL</b>; use <i>pcSize</i> to allocate the <i>pwcBestResult</i> buffer.
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * For Latin and East Asian recognizers this result in combination with an empty string in <i>pwcBestResult</i> means that no recognition result exists.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TPC_S_TRUNCATED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The string is truncated to fit in the <i>pwcBestResult</i> buffer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One of the parameters is an invalid pointer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid argument was received.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_UNEXPECTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Unexpected parameter or property type.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TPC_E_NOT_RELEVANT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The recognizer context does not contain results. 
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-getbestresultstring
 * @since windows5.1.2600
 */
export GetBestResultString(hrc, pcSize, pwcBestResult) {
    pwcBestResult := pwcBestResult is String ? StrPtr(pwcBestResult) : pwcBestResult

    pcSizeMarshal := pcSize is VarRef ? "uint*" : "ptr"

    result := DllCall("inkobjcore.dll\GetBestResultString", HRECOCONTEXT, hrc, pcSizeMarshal, pcSize, "ptr", pwcBestResult, "HRESULT")
    return result
}

/**
 * This function is obsolete and need not be implemented by custom application recognizers.
 * @param {HRECOALT} hrcalt N/A
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-destroyalternate
 * @since windows5.1.2600
 */
export DestroyAlternate(hrcalt) {
    result := DllCall("inkobjcore.dll\DestroyAlternate", HRECOALT, hrcalt, "HRESULT")
    return result
}

/**
 * Sets the recognition guide to use for boxed or lined input. You must call this function before you add strokes to the context.
 * @remarks
 * Guide boxes are numbered based on the <i>iIntex</i> value.
 * @param {HRECOCONTEXT} hrc Handle to the recognizer context.
 * @param {Pointer<RECO_GUIDE>} pGuide Guide to use for box or line input. Setting this parameter to <b>NULL</b> means that the context has no guide. This is the default and means the recognizer is in free input mode. For guide details, see the <a href="https://docs.microsoft.com/windows/desktop/api/rectypes/ns-rectypes-reco_guide">RECO_GUIDE</a> structure.
 * @param {Integer} iIndex Index value to use for the first box or line in the context.
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The context is invalid or one of the parameters is an invalid pointer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_OUTOFMEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Unable to allocate memory to complete the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Attempted to set a recognition mode (free, lined, boxed, and so on) that is not supported by the recognizer, or the RECO_GUIDE field values are illegal (negative heights or widths, for example).
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TPC_E_OUT_OF_ORDER_CALL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Attempted to set guide when there was already some ink in the reco context, or, in the case of recognizers of East Asian characters, <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-setcacmode">SetCACMode</a> was called previously.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-setguide
 * @since windows5.1.2600
 */
export SetGuide(hrc, pGuide, iIndex) {
    result := DllCall("inkobjcore.dll\SetGuide", HRECOCONTEXT, hrc, RECO_GUIDE.Ptr, pGuide, "uint", iIndex, "HRESULT")
    return result
}

/**
 * Retrieves the guide used for boxed, lined, or freeform input.
 * @param {HRECOCONTEXT} hrc The handle to the recognizer context.
 * @param {Pointer<RECO_GUIDE>} pGuide A guide used for boxed, lined, or freeform input. For guide details, see the <a href="https://docs.microsoft.com/windows/desktop/api/rectypes/ns-rectypes-reco_guide">RECO_GUIDE</a> structure.
 * @param {Pointer<Integer>} piIndex Index value of the first box or line in the context.
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_FALSE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The context does not contain a guide.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid argument was received.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One of the parameters is an invalid pointer.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-getguide
 * @since windows5.1.2600
 */
export GetGuide(hrc, pGuide, piIndex) {
    piIndexMarshal := piIndex is VarRef ? "uint*" : "ptr"

    result := DllCall("inkobjcore.dll\GetGuide", HRECOCONTEXT, hrc, RECO_GUIDE.Ptr, pGuide, piIndexMarshal, piIndex, "HRESULT")
    return result
}

/**
 * Stops the recognizer from processing ink because a stroke has been added or deleted.
 * @remarks
 * The <b>AdviseInkChange</b> function signals that there will be additional calls to the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-addstroke">AddStroke</a> function. This enables any recognition already in progress to stop at any convenient point. Recognition completion is one such point, so <b>AdviseInkChange</b> can safely do nothing.
 * 
 * For example, if you have two threads, one thread may be using <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-addstroke">AddStroke</a> and <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-process">Process</a> with other functions to obtain results. The other thread may be collecting ink, echoing it, and queuing tasks for the first thread. The second thread calls <b>AdviseInkChange</b> to notify the recognizer a change is coming. This enables the first thread to return to the caller sooner than without the call to <b>AdviseInkChange</b>. The first thread can then call the recognizer again with more ink.
 * 
 * If you set the bNewStroke parameter to <b>FALSE</b> because a stroke was modified or deleted, you must also call the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-resetcontext">ResetContext</a> function, and then call the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-addstroke">AddStroke</a> function to add the strokes from the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkdisp-class">InkDisp</a> object to the recognizer context. This is done automatically if you attach the recognizer context to the <b>InkDisp</b> object.
 * @param {HRECOCONTEXT} hrc The handle to the recognizer context.
 * @param {BOOL} bNewStroke <b>TRUE</b> if adding a new stroke. Set to <b>FALSE</b> if strokes were erased, split, merged, extracted, or deleted from the Ink object.
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success. This function also returns S_OK if the recognizer does not support this function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One of the parameters is an invalid pointer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid argument was received.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-adviseinkchange
 * @since windows5.1.2600
 */
export AdviseInkChange(hrc, bNewStroke) {
    result := DllCall("inkobjcore.dll\AdviseInkChange", HRECOCONTEXT, hrc, BOOL, bNewStroke, "HRESULT")
    return result
}

/**
 * Specifies character Autocomplete mode for character or word recognition.You cannot turn off character Autocomplete after it is set.
 * @param {HRECOCONTEXT} hrc The handle to the recognizer context.
 * @param {Integer} iMode The following table lists the possible character Autocomplete modes.
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>The character Autocomplete mode.</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="CAC_FULL"></a><a id="cac_full"></a><dl>
 * <dt><b>CAC_FULL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Recognition occurs as if all strokes have been completed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="CAC_PREFIX"></a><a id="cac_prefix"></a><dl>
 * <dt><b>CAC_PREFIX</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Recognition occurs on partial input. The order of the strokes must conform to the rules of the language.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="CAC_RANDOM"></a><a id="cac_random"></a><dl>
 * <dt><b>CAC_RANDOM</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Recognition occurs on partial input. The order of the strokes can be arbitrary.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified mode is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_NOTIMPL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The recognizer does not support this function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Either you have not called the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-setguide">SetGuide</a> function before calling this function, or the guide has more than one box.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The context is invalid or one of the parameters is an invalid pointer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TPC_E_OUT_OF_ORDER_CALL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Attempted to set guide when there was already some ink in the reco context, or, in the case of recognizers of East Asian characters, <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-setguide">SetGuide</a> was called previously.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-setcacmode
 * @since windows5.1.2600
 */
export SetCACMode(hrc, iMode) {
    result := DllCall("inkobjcore.dll\SetCACMode", HRECOCONTEXT, hrc, "int", iMode, "HRESULT")
    return result
}

/**
 * Indicates that no more ink will be added to the context.You cannot add strokes to the context after calling this function.
 * @remarks
 * The recognition results you receive after calling this function may be different from previous recognition results that were based on partial ink input.
 * 
 * The Ink Analysis API queries for the implementation of this method. If implemented, the InkAnalyzer will call it each time it performs an analysis operation. If not implemented, EndInkInput is never called. Therefore, you should only expose and implement this method if it is explicitly needed by your recognizer.
 * 
 * <div class="alert"><b>Note</b>  This function is not guaranteed to be called by all applications or operating system components, such as the Tablet PC Input Panel. Therefore, recognizers should not rely on it being called.</div>
 * <div> </div>
 * @param {HRECOCONTEXT} hrc The handle to the recognizer context.
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid argument was received.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The recognizer context handle is invalid or null.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-endinkinput
 * @since windows5.1.2600
 */
export EndInkInput(hrc) {
    result := DllCall("inkobjcore.dll\EndInkInput", HRECOCONTEXT, hrc, "HRESULT")
    return result
}

/**
 * Creates a recognizer context that contains the same settings as the original. The new recognizer context does not include the ink or recognition results of the original.
 * @remarks
 * The settings  for this context include the recognition guide, character Autocomplete mode, and any factoids that improve the recognition results. An example of a factoid may include whether the ink is a phone number, a name, or a URL. The TextContext and Wordlists are preserved in the new context.
 * @param {HRECOCONTEXT} hrc The handle to the recognizer context.
 * @param {Pointer<HRECOCONTEXT>} pCloneHrc The new recognizer context.
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>pCloneHrc</i> parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_OUTOFMEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Unable to allocate memory to complete the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid argument was received.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-clonecontext
 * @since windows5.1.2600
 */
export CloneContext(hrc, pCloneHrc) {
    result := DllCall("inkobjcore.dll\CloneContext", HRECOCONTEXT, hrc, HRECOCONTEXT.Ptr, pCloneHrc, "HRESULT")
    return result
}

/**
 * Deletes the current ink and recognition results from the context.The current settings of the recognizer context are preserved.
 * @param {HRECOCONTEXT} hrc The handle to the recognizer context.
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid argument was received.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-resetcontext
 * @since windows5.1.2600
 */
export ResetContext(hrc) {
    result := DllCall("inkobjcore.dll\ResetContext", HRECOCONTEXT, hrc, "HRESULT")
    return result
}

/**
 * Performs ink recognition synchronously.
 * @param {HRECOCONTEXT} hrc The handle to the recognizer context.
 * @param {Pointer<BOOL>} pbPartialProcessing Specify <b>TRUE</b> to process a subset of the ink. Partial processing reduces the time the recognizer spends performing recognition if more ink is expected.
 * 
 * Typically an application specifies <b>FALSE</b> to process all the ink. The function does not process all the ink if you have not called the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-endinkinput">EndInkInput</a> function.
 * 
 * The function sets the <i>pbPartialProcessing</i> parameter to <b>TRUE</b> if there is enough ink left to continue processing; otherwise, <b>FALSE</b>.
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_FALSE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function did not process the ink because the ink has been fully processed, or the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-endinkinput">EndInkInput</a> function has not been called and the recognizer does not support incremental processing of ink.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TPC_S_INTERRUPTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The process was interrupted by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-adviseinkchange">AdviseInkChange</a> function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One of the parameters is an invalid pointer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid argument was received.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-process
 */
export Process(hrc, pbPartialProcessing) {
    pbPartialProcessingMarshal := pbPartialProcessing is VarRef ? "int*" : "ptr"

    result := DllCall("inkobjcore.dll\Process", HRECOCONTEXT, hrc, pbPartialProcessingMarshal, pbPartialProcessing, "HRESULT")
    return result
}

/**
 * Specifies the factoid a recognizer uses to constrain its search for the result.You specify a factoid if an input field is of a known type, such as if the input field contains a date.
 * @remarks
 * For a list of factoids that can be passed in the <i>cwcFactoid</i> parameter, see <a href="https://docs.microsoft.com/windows/desktop/tablet/supported-factoids-from-version-1">Supported Factoids from Version 1</a>. The DEFAULT factoid listed in that topic is not a valid value to pass to <b>SetFactoid</b>; the Tablet PC Platform API's internally convert DEFAULT to <b>NULL</b> before calling the <b>SetFactoid</b> function.
 * 
 * It is recommended that you limit the length of the factoid string to no more than 32768 characters.
 * @param {HRECOCONTEXT} hrc Handle to the recognizer context.
 * @param {Integer} cwcFactoid Number of characters in <i>pwcFactoid</i>.
 * @param {PWSTR} pwcFactoid Identifies the factoid to use on the recognizer context. The string is not <b>NULL</b>-terminated.
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TPC_E_INVALID_PROPERTY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified factoid is not supported.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TPC_E_OUT_OF_ORDER_CALL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * You must call the SetFactoid function before calling the Process function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The context is invalid or one of the parameters is an invalid pointer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_NOTIMPL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The recognizer does not support this function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_OUTOFMEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Unable to allocate memory to complete the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The context contains an invalid value.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-setfactoid
 * @since windows5.1.2600
 */
export SetFactoid(hrc, cwcFactoid, pwcFactoid) {
    pwcFactoid := pwcFactoid is String ? StrPtr(pwcFactoid) : pwcFactoid

    result := DllCall("inkobjcore.dll\SetFactoid", HRECOCONTEXT, hrc, "uint", cwcFactoid, "ptr", pwcFactoid, "HRESULT")
    return result
}

/**
 * Specifies how the recognizer interprets the ink and determines the result string.Call this function before processing the ink for the first time. Therefore, call the SetFlags function before calling the Process function.
 * @remarks
 * Prior to Microsoft Windows XP Tablet PC Edition Development Kit 1.7, Tablet PC Input Panel performed smart spacing. Starting with Tablet PC SDK 1.7, Input Panel continues to produce results with preliminary spacing recommendations. Tablet PC Input Panel's spacing results may however be changed by the recognizer's recommendations (results). The recognizer is able to do this by using text contextual information (based on the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-settextcontext">SetTextContext</a> call made by Input Panel) and its internal language model rules.
 * 
 * Input Panel is able to determine whether the recognizer is capable of doing auto-spacing by calling this function with the RECOFLAG_AUTOSPACE flag set. If the recognizer does not support auto-spacing, E_INVALIDARG is returned.
 * 
 * <div class="alert"><b>Note</b>  Only line mode is supported in the <b>SetFlags</b> function. Boxed mode, free mode, and single-line mode are not supported.</div>
 * <div> </div>
 * @param {HRECOCONTEXT} hrc Handle to the recognizer context.
 * @param {Integer} dwFlags The following table lists the flags that you may set to specify how the recognizer interprets the ink and determines the result string. Use the <b>OR</b> operator (|) to combine flags as appropriate.
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Bit flag</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="RECOFLAG_AUTOSPACE"></a><a id="recoflag_autospace"></a><dl>
 * <dt><b>RECOFLAG_AUTOSPACE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Recognizer uses smart spacing based on language model rules.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="RECOFLAG_COERCE"></a><a id="recoflag_coerce"></a><dl>
 * <dt><b>RECOFLAG_COERCE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Recognizer coerces the result based on the factoid you specify for the context. For example, if you specify a phone number factoid and the user enters the word "hello", the recognizer may return a random phone number or an empty string. If you do not specify this flag, the recognizer returns "hello" as the result.
 * 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="RECOFLAG_PREFIXOK"></a><a id="recoflag_prefixok"></a><dl>
 * <dt><b>RECOFLAG_PREFIXOK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Recognizer supports the recognition of any prefix part of the strings that are defined in the default or specified (factoid) language model.
 * 
 * For example, without this flag, the user writes "handw" and the recognizer returns suggestions (such as "hander" or "handed") that are words that exist in the recognizer lexicon. With the flag, the recognizer may return "handw" as one of the suggestions since it is a valid prefix of the word "handwriting" that exists in the recognizer lexicon.
 * 
 * The Tablet PC Input Panel sets this flag in most cases, except when the input scope is IS_DEFAULT (or no input scope) or when there is no user word list or regular expression.
 * 
 * Recognizers of East Asian characters should return E_INVALIDARG when a caller passes in this flag.
 * 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="RECOFLAG_LINEMODE"></a><a id="recoflag_linemode"></a><dl>
 * <dt><b>RECOFLAG_LINEMODE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The recognizer does not split lines but must still do character and word separation. This is the same as lined mode, except that there is no guide, and all ink is assumed to be in a single line. When this flag is set, a guide, if set, is ignored.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="RECOFLAG_SINGLESEG"></a><a id="recoflag_singleseg"></a><dl>
 * <dt><b>RECOFLAG_SINGLESEG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Disables multiple segmentation. By default, the recognizer returns multiple segmentations (alternates) for the ink.
 * 
 * For example, if you write "together" as separate strokes, the recognizer may segment the ink as "to get her", "to gather", or "together". Set this flag if you do not need multiple segmentations of the ink when you query for alternates. This improves performance and reduces memory usage.
 * 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="RECOFLAG_WORDMODE"></a><a id="recoflag_wordmode"></a><dl>
 * <dt><b>RECOFLAG_WORDMODE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Recognizer treats the ink as a single word. For example, if the context contains "to get her", the recognizer returns "together".
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>HRESULT value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The flag is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_NOTIMPL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The recognizer does not support this function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_OUTOFMEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Unable to allocate memory to complete the operation.
 * 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The context is invalid or one of the parameters is an invalid pointer.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-setflags
 * @since windows5.1.2600
 */
export SetFlags(hrc, dwFlags) {
    result := DllCall("inkobjcore.dll\SetFlags", HRECOCONTEXT, hrc, "uint", dwFlags, "HRESULT")
    return result
}

/**
 * Retrieves a pointer to the lattice for the current results.
 * @param {HRECOCONTEXT} hrc The handle to the recognizer context.
 * @param {Pointer<Pointer<RECO_LATTICE>>} ppLattice The recognition results.
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_OUTOFMEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Unable to allocate memory to complete the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_NOTIMPL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The recognizer does not support this function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TPC_E_NOT_RELEVANT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The recognizer context does not contain results.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One of the parameters is an invalid pointer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid argument was received.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-getlatticeptr
 * @since windows5.1.2600
 */
export GetLatticePtr(hrc, ppLattice) {
    ppLatticeMarshal := ppLattice is VarRef ? "ptr*" : "ptr"

    result := DllCall("inkobjcore.dll\GetLatticePtr", HRECOCONTEXT, hrc, ppLatticeMarshal, ppLattice, "HRESULT")
    return result
}

/**
 * Provides the text strings that come before and after the text contained in the recognizer context.You call this function before processing the ink for the first time. Therefore, call the SetTextContext function before calling the Process function.
 * @remarks
 * The <b>SetTextContext</b> function provides context for a phrase or a word, increasing your recognizer's accuracy. For example, if the <i>pwcBefore</i><i>pwcBefore</i> string is "under the " and the <i>pwcAfter</i> string is "in the house", you can bias your recognizer using a word or words between the strings. Your recognizer should consider the space after "the" and before "in" when performing the recognition.
 * 
 * However, if the <i>pwcAfter</i> string is "Hel" and the <i>pwcBefore</i> string is "o", the lack of space between the strings indicates the recognizer should recognize one or more letters inside a word that begins with "Hel" and ends with "o".
 * 
 * It is recommended that you limit the length of the text context to no more than 1024 characters each for the left and right contexts.
 * @param {HRECOCONTEXT} hrc Handle to the recognizer context.
 * @param {Integer} cwcBefore Number of characters in <i>pwcBefore</i>.
 * @param {PWSTR} pwcBefore Text string that comes before the text contained in the recognizer context. The string is not <b>NULL</b> terminated.
 * @param {Integer} cwcAfter Number of characters in <i>pwcAfter</i>.
 * @param {PWSTR} pwcAfter Text string that comes after the text contained in the recognizer context. The string is not <b>NULL</b> -terminated.
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The context is invalid or one of the parameters is an invalid pointer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_NOTIMPL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The recognizer does not support this function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_OUTOFMEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Unable to allocate memory to complete the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid argument was specified.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-settextcontext
 * @since windows5.1.2600
 */
export SetTextContext(hrc, cwcBefore, pwcBefore, cwcAfter, pwcAfter) {
    pwcBefore := pwcBefore is String ? StrPtr(pwcBefore) : pwcBefore
    pwcAfter := pwcAfter is String ? StrPtr(pwcAfter) : pwcAfter

    result := DllCall("inkobjcore.dll\SetTextContext", HRECOCONTEXT, hrc, "uint", cwcBefore, "ptr", pwcBefore, "uint", cwcAfter, "ptr", pwcAfter, "HRESULT")
    return result
}

/**
 * Retrieves a list of Unicode point ranges enabled on the context. If you do not call the SetEnabledUnicodeRanges function to specify the enabled ranges, this function returns the recognizer's default Unicode point ranges.
 * @remarks
 * This function is optional.
 * 
 * Some recognizers do not support enabling and disabling specific Unicode points, but may still include the <b>GetEnabledUnicodeRanges</b> function. For such recognizers the <b>GetEnabledUnicodeRanges</b> function returns the same ranges as the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-getunicoderanges">GetUnicodeRanges</a> function.
 * 
 * Microsoft gesture recognizers use Unicode characters from 0xF000 to 0xF0FF. Each single Unicode value in this range represents a single gesture. For a complete list of Unicode values for gestures, see <a href="https://docs.microsoft.com/windows/desktop/tablet/unicode-range-values-of-gestures">Unicode Range Values of Gestures</a>.
 * @param {HRECOCONTEXT} hrc The handle to the recognizer context.
 * @param {Pointer<Integer>} pcRanges On input, the number of <a href="https://docs.microsoft.com/windows/desktop/api/rectypes/ns-rectypes-character_range">CHARACTER_RANGE</a> structures the <i>pcr</i> buffer can contain. On output, the number of ranges the <i>pcr</i> buffer contains.
 * @param {Pointer<CHARACTER_RANGE>} pcr An array of CHARACTER_RANGE structures. Each structure contains a range of Unicode points enabled on the context. The order of the array is arbitrary. To determine the size of the buffer, set <i>pcr</i> to <b>NULL</b>; use the number of ranges to allocate the <i>pcr</i> buffer.
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One of the parameters is an invalid pointer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid argument was received.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TPC_E_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>pcr</i> buffer is too small.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_OUTOFMEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Insufficient memory.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-getenabledunicoderanges
 * @since windows5.1.2600
 */
export GetEnabledUnicodeRanges(hrc, pcRanges, pcr) {
    pcRangesMarshal := pcRanges is VarRef ? "uint*" : "ptr"

    result := DllCall("inkobjcore.dll\GetEnabledUnicodeRanges", HRECOCONTEXT, hrc, pcRangesMarshal, pcRanges, CHARACTER_RANGE.Ptr, pcr, "HRESULT")
    return result
}

/**
 * Enables one or more Unicode point ranges on the context.
 * @remarks
 * The <b>SetEnabledUnicodeRanges</b> function is optional.
 * 
 * Some recognizers do not support enabling and disabling specific code points, but may still include the <b>SetEnabledUnicodeRanges</b> function. For such recognizers, the <b>SetEnabledUnicodeRanges</b> function returns E_NOTIMPL.
 * 
 * Each recognizer supports one or more Unicode point ranges. To determine which Unicode point ranges the recognizer supports, call the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-getunicoderanges">GetUnicodeRanges</a> function. If you do not call this function, the recognizer uses a default set of Unicode point ranges. The default ranges are recognizer specific.
 * 
 * The Microsoft gesture recognizer uses Unicode characters from 0xF000 to 0xF0FF. Each single Unicode value in this range represents a single gesture. For a complete list of Unicode values for gestures, see <a href="https://docs.microsoft.com/windows/desktop/tablet/unicode-range-values-of-gestures">Unicode Range Values of Gestures</a>.
 * @param {HRECOCONTEXT} hrc The handle to the recognizer context.
 * @param {Integer} cRanges The number of ranges in the <i>pRanges</i> buffer.
 * @param {Pointer<CHARACTER_RANGE>} pcr An array of <a href="https://docs.microsoft.com/windows/desktop/api/rectypes/ns-rectypes-character_range">CHARACTER_RANGE</a> structures. Each structure identifies a range of Unicode points that you want to enable in the recognizer. The order of the array is arbitrary.
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TPC_S_TRUNCATED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The recognizer does not support one of the specified Unicode point ranges.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid argument was received.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One of the parameters is an invalid pointer.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-setenabledunicoderanges
 * @since windows5.1.2600
 */
export SetEnabledUnicodeRanges(hrc, cRanges, pcr) {
    result := DllCall("inkobjcore.dll\SetEnabledUnicodeRanges", HRECOCONTEXT, hrc, "uint", cRanges, CHARACTER_RANGE.Ptr, pcr, "HRESULT")
    return result
}

/**
 * Retrieves a list of properties the recognizer supports.
 * @remarks
 * This function is optional.
 * 
 * When Microsoft recognition engines are called with the <i>pcProperties</i> parameter set to a value larger than the required value, it does not result in an error. Instead, the engine automatically changes the size to the required value for the recognizer.
 * @param {HRECOCONTEXT} hrc The handle to the recognizer context.
 * @param {Pointer<Integer>} pcProperties On input, the size, in bytes, the <i>pPropertyGUIDS</i> buffer can be. On output, the size, in bytes, the <i>pPropertyGUIDS</i> buffer is.
 * @param {Pointer<Guid>} pPropertyGUIDS The user-allocated buffer to contain a list of properties the recognizer supports. To determine the size of the buffer, set <i>pPropertyGUIDS</i> to <b>NULL</b>; use the size (<i>pcProperties</i>) to allocate <i>pPropertyGUIDS</i>. For a list of predefined properties, see the recognition <a href="https://docs.microsoft.com/windows/desktop/tablet/property-guids">Property GUIDs</a>.
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One of the parameters is an invalid pointer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid argument was received.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TPC_E_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>ppPropertyGUIDS</i> buffer is too small.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-getcontextpropertylist
 * @since windows5.1.2600
 */
export GetContextPropertyList(hrc, pcProperties, pPropertyGUIDS) {
    pcPropertiesMarshal := pcProperties is VarRef ? "uint*" : "ptr"

    result := DllCall("inkobjcore.dll\GetContextPropertyList", HRECOCONTEXT, hrc, pcPropertiesMarshal, pcProperties, Guid.Ptr, pPropertyGUIDS, "HRESULT")
    return result
}

/**
 * Returns a specified property value from the recognizer context.
 * @remarks
 * This function is optional.
 * 
 * You can use the <b>GetContextPropertyValue</b> function to get information that the recognizer is returning to the caller. This enables a customized recognizer to have modes and settings, and to return data that is unique to that recognizer.
 * 
 * In the Microsoft recognizers, calling the <b>GetContextPropertyValue</b> function with the <i>pcbSize</i> parameter set to a value larger than required does not result in an incorrect return value. Instead, the code automatically changes the size to the required value for the current GUID.
 * @param {HRECOCONTEXT} hrc The handle to the recognizer context.
 * @param {Pointer<Guid>} pGuid The property to retrieve. Specify a predefined property globally unique identifier (GUID) or application-defined GUID. For a list of predefined properties, see the recognition <a href="https://docs.microsoft.com/windows/desktop/tablet/property-guids">Property GUIDs</a>.
 * @param {Pointer<Integer>} pcbSize On input, the size, in bytes, the <i>pProperty </i> buffer can be. On output, the size, in bytes, the <i>pProperty</i> buffer is.
 * @param {Pointer<Integer>} pProperty The user allocated buffer to contain the property value. To determine the size of the buffer, set <i>pProperty</i> to <b>NULL</b>; use the size to allocate <i>pProperty</i>.
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One of the parameters is an invalid pointer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid argument was received.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TPC_E_UNINITIALIZED_PROPERTY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The property has not been set by the context. This may occur if the property is set only in certain circumstances, or if the property is to be set only after an event that has not yet occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TPC_E_INVALID_PROPERTY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The recognizer does not support the property.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TPC_E_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>pProperty</i> buffer is too small.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-getcontextpropertyvalue
 * @since windows5.1.2600
 */
export GetContextPropertyValue(hrc, pGuid, pcbSize, pProperty) {
    pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"
    pPropertyMarshal := pProperty is VarRef ? "char*" : "ptr"

    result := DllCall("inkobjcore.dll\GetContextPropertyValue", HRECOCONTEXT, hrc, Guid.Ptr, pGuid, pcbSizeMarshal, pcbSize, pPropertyMarshal, pProperty, "HRESULT")
    return result
}

/**
 * Adds a property to the recognizer context.If a property already exists, its value is modified.
 * @remarks
 * The <b>SetContextPropertyValue</b> function is optional.
 * @param {HRECOCONTEXT} hrc The handle to the recognizer context.
 * @param {Pointer<Guid>} pGuid The property to set. Specify a predefined property globally unique identifier (GUID) or application-defined property GUID. For a list of predefined properties, see the recognition <a href="https://docs.microsoft.com/windows/desktop/tablet/property-guids">Property GUIDs</a>.
 * @param {Integer} cbSize The size, in bytes, of the <i>pProperty</i> buffer.
 * @param {Pointer<Integer>} pProperty The buffer that contains the property value.
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * <i>pGUID</i> is invalid or <i>cbSize</i> has been set to a very large, invalid value.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TPC_E_INVALID_PROPERTY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * <i>pGUID</i> is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * <i>cbSize</i> is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_FALSE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returned when an attempt is made to set a property value when it has already been enabled.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-setcontextpropertyvalue
 * @since windows5.1.2600
 */
export SetContextPropertyValue(hrc, pGuid, cbSize, pProperty) {
    pPropertyMarshal := pProperty is VarRef ? "char*" : "ptr"

    result := DllCall("inkobjcore.dll\SetContextPropertyValue", HRECOCONTEXT, hrc, Guid.Ptr, pGuid, "uint", cbSize, pPropertyMarshal, pProperty, "HRESULT")
    return result
}

/**
 * Returns a value that indicates whether a word, date, time, number, or other text that is passed in is contained in the dictionary.The results of this test depend on the factoid setting.
 * @remarks
 * This function is optional.
 * 
 * The results of this test depend on the factoid setting. For example, if the factoid setting is set to default, then "hello","555-1234", and "10/19/2002" all return S_OK. However, if the factoid is set to TELEPHONE, only "555-1234" returns S_OK, the others return S_FALSE. For more information about factoids, see <a href="https://docs.microsoft.com/windows/desktop/tablet/supported-factoids-from-version-1">Supported Factoids from Version 1</a>.
 * 
 * Note that this function should take into consideration any information specified in <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-settextcontext">SetTextContext</a> when returning a value. For example, if the recognizer receives calls to SetTextContext ("http:", "") and receives a URL factoid, SetFactoid ((!IS_URL)) then IsStringSupported("www.microsoft.com") should return S_FALSE because it is missing the "//".
 * 
 * The COERCE flag has no effect on IsStringSupported.
 * @param {HRECOCONTEXT} hrc The handle to the recognizer context.
 * @param {Integer} wcString The count, in Unicode (wide) characters, of <i>pwcString</i>.
 * @param {PWSTR} pwcString The Unicode (wide) characters to test.
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * This function also returns S_OK if the recognizer does not support this function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_OUTOFMEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Unable to allocate memory to complete the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_FALSE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The string is not supported.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One of the parameters is an invalid pointer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid argument was received.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-isstringsupported
 * @since windows5.1.2600
 */
export IsStringSupported(hrc, wcString, pwcString) {
    pwcString := pwcString is String ? StrPtr(pwcString) : pwcString

    result := DllCall("inkobjcore.dll\IsStringSupported", HRECOCONTEXT, hrc, "uint", wcString, "ptr", pwcString, "HRESULT")
    return result
}

/**
 * Sets the word list for the current recognizer context to recognize.
 * @remarks
 * The word list passed in as the second parameter must already exist. You create a word list by using the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-makewordlist">MakeWordList</a> function. The <b>SetWordList</b> function does not alter the word list.
 * 
 * To clear the wordlist, pass <b>NULL</b> as the second parameter.
 * 
 * It is recommended that you limit the length of individual words in the wordlist to no more than 256 characters and limit memory allocation for wordlists to no more than 128 MB.
 * @param {HRECOCONTEXT} hrc Handle to the recognizer context.
 * @param {HRECOWORDLIST} hwl Handle to recognition word list to be used.
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The context is invalid or one of the parameters is an invalid pointer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_NOTIMPL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The recognizer does not support this function.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_OUTOFMEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Unable to allocate memory to complete the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid argument was received.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The method was called after <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-process">Process</a> has been called.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-setwordlist
 * @since windows5.1.2600
 */
export SetWordList(hrc, hwl) {
    result := DllCall("inkobjcore.dll\SetWordList", HRECOCONTEXT, hrc, HRECOWORDLIST, hwl, "HRESULT")
    return result
}

/**
 * Gets the context preference flags.
 * @param {HRECOCONTEXT} hrc The handle to the recognizer context.
 * @param {Pointer<Integer>} pdwContextPreferenceFlags The handle to the context preference flags.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-getcontextpreferenceflags
 * @since windows5.1.2600
 */
export GetContextPreferenceFlags(hrc, pdwContextPreferenceFlags) {
    pdwContextPreferenceFlagsMarshal := pdwContextPreferenceFlags is VarRef ? "uint*" : "ptr"

    result := DllCall("inkobjcore.dll\GetContextPreferenceFlags", HRECOCONTEXT, hrc, pdwContextPreferenceFlagsMarshal, pdwContextPreferenceFlags, "HRESULT")
    return result
}

/**
 * Gets the right separator for the recognizer context.
 * @param {HRECOCONTEXT} hrc The handle to the recognizer context.
 * @param {Pointer<Integer>} pcSize A pointer to the size of the right separator.
 * @param {PWSTR} pwcRightSeparator A pointer to the right separator.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-getrightseparator
 * @since windows5.1.2600
 */
export GetRightSeparator(hrc, pcSize, pwcRightSeparator) {
    pwcRightSeparator := pwcRightSeparator is String ? StrPtr(pwcRightSeparator) : pwcRightSeparator

    pcSizeMarshal := pcSize is VarRef ? "uint*" : "ptr"

    result := DllCall("inkobjcore.dll\GetRightSeparator", HRECOCONTEXT, hrc, pcSizeMarshal, pcSize, "ptr", pwcRightSeparator, "HRESULT")
    return result
}

/**
 * Gets the left separator for the recognizer context.
 * @param {HRECOCONTEXT} hrc The handle to the recognizer context.
 * @param {Pointer<Integer>} pcSize A pointer to the size of the left separator.
 * @param {PWSTR} pwcLeftSeparator A pointer to the left separator.
 * @returns {HRESULT} If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-getleftseparator
 * @since windows5.1.2600
 */
export GetLeftSeparator(hrc, pcSize, pwcLeftSeparator) {
    pwcLeftSeparator := pwcLeftSeparator is String ? StrPtr(pwcLeftSeparator) : pwcLeftSeparator

    pcSizeMarshal := pcSize is VarRef ? "uint*" : "ptr"

    result := DllCall("inkobjcore.dll\GetLeftSeparator", HRECOCONTEXT, hrc, pcSizeMarshal, pcSize, "ptr", pwcLeftSeparator, "HRESULT")
    return result
}

/**
 * Destroys the current word list.
 * @param {HRECOWORDLIST} hwl Handle to the word list.
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid argument was received.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The pointer to the word list is incorrect.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-destroywordlist
 * @since windows5.1.2600
 */
export DestroyWordList(hwl) {
    result := DllCall("inkobjcore.dll\DestroyWordList", HRECOWORDLIST, hwl, "HRESULT")
    return result
}

/**
 * Adds one or more words to the word list.
 * @param {HRECOWORDLIST} hwl Handle to the word list.
 * @param {PWSTR} pwcWords Words to add to the word list. Separate words in this list with a \0 character and end the list with two \0 characters. Words that already exist in the list are not added.
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid argument was received.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returned when the word list handle parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The pointer to the word list is incorrect.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-addwordstowordlist
 * @since windows5.1.2600
 */
export AddWordsToWordList(hwl, pwcWords) {
    pwcWords := pwcWords is String ? StrPtr(pwcWords) : pwcWords

    result := DllCall("inkobjcore.dll\AddWordsToWordList", HRECOWORDLIST, hwl, "ptr", pwcWords, "HRESULT")
    return result
}

/**
 * Creates a word list.
 * @param {HRECOGNIZER} hrec Handle to the recognizer.
 * @param {PWSTR} pBuffer Words to insert into the new word list. Separate words in this list with a \0 character and end the list with two \0 characters.
 * @param {Pointer<HRECOWORDLIST>} phwl Handle to the new word list.
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The pointer to the word list is incorrect.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid argument was received.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_OUTOFMEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Unable to allocate memory to complete the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>TPC_S_TRUNCATED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An error is found in one of the words in the list. Possible errors include unsupported characters, spaces at the start or the end of the word or more than a single space between words. All words up to the incorrect word are added to the word list.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-makewordlist
 * @since windows5.1.2600
 */
export MakeWordList(hrec, pBuffer, phwl) {
    pBuffer := pBuffer is String ? StrPtr(pBuffer) : pBuffer

    result := DllCall("inkobjcore.dll\MakeWordList", HRECOGNIZER, hrec, "ptr", pBuffer, HRECOWORDLIST.Ptr, phwl, "HRESULT")
    return result
}

/**
 * Gets all recognizers.
 * @param {Pointer<Pointer<Guid>>} recognizerClsids Pointer to the CLSIDs of the recognizers. The CLSID value is created in the registry when you register the recognizer.
 * @param {Pointer<Integer>} count Pointer to the number of recognizers.
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The parameter is an invalid pointer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid argument was received.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-getallrecognizers
 * @since windows5.1.2600
 */
export GetAllRecognizers(recognizerClsids, count) {
    recognizerClsidsMarshal := recognizerClsids is VarRef ? "ptr*" : "ptr"
    countMarshal := count is VarRef ? "uint*" : "ptr"

    result := DllCall("inkobjcore.dll\GetAllRecognizers", recognizerClsidsMarshal, recognizerClsids, countMarshal, count, "HRESULT")
    return result
}

/**
 * Loads the cached attributes of a recognizer.
 * @param {Guid} clsid The CLSID of the recognizer. This value is created in the registry when you register the recognizer.
 * @param {Pointer<RECO_ATTRS>} pRecoAttributes Pointer to the recognizer attributes.
 * @returns {HRESULT} This function can return one of these values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_OK</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Success.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_POINTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The parameter is an invalid pointer.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_INVALIDARG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid argument was received.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-loadcachedattributes
 * @since windows5.1.2600
 */
export LoadCachedAttributes(clsid, pRecoAttributes) {
    result := DllCall("inkobjcore.dll\LoadCachedAttributes", Guid, clsid, RECO_ATTRS.Ptr, pRecoAttributes, "HRESULT")
    return result
}

;@endregion Functions
