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
     * 
     * @param {PWSTR} pszRegistryKey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresettings-initializefromregistry
     */
    InitializeFromRegistry(pszRegistryKey) {
        pszRegistryKey := pszRegistryKey is String ? StrPtr(pszRegistryKey) : pszRegistryKey

        result := ComCall(3, this, "ptr", pszRegistryKey, "HRESULT")
        return result
    }

    /**
     * Specifies how the recognizer interprets the ink and determines the result string.Call this function before processing the ink for the first time. Therefore, call the SetFlags function before calling the Process function.
     * @param {Integer} dwPhotoAcquireFlags 
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
     * @see https://docs.microsoft.com/windows/win32/api//recapis/nf-recapis-setflags
     */
    SetFlags(dwPhotoAcquireFlags) {
        result := ComCall(4, this, "uint", dwPhotoAcquireFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszTemplate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresettings-setoutputfilenametemplate
     */
    SetOutputFilenameTemplate(pszTemplate) {
        pszTemplate := pszTemplate is String ? StrPtr(pszTemplate) : pszTemplate

        result := ComCall(5, this, "ptr", pszTemplate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwWidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresettings-setsequencepaddingwidth
     */
    SetSequencePaddingWidth(dwWidth) {
        result := ComCall(6, this, "uint", dwWidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fZeroPad 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresettings-setsequencezeropadding
     */
    SetSequenceZeroPadding(fZeroPad) {
        result := ComCall(7, this, "int", fZeroPad, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszGroupTag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresettings-setgrouptag
     */
    SetGroupTag(pszGroupTag) {
        pszGroupTag := pszGroupTag is String ? StrPtr(pszGroupTag) : pszGroupTag

        result := ComCall(8, this, "ptr", pszGroupTag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<FILETIME>} pftAcquisitionTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresettings-setacquisitiontime
     */
    SetAcquisitionTime(pftAcquisitionTime) {
        result := ComCall(9, this, "ptr", pftAcquisitionTime, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresettings-getflags
     */
    GetFlags() {
        result := ComCall(10, this, "uint*", &pdwPhotoAcquireFlags := 0, "HRESULT")
        return pdwPhotoAcquireFlags
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresettings-getoutputfilenametemplate
     */
    GetOutputFilenameTemplate() {
        pbstrTemplate := BSTR()
        result := ComCall(11, this, "ptr", pbstrTemplate, "HRESULT")
        return pbstrTemplate
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresettings-getsequencepaddingwidth
     */
    GetSequencePaddingWidth() {
        result := ComCall(12, this, "uint*", &pdwWidth := 0, "HRESULT")
        return pdwWidth
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresettings-getsequencezeropadding
     */
    GetSequenceZeroPadding() {
        result := ComCall(13, this, "int*", &pfZeroPad := 0, "HRESULT")
        return pfZeroPad
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresettings-getgrouptag
     */
    GetGroupTag() {
        pbstrGroupTag := BSTR()
        result := ComCall(14, this, "ptr", pbstrGroupTag, "HRESULT")
        return pbstrGroupTag
    }

    /**
     * 
     * @returns {FILETIME} 
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresettings-getacquisitiontime
     */
    GetAcquisitionTime() {
        pftAcquisitionTime := FILETIME()
        result := ComCall(15, this, "ptr", pftAcquisitionTime, "HRESULT")
        return pftAcquisitionTime
    }
}
