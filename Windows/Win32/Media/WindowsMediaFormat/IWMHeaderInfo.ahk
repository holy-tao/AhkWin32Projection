#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMHeaderInfo interface sets and retrieves information in the header section of an ASF file.
 * @remarks
 * 
 * Although the <b>IWMHeaderInfo</b> interface is accessible from four different objects, not all of the features are available in all cases. The following table summarizes the differences in implementation for the various objects.
 * 
 * <table>
 * <tr>
 * <th>Object
 *             </th>
 * <th>Description
 *             </th>
 * </tr>
 * <tr>
 * <td>Metadata editor</td>
 * <td>Full functionality is implemented.</td>
 * </tr>
 * <tr>
 * <td>Writer</td>
 * <td>All methods that alter header items (those whose names begin with Add, Set, or Remove) are supported only before the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriter-beginwriting">IWMWriter::BeginWriting</a> method is called.All marker methods return E_NOTIMPL.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>Reader and synchronous reader</td>
 * <td>All methods that alter header items (those whose names begin with Add, Set, or Remove) return E_NOTIMPL.</td>
 * </tr>
 * </table>
 *  
 * 
 * For information about using the writer for metadata editing, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/to-edit-metadata-with-the-writer">To Edit Metadata with the Writer</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmheaderinfo
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMHeaderInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMHeaderInfo
     * @type {Guid}
     */
    static IID => Guid("{96406bda-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAttributeCount", "GetAttributeByIndex", "GetAttributeByName", "SetAttribute", "GetMarkerCount", "GetMarker", "AddMarker", "RemoveMarker", "GetScriptCount", "GetScript", "AddScript", "RemoveScript"]

    /**
     * The GetAttributeCount method returns the number of attributes defined in the header section of the ASF file. This method is replaced by IWMHeaderInfo3::GetAttributeCountEx and IWMHeaderInfo3::GetAttributeIndices, and should no longer be used.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number. Pass zero for file-level attributes.
     * @returns {Integer} Pointer to a count of the attributes.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmheaderinfo-getattributecount
     */
    GetAttributeCount(wStreamNum) {
        result := ComCall(3, this, "ushort", wStreamNum, "ushort*", &pcAttributes := 0, "HRESULT")
        return pcAttributes
    }

    /**
     * The GetAttributeByIndex method returns a descriptive attribute that is stored in the header section of the ASF file. This method is replaced by IWMHeaderInfo3::GetAttributeByIndexEx and should not be used.
     * @param {Integer} wIndex <b>WORD</b> containing the index.
     * @param {Pointer<Integer>} pwStreamNum Pointer to a <b>WORD</b> containing the stream number. Although this parameter is a pointer, the method will not change the value. For file-level attributes, use zero for the stream number.
     * @param {PWSTR} pwszName Pointer to a wide-character <b>null</b>-terminated string containing the name. Pass <b>NULL</b> to this parameter to retrieve the required length for the name. Attribute names are limited to 1024 wide characters.
     * @param {Pointer<Integer>} pcchNameLen On input, a pointer to a variable containing the length of the <i>pwszName</i> array in wide characters (2 bytes). On output, if the method succeeds, the variable contains the actual length of the name, including the terminating <b>null</b> character.
     * @param {Pointer<Integer>} pType Pointer to a variable containing one value from the <b>WMT_ATTR_DATATYPE</b> enumeration type.
     * @param {Pointer<Integer>} pValue Pointer to a byte array containing the value. Pass <b>NULL</b> to this parameter to retrieve the required length for the value.
     * @param {Pointer<Integer>} pcbLength On input, a pointer to a variable containing the length of the <i>pValue</i> array, in bytes. On output, if the method succeeds, the variable contains the actual number of bytes written to <i>pValue</i> by the method.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is not in a valid state, or no profile has been set.
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
     * <i>pwStreamNum</i> does not point to a valid stream number, or no data type was supplied.
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
     * A pointer supplied in a parameter was not valid.
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
     * The method failed for an unspecified reason.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ASF_E_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pValue</i> array is too small to contain the attribute value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ASF_E_NOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no attribute at <i>wIndex</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmheaderinfo-getattributebyindex
     */
    GetAttributeByIndex(wIndex, pwStreamNum, pwszName, pcchNameLen, pType, pValue, pcbLength) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        pwStreamNumMarshal := pwStreamNum is VarRef ? "ushort*" : "ptr"
        pcchNameLenMarshal := pcchNameLen is VarRef ? "ushort*" : "ptr"
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        pValueMarshal := pValue is VarRef ? "char*" : "ptr"
        pcbLengthMarshal := pcbLength is VarRef ? "ushort*" : "ptr"

        result := ComCall(4, this, "ushort", wIndex, pwStreamNumMarshal, pwStreamNum, "ptr", pwszName, pcchNameLenMarshal, pcchNameLen, pTypeMarshal, pType, pValueMarshal, pValue, pcbLengthMarshal, pcbLength, "HRESULT")
        return result
    }

    /**
     * The GetAttributeByName method returns a descriptive attribute that is stored in the header section of the ASF file.
     * @param {Pointer<Integer>} pwStreamNum Pointer to a <b>WORD</b> containing the stream number, or zero to indicate any stream. Although this parameter is a pointer, the method does not change the value.
     * @param {PWSTR} pszName Pointer to a <b>null</b>-terminated string containing the name of the attribute. Attribute names are limited to 1024 wide characters.
     * @param {Pointer<Integer>} pType Pointer to a variable that receives a value from the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_attr_datatype">WMT_ATTR_DATATYPE</a> enumeration type. The returned value specifies the data type of the attribute.
     * @param {Pointer<Integer>} pValue Pointer to a byte array that receives the value of the attribute. The caller must allocate the array. To determine the required array size, set this parameter to <b>NULL</b> and check the value returned in the <i>pcbLength</i> parameter.
     * @param {Pointer<Integer>} pcbLength On input, the length of the <i>pValue</i> array, in bytes. On output, if the method succeeds, the actual number of bytes that were written to <i>pValue</i>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ASF_E_NOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified attribute is not defined in this file.
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
     * <i>pwStreamNum</i> is not a valid stream number, <i>pszName</i> does not point to a wide-character string, or another parameter does not contain a valid value.
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
     * A parameter is not a valid pointer.
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
     * The method failed for an unspecified reason.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is not in a configurable state, or no profile has been set.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmheaderinfo-getattributebyname
     */
    GetAttributeByName(pwStreamNum, pszName, pType, pValue, pcbLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pwStreamNumMarshal := pwStreamNum is VarRef ? "ushort*" : "ptr"
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"
        pValueMarshal := pValue is VarRef ? "char*" : "ptr"
        pcbLengthMarshal := pcbLength is VarRef ? "ushort*" : "ptr"

        result := ComCall(5, this, pwStreamNumMarshal, pwStreamNum, "ptr", pszName, pTypeMarshal, pType, pValueMarshal, pValue, pcbLengthMarshal, pcbLength, "HRESULT")
        return result
    }

    /**
     * The SetAttribute method sets a descriptive attribute that is stored in the header section of the ASF file. This method is replaced by IWMHeaderInfo3::AddAttribute, and should not be used.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number. To set a file-level attribute, pass zero.
     * @param {PWSTR} pszName Pointer to a wide-character null-terminated string containing the name of the attribute. Attribute names are limited to 1024 wide characters.
     * @param {Integer} Type A value from the <b>WMT_ATTR_DATATYPE</b> enumeration type.
     * @param {Pointer<Integer>} pValue Pointer to a byte array containing the value of the attribute.
     * @param {Integer} cbLength The size of <i>pValue</i>, in bytes.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
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
     * A parameter does not contain a valid value.
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
     * Not implemented.
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
     * The method failed for an unspecified reason.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is not in a configurable state, or no profile has been set.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmheaderinfo-setattribute
     */
    SetAttribute(wStreamNum, pszName, Type, pValue, cbLength) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pValueMarshal := pValue is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "ushort", wStreamNum, "ptr", pszName, "int", Type, pValueMarshal, pValue, "ushort", cbLength, "HRESULT")
        return result
    }

    /**
     * The GetMarkerCount method returns the number of markers currently in the header section of the ASF file.
     * @returns {Integer} Pointer to a count of markers.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmheaderinfo-getmarkercount
     */
    GetMarkerCount() {
        result := ComCall(7, this, "ushort*", &pcMarkers := 0, "HRESULT")
        return pcMarkers
    }

    /**
     * The GetMarker method returns the name and time of a marker.
     * @param {Integer} wIndex <b>WORD</b> containing the index.
     * @param {PWSTR} pwszMarkerName Pointer to a wide-character <b>null</b>-terminated string containing the marker name.
     * @param {Pointer<Integer>} pcchMarkerNameLen On input, a pointer to a variable containing the length of the <i>pwszMarkerName</i> array in wide characters (2 bytes). On output, if the method succeeds, the variable contains the actual length of the name, including the terminating <b>null</b> character. To retrieve the length of the name, you must set this to zero and set <i>pwszMarkerName</i> and <i>pcnsMarkerTime</i> to <b>NULL</b>.
     * @returns {Integer} Pointer to a variable specifying the marker time in 100-nanosecond increments.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmheaderinfo-getmarker
     */
    GetMarker(wIndex, pwszMarkerName, pcchMarkerNameLen) {
        pwszMarkerName := pwszMarkerName is String ? StrPtr(pwszMarkerName) : pwszMarkerName

        pcchMarkerNameLenMarshal := pcchMarkerNameLen is VarRef ? "ushort*" : "ptr"

        result := ComCall(8, this, "ushort", wIndex, "ptr", pwszMarkerName, pcchMarkerNameLenMarshal, pcchMarkerNameLen, "uint*", &pcnsMarkerTime := 0, "HRESULT")
        return pcnsMarkerTime
    }

    /**
     * The AddMarker method adds a marker, consisting of a name and a specific time, to the header section of the ASF file.
     * @param {PWSTR} pwszMarkerName Pointer to a wide-character null-terminated string containing the marker name. Marker names are limited to 5120 wide characters.
     * @param {Integer} cnsMarkerTime The marker time in 100-nanosecond increments.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object cannot currently be configured.
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
     * <i>pwszMarkerName</i> is not a valid pointer.
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
     * The method failed for an unspecified reason.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmheaderinfo-addmarker
     */
    AddMarker(pwszMarkerName, cnsMarkerTime) {
        pwszMarkerName := pwszMarkerName is String ? StrPtr(pwszMarkerName) : pwszMarkerName

        result := ComCall(9, this, "ptr", pwszMarkerName, "uint", cnsMarkerTime, "HRESULT")
        return result
    }

    /**
     * The RemoveMarker method removes a marker from the header section of the ASF file.
     * @param {Integer} wIndex <b>WORD</b> containing the index of the marker.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ASF_E_NOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no marker at <i>wIndex</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is not in a configurable state.
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
     * The method failed for an unspecified reason.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmheaderinfo-removemarker
     */
    RemoveMarker(wIndex) {
        result := ComCall(10, this, "ushort", wIndex, "HRESULT")
        return result
    }

    /**
     * The GetScriptCount method returns the number of scripts currently in the header section of the ASF file.
     * @returns {Integer} Pointer to a count of scripts.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmheaderinfo-getscriptcount
     */
    GetScriptCount() {
        result := ComCall(11, this, "ushort*", &pcScripts := 0, "HRESULT")
        return pcScripts
    }

    /**
     * The GetScript method returns the type and command strings, and the presentation time, of a script.
     * @param {Integer} wIndex <b>WORD</b>that contains the index.
     * @param {PWSTR} pwszType Pointer to a wide-character <b>null</b>-terminated string buffer into which the type is copied.
     * @param {Pointer<Integer>} pcchTypeLen On input, a pointer to a variable that contains the length of the <i>pwszType</i> array in wide characters (2 bytes). On output, if the method succeeds, the variable contains the actual length of the string loaded into <i>pwszType</i>.This includes the terminating <b>null</b> character. To retrieve the length of the type, you must set this to zero and set <i>pwszType</i> to <b>NULL</b>.
     * @param {PWSTR} pwszCommand Pointer to a wide-character <b>null</b>-terminated string buffer into which the command is copied.
     * @param {Pointer<Integer>} pcchCommandLen On input, a pointer to a variable that contains the length of the <i>pwszCommand</i> array in wide characters (2 bytes). On output, if the method succeeds, the variable contains the actual length of the command string. This  includes the terminating <b>null</b> character. To retrieve the length of the command, you must set this to zero and set <i>pwszCommand</i> to <b>NULL</b>.
     * @returns {Integer} Pointer to a <b>QWORD</b>that specifies the presentation time of this script command in 100-nanosecond increments.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmheaderinfo-getscript
     */
    GetScript(wIndex, pwszType, pcchTypeLen, pwszCommand, pcchCommandLen) {
        pwszType := pwszType is String ? StrPtr(pwszType) : pwszType
        pwszCommand := pwszCommand is String ? StrPtr(pwszCommand) : pwszCommand

        pcchTypeLenMarshal := pcchTypeLen is VarRef ? "ushort*" : "ptr"
        pcchCommandLenMarshal := pcchCommandLen is VarRef ? "ushort*" : "ptr"

        result := ComCall(12, this, "ushort", wIndex, "ptr", pwszType, pcchTypeLenMarshal, pcchTypeLen, "ptr", pwszCommand, pcchCommandLenMarshal, pcchCommandLen, "uint*", &pcnsScriptTime := 0, "HRESULT")
        return pcnsScriptTime
    }

    /**
     * The AddScript method adds a script, consisting of type and command strings, and a specific time, to the header section of the ASF file.
     * @param {PWSTR} pwszType Pointer to a wide-character null-terminated string containing the type. Script types are limited to 1024 wide characters.
     * @param {PWSTR} pwszCommand Pointer to a wide-character null-terminated string containing the command. Script commands are limited to 10240 wide characters.
     * @param {Integer} cnsScriptTime The script time in 100-nanosecond increments.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is not in a configurable state.
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
     * No value was supplied in <i>pwszType</i> or <i>pwszCommand</i>.
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
     * A pointer parameter does not contain a valid pointer.
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
     * The method failed for an unspecified reason.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmheaderinfo-addscript
     */
    AddScript(pwszType, pwszCommand, cnsScriptTime) {
        pwszType := pwszType is String ? StrPtr(pwszType) : pwszType
        pwszCommand := pwszCommand is String ? StrPtr(pwszCommand) : pwszCommand

        result := ComCall(13, this, "ptr", pwszType, "ptr", pwszCommand, "uint", cnsScriptTime, "HRESULT")
        return result
    }

    /**
     * The RemoveScript method enables the object to remove a script from the header section of the ASF file.
     * @param {Integer} wIndex <b>WORD</b> containing the index of the script.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object cannot be currently configured.
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
     * The method failed for an unspecified reason.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmheaderinfo-removescript
     */
    RemoveScript(wIndex) {
        result := ComCall(14, this, "ushort", wIndex, "HRESULT")
        return result
    }
}
