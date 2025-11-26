#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDRMReader interface provides methods to configure the DRM component and to manage DRM license acquisition and individualization of client applications.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmdrmreader
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMDRMReader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDRMReader
     * @type {Guid}
     */
    static IID => Guid("{d2827540-3ee7-432c-b14c-dc17f085d3b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AcquireLicense", "CancelLicenseAcquisition", "Individualize", "CancelIndividualization", "MonitorLicenseAcquisition", "CancelMonitorLicenseAcquisition", "SetDRMProperty", "GetDRMProperty"]

    /**
     * The AcquireLicense method begins the license acquisition process.
     * @param {Integer} dwFlags <b>DWORD</b> containing the relevant flags.
     * 
     * <table>
     * <tr>
     * <th>Flag
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>0x1</td>
     * <td>Indicates that the method will attempt to acquire the license silently.</td>
     * </tr>
     * <tr>
     * <td>0x0</td>
     * <td>Indicates that the <b>OnStatus</b> callback will return a URL to use on the Web to acquire a license.</td>
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory to complete the task.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmdrmreader-acquirelicense
     */
    AcquireLicense(dwFlags) {
        result := ComCall(3, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The CancelLicenseAcquisition method cancels a current call to the AcquireLicense method.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmdrmreader-cancellicenseacquisition
     */
    CancelLicenseAcquisition() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * The Individualize method individualizes the client by updating their DRM system components.
     * @param {Integer} dwFlags <b>DWORD</b> containing the relevant flags.
     * 
     * <table>
     * <tr>
     * <th>Flag
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>0x0</td>
     * <td>Indicates that the client can be individualized again.</td>
     * </tr>
     * <tr>
     * <td>0x1</td>
     * <td>Indicates that the client will not be individualized again.</td>
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
     * A null or invalid argument has been passed in.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmdrmreader-individualize
     */
    Individualize(dwFlags) {
        result := ComCall(5, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * The CancelIndividualization method cancels a current call to the Individualize method.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmdrmreader-cancelindividualization
     */
    CancelIndividualization() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * The MonitorLicenseAcquisition method, in nonsilent license acquisition, informs the application when a license has been successfully acquired.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmdrmreader-monitorlicenseacquisition
     */
    MonitorLicenseAcquisition() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * The CancelMonitorLicenseAcquisition method cancels a current call to the MonitorLicenseAcquisition method.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmdrmreader-cancelmonitorlicenseacquisition
     */
    CancelMonitorLicenseAcquisition() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * The SetDRMProperty method on the reader object is used to set a DRM property, such as the DRM_Rights property.
     * @param {PWSTR} pwstrName Specifies the name of the property to set.
     * @param {Integer} dwType One member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_attr_datatype">WMT_ATTR_DATATYPE</a> enumeration type. The only supported value for this method is <b>WMT_TYPE_STRING</b>.
     * @param {Pointer<Integer>} pValue Pointer to a byte array containing the attribute value.
     * @param {Integer} cbLength Size of <i>pValue</i>, in bytes.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmdrmreader-setdrmproperty
     */
    SetDRMProperty(pwstrName, dwType, pValue, cbLength) {
        pwstrName := pwstrName is String ? StrPtr(pwstrName) : pwstrName

        pValueMarshal := pValue is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, "ptr", pwstrName, "int", dwType, pValueMarshal, pValue, "ushort", cbLength, "HRESULT")
        return result
    }

    /**
     * The GetDRMProperty method retrieves DRM-specific file attributes and run-time properties.
     * @param {PWSTR} pwstrName Specifies the property or file attribute to retrieve.
     * @param {Pointer<Integer>} pdwType Pointer that receives the data type of the returned value.
     * @param {Pointer<Integer>} pValue Pointer to the value requested in <i>pwstrName</i>.
     * @param {Pointer<Integer>} pcbLength Size of <i>pValue</i>, in bytes.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmdrmreader-getdrmproperty
     */
    GetDRMProperty(pwstrName, pdwType, pValue, pcbLength) {
        pwstrName := pwstrName is String ? StrPtr(pwstrName) : pwstrName

        pdwTypeMarshal := pdwType is VarRef ? "int*" : "ptr"
        pValueMarshal := pValue is VarRef ? "char*" : "ptr"
        pcbLengthMarshal := pcbLength is VarRef ? "ushort*" : "ptr"

        result := ComCall(10, this, "ptr", pwstrName, pdwTypeMarshal, pdwType, pValueMarshal, pValue, pcbLengthMarshal, pcbLength, "HRESULT")
        return result
    }
}
