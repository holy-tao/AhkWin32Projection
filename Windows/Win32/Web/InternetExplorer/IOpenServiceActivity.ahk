#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\UI\WindowsAndMessaging\HICON.ahk
#Include .\IOpenService.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IOpenServiceActivity extends IOpenService{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpenServiceActivity
     * @type {Guid}
     */
    static IID => Guid("{13645c88-221a-4905-8ed1-4f5112cfc108}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Execute", "CanExecute", "CanExecuteType", "Preview", "CanPreview", "CanPreviewType", "GetStatusText", "GetHomepageUrl", "GetDisplayName", "GetDescription", "GetCategoryName", "GetIconPath", "GetIcon", "GetDescriptionFilePath", "GetDownloadUrl", "GetInstallUrl", "IsEnabled", "SetEnabled"]

    /**
     * Calls the DsReplicaConsistencyCheck function, which invokes the Knowledge Consistency Checker (KCC) to verify the replication topology.
     * @param {IOpenServiceActivityInput} pInput 
     * @param {IOpenServiceActivityOutputContext} pOutput 
     * @returns {HRESULT} This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/AD/executekcc-msad-domaincontroller
     */
    Execute(pInput, pOutput) {
        result := ComCall(6, this, "ptr", pInput, "ptr", pOutput, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IOpenServiceActivityInput} pInput 
     * @param {IOpenServiceActivityOutputContext} pOutput 
     * @returns {BOOL} 
     */
    CanExecute(pInput, pOutput) {
        result := ComCall(7, this, "ptr", pInput, "ptr", pOutput, "int*", &pfCanExecute := 0, "HRESULT")
        return pfCanExecute
    }

    /**
     * 
     * @param {Integer} type 
     * @returns {BOOL} 
     */
    CanExecuteType(type) {
        result := ComCall(8, this, "int", type, "int*", &pfCanExecute := 0, "HRESULT")
        return pfCanExecute
    }

    /**
     * Used by IResultsViewer PreviewStyle to set or determine the display style currently being used.
     * @param {IOpenServiceActivityInput} pInput 
     * @param {IOpenServiceActivityOutputContext} pOutput 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/lwef/-search-2x-previewdisplaystyleenum
     */
    Preview(pInput, pOutput) {
        result := ComCall(9, this, "ptr", pInput, "ptr", pOutput, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IOpenServiceActivityInput} pInput 
     * @param {IOpenServiceActivityOutputContext} pOutput 
     * @returns {BOOL} 
     */
    CanPreview(pInput, pOutput) {
        result := ComCall(10, this, "ptr", pInput, "ptr", pOutput, "int*", &pfCanPreview := 0, "HRESULT")
        return pfCanPreview
    }

    /**
     * 
     * @param {Integer} type 
     * @returns {BOOL} 
     */
    CanPreviewType(type) {
        result := ComCall(11, this, "int", type, "int*", &pfCanPreview := 0, "HRESULT")
        return pfCanPreview
    }

    /**
     * 
     * @param {IOpenServiceActivityInput} pInput 
     * @returns {BSTR} 
     */
    GetStatusText(pInput) {
        pbstrStatusText := BSTR()
        result := ComCall(12, this, "ptr", pInput, "ptr", pbstrStatusText, "HRESULT")
        return pbstrStatusText
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetHomepageUrl() {
        pbstrHomepageUrl := BSTR()
        result := ComCall(13, this, "ptr", pbstrHomepageUrl, "HRESULT")
        return pbstrHomepageUrl
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetDisplayName() {
        pbstrDisplayName := BSTR()
        result := ComCall(14, this, "ptr", pbstrDisplayName, "HRESULT")
        return pbstrDisplayName
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetDescription
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/iwmcodecstrings-getdescription
     */
    GetDescription() {
        pbstrDescription := BSTR()
        result := ComCall(15, this, "ptr", pbstrDescription, "HRESULT")
        return pbstrDescription
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetCategoryName() {
        pbstrCategoryName := BSTR()
        result := ComCall(16, this, "ptr", pbstrCategoryName, "HRESULT")
        return pbstrCategoryName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetIconPath() {
        pbstrIconPath := BSTR()
        result := ComCall(17, this, "ptr", pbstrIconPath, "HRESULT")
        return pbstrIconPath
    }

    /**
     * Retrieves information about the specified icon or cursor.
     * @remarks
     * <b>GetIconInfo</b> creates bitmaps for the <b>hbmMask</b> and <b>hbmColor</b> or members of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-iconinfo">ICONINFO</a>. The calling application must manage these bitmaps and delete them when they are no longer necessary.
     * 
     * <h3><a id="DPI_Virtualization"></a><a id="dpi_virtualization"></a><a id="DPI_VIRTUALIZATION"></a>DPI Virtualization</h3>
     * This API does not participate in DPI virtualization. The output returned is not affected by the DPI of the calling thread.
     * @param {BOOL} fSmallIcon 
     * @returns {HICON} 
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-geticoninfo
     */
    GetIcon(fSmallIcon) {
        phIcon := HICON()
        result := ComCall(18, this, "int", fSmallIcon, "ptr", phIcon, "HRESULT")
        return phIcon
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetDescriptionFilePath() {
        pbstrXmlPath := BSTR()
        result := ComCall(19, this, "ptr", pbstrXmlPath, "HRESULT")
        return pbstrXmlPath
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetDownloadUrl() {
        pbstrXmlUri := BSTR()
        result := ComCall(20, this, "ptr", pbstrXmlUri, "HRESULT")
        return pbstrXmlUri
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetInstallUrl() {
        pbstrInstallUri := BSTR()
        result := ComCall(21, this, "ptr", pbstrInstallUri, "HRESULT")
        return pbstrInstallUri
    }

    /**
     * The IsEnabled method of the Win32\_Tpm class indicates whether the device is enabled. This value can be changed by the Enable and Disable methods.
     * @remarks
     * According to the Trusted Computing Group (TCG) v1.2 specification only the following commands are available when the device is in a deactivated state.
     * 
     * -   TPM\_ContinueSelfTest
     * -   TPM\_DSAP
     * -   TPM\_FlushSpecific
     * -   TPM\_GetCapability
     * -   TPM\_GetTestResult
     * -   TPM\_Init
     * -   TPM\_OIAP
     * -   TPM\_OSAP
     * -   TPM\_OwnerSetDisable
     * -   TPM\_PCR\_Reset
     * -   TPM\_PhysicalDisable
     * -   TPM\_PhysicalEnable
     * -   TPM\_PhysicalSetDeactivated
     * -   TPM\_Reset
     * -   TPM\_SaveState
     * -   TPM\_SelfTestFull
     * -   TPM\_SetCapability
     * -   TPM\_SHA1Complete
     * -   TPM\_SHA1Start
     * -   TPM\_SHA1Update
     * -   TPM\_Startup
     * -   TPM\_TakeOwnership
     * -   TPM\_Terminate\_Handle
     * 
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/SecProv/isenabled-win32-tpm
     */
    IsEnabled() {
        result := ComCall(22, this, "int*", &pfIsEnabled := 0, "HRESULT")
        return pfIsEnabled
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
     * @param {BOOL} fEnable 
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
     */
    SetEnabled(fEnable) {
        result := ComCall(23, this, "int", fEnable, "HRESULT")
        return result
    }
}
