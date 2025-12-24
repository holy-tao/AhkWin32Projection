#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMStreamConfig.ahk

/**
 * The IWMStreamConfig2 interface manages the data unit extensions associated with a stream.IWMStreamConfig2 inherits from IWMStreamConfig. To obtain a pointer to IWMStreamConfig2, call the QueryInterface method of the IWMStreamConfig interface.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmstreamconfig2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMStreamConfig2 extends IWMStreamConfig{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMStreamConfig2
     * @type {Guid}
     */
    static IID => Guid("{7688d8cb-fc0d-43bd-9459-5a8dec200cfa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTransportType", "SetTransportType", "AddDataUnitExtension", "GetDataUnitExtensionCount", "GetDataUnitExtension", "RemoveAllDataUnitExtensions"]

    /**
     * The GetTransportType method retrieves the type of data communication protocol (reliable or unreliable) used for the stream.
     * @returns {Integer} Pointer to a variable that receives one member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_transport_type">WMT_TRANSPORT_TYPE</a> enumeration type.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmstreamconfig2-gettransporttype
     */
    GetTransportType() {
        result := ComCall(14, this, "int*", &pnTransportType := 0, "HRESULT")
        return pnTransportType
    }

    /**
     * The SetTransportType method sets the type of data communication protocol (reliable or unreliable) used for the stream.
     * @param {Integer} nTransportType One member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_transport_type">WMT_TRANSPORT_TYPE</a> enumeration type specifying the transport type for the stream.
     * @returns {HRESULT} The method always returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmstreamconfig2-settransporttype
     */
    SetTransportType(nTransportType) {
        result := ComCall(15, this, "int", nTransportType, "HRESULT")
        return result
    }

    /**
     * The AddDataUnitExtension method adds a data unit extension system to the stream. You can use data unit extension systems to attach custom data to samples in an output file.
     * @param {Guid} guidExtensionSystemID A GUID that identifies the data unit extension system. This can be one of the predefined GUIDs listed in <a href="https://docs.microsoft.com/windows/desktop/api/wmsbuffer/nf-wmsbuffer-inssbuffer3-setproperty">INSSBuffer3::SetProperty</a>, or a GUID whose value is understood by a custom player application.
     * @param {Integer} cbExtensionDataSize Size, in bytes, of the data unit extensions that will be attached to the packets in the stream. Set to 0xFFFF to specify data unit extensions of variable size. Each individual data unit extension can then be set to any size ranging from 0 to 65534.
     * @param {Pointer<Integer>} pbExtensionSystemInfo Pointer to a byte buffer containing information about the data unit extension system. If you have no information, you can pass <b>NULL</b>. When passing <b>NULL</b>, <i>cbExtensionSystemInfo</i> must be zero.
     * @param {Integer} cbExtensionSystemInfo Count of bytes in the buffer at <i>pbExtensionSystemInfo</i>. If you have no data unit extension system information, you can pass zero. When passing zero, <i>pbExtensionSystemInfo</i> must be <b>NULL</b>.
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
     * <i>cbExtensionSystemInfo</i> specifies a non-zero value, but <i>pbExtensionSystemInfo</i> is <b>NULL</b>.
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
     * The method cannot allocate memory to hold the new data unit extension.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmstreamconfig2-adddataunitextension
     */
    AddDataUnitExtension(guidExtensionSystemID, cbExtensionDataSize, pbExtensionSystemInfo, cbExtensionSystemInfo) {
        pbExtensionSystemInfoMarshal := pbExtensionSystemInfo is VarRef ? "char*" : "ptr"

        result := ComCall(16, this, "ptr", guidExtensionSystemID, "ushort", cbExtensionDataSize, pbExtensionSystemInfoMarshal, pbExtensionSystemInfo, "uint", cbExtensionSystemInfo, "HRESULT")
        return result
    }

    /**
     * The GetDataUnitExtensionCount method retrieves the total number of data unit extension systems that have been added to the stream.
     * @returns {Integer} Pointer to a <b>WORD</b> that receives the count of data unit extensions.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmstreamconfig2-getdataunitextensioncount
     */
    GetDataUnitExtensionCount() {
        result := ComCall(17, this, "ushort*", &pcDataUnitExtensions := 0, "HRESULT")
        return pcDataUnitExtensions
    }

    /**
     * The GetDataUnitExtension method retrieves information about an existing data unit extension system.
     * @param {Integer} wDataUnitExtensionNumber <b>WORD</b> containing the data unit extension number. This number is assigned to a data unit extension system when it is added to the stream.
     * @param {Pointer<Guid>} pguidExtensionSystemID Pointer to a GUID that receives the identifier of the data unit extension system.
     * @param {Pointer<Integer>} pcbExtensionDataSize Pointer to the size, in bytes, of the data unit extensions that will be attached to the packets in the stream.
     * 
     * If this value is 0xFFFF, the system uses data unit extensions of variable size. Each individual data unit extension can then be set to any size ranging from 0 to 65534.
     * @param {Pointer<Integer>} pbExtensionSystemInfo Pointer to a byte buffer that receives information about the data unit extension system.
     * @param {Pointer<Integer>} pcbExtensionSystemInfo Pointer to the size, in bytes, of the data stored at <i>pbExtensionSystemInfo</i>.
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
     * <i>pguidExtensionSystemID</i> or <i>pcbExtensionDataSize</i> is <b>NULL</b>.
     * 
     * OR
     * 
     * <i>wDataUnitExtensionNumber</i> specifies an invalid data unit extension number.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmstreamconfig2-getdataunitextension
     */
    GetDataUnitExtension(wDataUnitExtensionNumber, pguidExtensionSystemID, pcbExtensionDataSize, pbExtensionSystemInfo, pcbExtensionSystemInfo) {
        pcbExtensionDataSizeMarshal := pcbExtensionDataSize is VarRef ? "ushort*" : "ptr"
        pbExtensionSystemInfoMarshal := pbExtensionSystemInfo is VarRef ? "char*" : "ptr"
        pcbExtensionSystemInfoMarshal := pcbExtensionSystemInfo is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, "ushort", wDataUnitExtensionNumber, "ptr", pguidExtensionSystemID, pcbExtensionDataSizeMarshal, pcbExtensionDataSize, pbExtensionSystemInfoMarshal, pbExtensionSystemInfo, pcbExtensionSystemInfoMarshal, pcbExtensionSystemInfo, "HRESULT")
        return result
    }

    /**
     * The RemoveAllDataUnitExtensions method removes all data unit extension systems that are associated with the stream.
     * @returns {HRESULT} The method always returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmstreamconfig2-removealldataunitextensions
     */
    RemoveAllDataUnitExtensions() {
        result := ComCall(19, this, "HRESULT")
        return result
    }
}
