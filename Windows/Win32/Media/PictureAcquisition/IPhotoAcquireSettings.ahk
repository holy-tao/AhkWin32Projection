#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPhotoAcquireSettings interface is used to work with image acquisition settings, such as file name format.
 * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nn-photoacquire-iphotoacquiresettings
 * @namespace Windows.Win32.Media.PictureAcquisition
 * @version v4.0.30319
 */
class IPhotoAcquireSettings extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhotoAcquireSettings
     * @type {Guid}
     */
    static IID => Guid("{00f2b868-dd67-487c-9553-049240767e91}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFromRegistry", "SetFlags", "SetOutputFilenameTemplate", "SetSequencePaddingWidth", "SetSequenceZeroPadding", "SetGroupTag", "SetAcquisitionTime", "GetFlags", "GetOutputFilenameTemplate", "GetSequencePaddingWidth", "GetSequenceZeroPadding", "GetGroupTag", "GetAcquisitionTime"]

    /**
     * The InitializeFromRegistry method specifies a registry key from which to initialize settings.
     * @param {PWSTR} pszRegistryKey Pointer to a null-terminated string containing the registry key.
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method is not yet implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquiresettings-initializefromregistry
     */
    InitializeFromRegistry(pszRegistryKey) {
        pszRegistryKey := pszRegistryKey is String ? StrPtr(pszRegistryKey) : pszRegistryKey

        result := ComCall(3, this, "ptr", pszRegistryKey, "HRESULT")
        return result
    }

    /**
     * The SetFlags method sets the photo acquire flags.
     * @param {Integer} dwPhotoAcquireFlags Double word value containing the photo acquire flags.
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
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquiresettings-setflags
     */
    SetFlags(dwPhotoAcquireFlags) {
        result := ComCall(4, this, "uint", dwPhotoAcquireFlags, "HRESULT")
        return result
    }

    /**
     * The SetOutputFilenameTemplate method specifies a format string (template) that specifies the format of file names.
     * @param {PWSTR} pszTemplate Pointer to a null-terminated string containing the format string.
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
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquiresettings-setoutputfilenametemplate
     */
    SetOutputFilenameTemplate(pszTemplate) {
        pszTemplate := pszTemplate is String ? StrPtr(pszTemplate) : pszTemplate

        result := ComCall(5, this, "ptr", pszTemplate, "HRESULT")
        return result
    }

    /**
     * The SetSequencePaddingWidth method sets a value indicating how wide sequential fields in filenames will be.
     * @param {Integer} dwWidth Double word value containing the width of sequential fields.
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
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquiresettings-setsequencepaddingwidth
     */
    SetSequencePaddingWidth(dwWidth) {
        result := ComCall(6, this, "uint", dwWidth, "HRESULT")
        return result
    }

    /**
     * The SetSequenceZeroPadding method sets a value indicating whether zeros or spaces are used to pad sequential file names.
     * @param {BOOL} fZeroPad Flag that, if set to <b>TRUE</b>, indicates that zeros pad sequential file names.
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
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquiresettings-setsequencezeropadding
     */
    SetSequenceZeroPadding(fZeroPad) {
        result := ComCall(7, this, "int", fZeroPad, "HRESULT")
        return result
    }

    /**
     * The SetGroupTag method sets the group tag for an acquisition session.
     * @param {PWSTR} pszGroupTag Pointer to a null-terminated string containing the group tag.
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
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquiresettings-setgrouptag
     */
    SetGroupTag(pszGroupTag) {
        pszGroupTag := pszGroupTag is String ? StrPtr(pszGroupTag) : pszGroupTag

        result := ComCall(8, this, "ptr", pszGroupTag, "HRESULT")
        return result
    }

    /**
     * The SetAcquisitionTime method sets the acquisition time explicitly.
     * @param {Pointer<FILETIME>} pftAcquisitionTime Specifies the acquisition time.
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
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquiresettings-setacquisitiontime
     */
    SetAcquisitionTime(pftAcquisitionTime) {
        result := ComCall(9, this, "ptr", pftAcquisitionTime, "HRESULT")
        return result
    }

    /**
     * The GetFlags method retrieves the photo acquire flags.
     * @returns {Integer} Pointer to a double word value containing the photo acquire flags.
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquiresettings-getflags
     */
    GetFlags() {
        result := ComCall(10, this, "uint*", &pdwPhotoAcquireFlags := 0, "HRESULT")
        return pdwPhotoAcquireFlags
    }

    /**
     * The GetOutputFilenameTemplate method retrieves a format string (template) that specifies the format of file names.
     * @returns {BSTR} Pointer to a string containing the format string.
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquiresettings-getoutputfilenametemplate
     */
    GetOutputFilenameTemplate() {
        pbstrTemplate := BSTR()
        result := ComCall(11, this, "ptr", pbstrTemplate, "HRESULT")
        return pbstrTemplate
    }

    /**
     * The GetSequencePaddingWidth method retrieves a value indicating how wide sequential fields in file names will be.
     * @returns {Integer} Pointer to a double word value containing the width of sequential fields.
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquiresettings-getsequencepaddingwidth
     */
    GetSequencePaddingWidth() {
        result := ComCall(12, this, "uint*", &pdwWidth := 0, "HRESULT")
        return pdwWidth
    }

    /**
     * The GetSequenceZeroPadding method retrieves a value that indicates whether zeros or spaces will be used to pad sequential file names.
     * @returns {BOOL} Pointer to a flag that, if set to <b>TRUE</b>, indicates that zeros will pad sequential file names.
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquiresettings-getsequencezeropadding
     */
    GetSequenceZeroPadding() {
        result := ComCall(13, this, "int*", &pfZeroPad := 0, "HRESULT")
        return pfZeroPad
    }

    /**
     * The GetGroupTag method retrieves a tag string for the group of files being downloaded from the device.
     * @returns {BSTR} Pointer to a string containing the group tag.
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquiresettings-getgrouptag
     */
    GetGroupTag() {
        pbstrGroupTag := BSTR()
        result := ComCall(14, this, "ptr", pbstrGroupTag, "HRESULT")
        return pbstrGroupTag
    }

    /**
     * The GetAcquisitionTime method retrieves the acquisition time of the current session.
     * @returns {FILETIME} Specifies acquisition time.
     * @see https://docs.microsoft.com/windows/win32/api//photoacquire/nf-photoacquire-iphotoacquiresettings-getacquisitiontime
     */
    GetAcquisitionTime() {
        pftAcquisitionTime := FILETIME()
        result := ComCall(15, this, "ptr", pftAcquisitionTime, "HRESULT")
        return pftAcquisitionTime
    }
}
