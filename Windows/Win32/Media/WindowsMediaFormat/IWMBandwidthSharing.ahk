#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMStreamList.ahk

/**
 * The IWMBandwidthSharing interface contains methods to manage the properties of combined streams.The list of streams that share bandwidth is stored in the bandwidth sharing object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmbandwidthsharing
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMBandwidthSharing extends IWMStreamList{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMBandwidthSharing
     * @type {Guid}
     */
    static IID => Guid("{ad694af1-f8d9-42f8-bc47-70311b0c4f9e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetType", "SetType", "GetBandwidth", "SetBandwidth"]

    /**
     * The GetType method retrieves the type of sharing for the bandwidth sharing object.
     * @returns {Guid} 
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmbandwidthsharing-gettype
     */
    GetType() {
        pguidType := Guid()
        result := ComCall(6, this, "ptr", pguidType, "HRESULT")
        return pguidType
    }

    /**
     * The SetType method sets the type of sharing (exclusive or partial) for the bandwidth sharing object.
     * @param {Pointer<Guid>} guidType Globally unique identifier specifying the type of combined stream to be used. The only valid GUIDs are those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Bandwidth sharing type
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>CLSID_WMBandwidthSharing_Exclusive</td>
     * <td>Only one of the constituent streams can be active at any given time.</td>
     * </tr>
     * <tr>
     * <td>CLSID_WMBandwidthSharing_Partial</td>
     * <td>The constituent streams can be active simultaneously.</td>
     * </tr>
     * </table>
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
     * The GUID passed in <i>guidType</i> is any value other than CLSID_BandwidthSharingExclusive or CLSID_BandwidthSharingPartial.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmbandwidthsharing-settype
     */
    SetType(guidType) {
        result := ComCall(7, this, "ptr", guidType, "HRESULT")
        return result
    }

    /**
     * The GetBandwidth method retrieves the bandwidth and maximum buffer size of a combined stream.
     * @param {Pointer<Integer>} pdwBitrate Pointer to a <b>DWORD</b> containing the bit rate in bits per second. The combined bandwidths of the streams cannot exceed this value.
     * @param {Pointer<Integer>} pmsBufferWindow Pointer to <b>DWORD</b> containing the buffer window in milliseconds. The combined buffer sizes of the streams cannot exceed this value.
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
     * One or both of the parameters are <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmbandwidthsharing-getbandwidth
     */
    GetBandwidth(pdwBitrate, pmsBufferWindow) {
        pdwBitrateMarshal := pdwBitrate is VarRef ? "uint*" : "ptr"
        pmsBufferWindowMarshal := pmsBufferWindow is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pdwBitrateMarshal, pdwBitrate, pmsBufferWindowMarshal, pmsBufferWindow, "HRESULT")
        return result
    }

    /**
     * The SetBandwidth method sets the bandwidth and maximum buffer size for a combined stream.
     * @param {Integer} dwBitrate <b>DWORD</b> containing the bit rate in bits per second. The combined bandwidths of the streams cannot exceed this value.
     * @param {Integer} msBufferWindow Specifies the buffer window in milliseconds. The combined buffer sizes of the streams cannot exceed this value.
     * @returns {HRESULT} This method always returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmbandwidthsharing-setbandwidth
     */
    SetBandwidth(dwBitrate, msBufferWindow) {
        result := ComCall(9, this, "uint", dwBitrate, "uint", msBufferWindow, "HRESULT")
        return result
    }
}
