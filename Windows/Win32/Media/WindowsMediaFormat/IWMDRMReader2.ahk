#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMDRMReader.ahk

/**
 * The IWMDRMReader2 interface provides methods for examining the rights granted by DRM version 10 licenses.An IWMDRMReader2 interface exists for every instance of the reader object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmdrmreader2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMDRMReader2 extends IWMDRMReader{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDRMReader2
     * @type {Guid}
     */
    static IID => Guid("{befe7a75-9f1d-4075-b9d9-a3c37bda49a0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetEvaluateOutputLevelLicenses", "GetPlayOutputLevels", "GetCopyOutputLevels", "TryNextLicense"]

    /**
     * The SetEvaluateOutputLevelLicenses method sets the reader to evaluate licenses that use output protection levels (OPLs).
     * @param {BOOL} fEvaluate Flag specifying whether to handle files with licenses that use output protection levels.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmdrmreader2-setevaluateoutputlevellicenses
     */
    SetEvaluateOutputLevelLicenses(fEvaluate) {
        result := ComCall(11, this, "int", fEvaluate, "HRESULT")
        return result
    }

    /**
     * The GetPlayOutputLevels method retrieves the output protection levels (OPLs) that apply to the play action in the license of the file loaded in the reader.
     * @param {Pointer<DRM_PLAY_OPL>} pPlayOPL Address of a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-drm_play_opl">DRM_PLAY_OPL</a> structure that receives the output levels that apply to playing content. Additional data is appended to the structure. If you pass <b>NULL</b>, the method returns the size of the structure in <i>pcbLength</i>.
     * @param {Pointer<Integer>} pcbLength Address of a variable that contains the size of the <b>DRM_PLAY_OPL</b> structure in bytes. On input set to the size of the allocated buffer. On return the method sets this value to the size of the structure and any appended data.
     * @param {Pointer<Integer>} pdwMinAppComplianceLevel Address of a variable that receives the minimum application compliance level.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmdrmreader2-getplayoutputlevels
     */
    GetPlayOutputLevels(pPlayOPL, pcbLength, pdwMinAppComplianceLevel) {
        pcbLengthMarshal := pcbLength is VarRef ? "uint*" : "ptr"
        pdwMinAppComplianceLevelMarshal := pdwMinAppComplianceLevel is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "ptr", pPlayOPL, pcbLengthMarshal, pcbLength, pdwMinAppComplianceLevelMarshal, pdwMinAppComplianceLevel, "HRESULT")
        return result
    }

    /**
     * The GetCopyOutputLevels method retrieves the output protection levels (OPLs) that apply to the copy action in the license of the file loaded in the reader.
     * @param {Pointer<DRM_COPY_OPL>} pCopyOPL Address of a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-drm_copy_opl">DRM_COPY_OPL</a> structure that receives the output protection levels that apply to copying content. Additional data is appended to the structure. If you pass <b>NULL</b>, the method returns the size of the structure in <i>pcbLength</i>.
     * @param {Pointer<Integer>} pcbLength Address of a variable that contains the size of the <b>DRM_COPY_OPL</b> structure in bytes. On input set to the size of the allocated buffer. On return the method sets this value to the size of the structure and any appended data.
     * @param {Pointer<Integer>} pdwMinAppComplianceLevel Address of a variable that receives the minimum application compliance level.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmdrmreader2-getcopyoutputlevels
     */
    GetCopyOutputLevels(pCopyOPL, pcbLength, pdwMinAppComplianceLevel) {
        pcbLengthMarshal := pcbLength is VarRef ? "uint*" : "ptr"
        pdwMinAppComplianceLevelMarshal := pdwMinAppComplianceLevel is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "ptr", pCopyOPL, pcbLengthMarshal, pcbLength, pdwMinAppComplianceLevelMarshal, pdwMinAppComplianceLevel, "HRESULT")
        return result
    }

    /**
     * The TryNextLicense method sets the reader to evaluate the next applicable license (if present) for the file loaded in the reader.
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
     * <dt><b>DRM_S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more licenses for this content.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_REQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No file is opened in the reader.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_DRM_RIV_TOO_SMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An updated content revocation list is needed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_DRM_UNSUPPORTED_PROPERTY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file opened in the reader is not protected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmdrmreader2-trynextlicense
     */
    TryNextLicense() {
        result := ComCall(14, this, "HRESULT")
        return result
    }
}
