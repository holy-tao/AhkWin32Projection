#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDRMEditor interface is exposed on the metadata editor object.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmdrmeditor
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMDRMEditor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDRMEditor
     * @type {Guid}
     */
    static IID => Guid("{ff130ebc-a6c3-42a6-b401-c3382c3e08b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDRMProperty"]

    /**
     * The GetDRMProperty method retrieves the specified DRM property.
     * @remarks
     * This method retrieves only DRM properties listed below. The file must first be opened using <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmmetadataeditor-open">IWMMetadataEditor::Open</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmmetadataeditor2-openex">IWMMetadataEditor2::OpenEx</a>.
     * 
     * Also, before calling <b>GetDRMProperty</b> on an opened file, always call the helper function <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-wmiscontentprotected">WMIsContentProtected</a> to ensure that the file is protected with DRM. It is important to do this because in some cases this method might succeed when called on unprotected content.
     * 
     * The following properties are accessible from this method:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/wmformat/drm-isdrm">DRM_IsDRM</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/wmformat/drm-isdrmcached">DRM_IsDRMCached</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/wmformat/drm-baselicenseacqurl">DRM_BaseLicenseAcqURL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/wmformat/drm-rights">DRM_Rights</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/wmformat/drm-licenseid">DRM_LicenseID</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/wmformat/drm-actionallowed-playback">DRM_ActionAllowed_Playback</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/wmformat/drm-actionallowed-copytocd">DRM_ActionAllowed_CopyToCD</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/wmformat/drm-actionallowed-copytosdmidevice">DRM_ActionAllowed_CopyToSDMIDevice</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/wmformat/drm-actionallowed-copytononsdmidevice">DRM_ActionAllowed_CopyToNonSDMIDevice</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/wmformat/drm-actionallowed-backup">DRM_ActionAllowed_Backup</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/wmformat/drm-drmheader-keyid">DRM_DRMHeader_KeyID</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/wmformat/drm-drmheader-licenseacqurl">DRM_DRMHeader_LicenseAcqURL</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/wmformat/drm-drmheader-contentid">DRM_DRMHeader_ContentID</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/wmformat/drm-drmheader-individualizedversion">DRM_DRMHeader_IndividualizedVersion</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/wmformat/drm-drmheader-contentdistributor">DRM_DRMHeader_ContentDistributor</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/wmformat/drm-drmheader-subscriptioncontentid">DRM_DRMHeader_SubscriptionContentID</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/wmformat/drm-licensestate-playback">DRM_LicenseState_Playback</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/wmformat/drm-licensestate-copytocd">DRM_LicenseState_CopyToCD</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/wmformat/drm-licensestate-copytosdmidevice">DRM_LicenseState_CopyToSDMIDevice</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/wmformat/drm-licensestate-copytononsdmidevice">DRM_LicenseState_CopyToNonSDMIDevice</a>
     * </li>
     * </ul>
     * @param {PWSTR} pwstrName Specifies the DRM file attribute to retrieve.
     * @param {Pointer<Integer>} pdwType Pointer that receives the data type of the returned value.
     * @param {Pointer<Integer>} pValue Pointer to the value requested in <i>pwstrName</i>.
     * @param {Pointer<Integer>} pcbLength Length of <i>pValue</i> in bytes.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmdrmeditor-getdrmproperty
     */
    GetDRMProperty(pwstrName, pdwType, pValue, pcbLength) {
        pwstrName := pwstrName is String ? StrPtr(pwstrName) : pwstrName

        pdwTypeMarshal := pdwType is VarRef ? "int*" : "ptr"
        pValueMarshal := pValue is VarRef ? "char*" : "ptr"
        pcbLengthMarshal := pcbLength is VarRef ? "ushort*" : "ptr"

        result := ComCall(3, this, "ptr", pwstrName, pdwTypeMarshal, pdwType, pValueMarshal, pValue, pcbLengthMarshal, pcbLength, "HRESULT")
        return result
    }
}
