#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPhotoAcquireSettings interface is used to work with image acquisition settings, such as file name format.
 * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nn-photoacquire-iphotoacquiresettings
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
     * @remarks
     * The structure of the registry has not yet been determined at this point.
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
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresettings-initializefromregistry
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
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresettings-setflags
     */
    SetFlags(dwPhotoAcquireFlags) {
        result := ComCall(4, this, "uint", dwPhotoAcquireFlags, "HRESULT")
        return result
    }

    /**
     * The SetOutputFilenameTemplate method specifies a format string (template) that specifies the format of file names.
     * @remarks
     * Format strings contain a mix of path literals and tokens. A format string looks like the following:
     * 
     * 
     * ```cpp
     * 
     * $(MyPicturesFolder)\$(DateAcquired), $(EventName)\$(EventName) $(SequenceNumber).$(OriginalExtension)
     * 
     * ```
     * 
     * 
     * The token format looks like the following, where <c>OptionalPrefix</code> and <code>OptionSuffix</code> are suppressed if the replacement for the <code>TokenIdentifier</c> yields a zero-length string:
     * 
     * 
     * ```cpp
     * 
     * $([OptionalPrefix]TokenIdentifier:SubToken[OptionalSuffix]|AlternateString)
     * 
     * ```
     * 
     * 
     * The caret ("^") is an escape character, so "^$" would yield "$" in the final path.
     * 
     * Parentheses and brackets are not allowed as literals within tokens, but can be used outside of tokens. This means you cannot use "[", "]", "(", or ")" within the <c>OptionalString</c> sub-token unless they are escaped with a caret ("^").
     * 
     * There are a few different classes of tokens, including the following:
     * 
     * <b>SHGetSpecialFolder</b> variables such as the following. These must be the first token, and can only occur once, at most:
     * 
     * <ul>
     * <li><c>MyPicturesFolder</c></li>
     * <li><c>MyDocumentsFolder</c></li>
     * </ul>
     * Session variables such as the following:
     * 
     * <ul>
     * <li><c>SequenceNumber</c> (The sequence number is used to avoid filename collisions; if it exists, it must be in the file name portion of the path.)</li>
     * <li><c>DateAcquired</c></li>
     * <li><c>EventName</c></li>
     * <li><c>UserName</c></li>
     * <li><c>MachineName</c></li>
     * </ul>
     * File and metadata variables such as the following:
     * 
     * <ul>
     * <li><c>DateTaken</c></li>
     * <li><c>OriginalFilename</c></li>
     * <li><c>OriginalExtension</c></li>
     * <li><c>CameraModel</c></li>
     * <li><c>Width</c></li>
     * <li><c>Height</c></li>
     * </ul>
     * Since these tokens are not intended to be visible to users, they will not be localized. For example, <c>$(DateTaken)</c> will be the same on all versions of Microsoft Windows, regardless of locale or language settings.
     * 
     * As an example, suppose <c>EventName</c> is "Meghan's Birthday" and the naming pattern is as follows:
     * 
     * 
     * ``` syntax
     * 
     * $(MyPicturesFolder)\$(DateAcquired)$([, ]EventName)\$(EventName[ ])$(SequenceNumber).$(OriginalExtension)
     * 
     * ```
     * 
     * The resulting files would be named as follows:
     * 
     * C:\Documents and Settings\shauniv\My Documents\My Pictures\2003-11-14, Meghan's Birthday\Meghan's Birthday 001.jpg
     * 
     * C:\Documents and Settings\shauniv\My Documents\My Pictures\2003-11-14, Meghan's Birthday\Meghan's Birthday 002.jpg
     * 
     * C:\Documents and Settings\shauniv\My Documents\My Pictures\2003-11-14, Meghan's Birthday\Meghan's Birthday 003.jpg
     * 
     * C:\Documents and Settings\shauniv\My Documents\My Pictures\2003-11-14, Meghan's Birthday\Meghan's Birthday 004.jpg
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
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresettings-setoutputfilenametemplate
     */
    SetOutputFilenameTemplate(pszTemplate) {
        pszTemplate := pszTemplate is String ? StrPtr(pszTemplate) : pszTemplate

        result := ComCall(5, this, "ptr", pszTemplate, "HRESULT")
        return result
    }

    /**
     * The SetSequencePaddingWidth method sets a value indicating how wide sequential fields in filenames will be.
     * @remarks
     * If the value passed to <c>SetSequencePaddingWidth</code> is nonzero and the format string specified in <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquiresettings-setoutputfilenametemplate">SetOutputFileNameTemplate</a> contains a sequential token, this method sets the width allotted for the sequential token. For example, given the template <code>$(GroupTag)$(AcquisitionSequence).$(OriginalExtension)</c>, if padding is set to 0, a file name might appear as 
     * ``` syntax
     * "Image1.jpg"
     * ```
     *  If padding is set to 3, the file name may appear as 
     * ``` syntax
     * "Image   1.jpg"
     * ```
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
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresettings-setsequencepaddingwidth
     */
    SetSequencePaddingWidth(dwWidth) {
        result := ComCall(6, this, "uint", dwWidth, "HRESULT")
        return result
    }

    /**
     * The SetSequenceZeroPadding method sets a value indicating whether zeros or spaces are used to pad sequential file names.
     * @remarks
     * A file name padded with zeros might appear as
     * 
     * 
     * 
     * ``` syntax
     * "IMG0001.JPG"
     * ```
     * 
     * 
     * 
     * The same file name without zero padding might appear as 
     * 
     * 
     * 
     * ``` syntax
     * "IMG   1.JPG"
     * ```
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
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresettings-setsequencezeropadding
     */
    SetSequenceZeroPadding(fZeroPad) {
        result := ComCall(7, this, "int", fZeroPad, "HRESULT")
        return result
    }

    /**
     * The SetGroupTag method sets the group tag for an acquisition session.
     * @remarks
     * The group tag is stored as a keyword in each file's metadata. It is also used in the file name if the <c>$(GroupTag)</c> token is present in the format string passed to <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquiresettings-setoutputfilenametemplate">SetOutputFileNameTemplate</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresettings-setgrouptag
     */
    SetGroupTag(pszGroupTag) {
        pszGroupTag := pszGroupTag is String ? StrPtr(pszGroupTag) : pszGroupTag

        result := ComCall(8, this, "ptr", pszGroupTag, "HRESULT")
        return result
    }

    /**
     * The SetAcquisitionTime method sets the acquisition time explicitly.
     * @remarks
     * This method is typically used to force two sessions to show the same acquisition time. If not explicitly set, acquisition time defaults to the current machine time.
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
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresettings-setacquisitiontime
     */
    SetAcquisitionTime(pftAcquisitionTime) {
        result := ComCall(9, this, "ptr", pftAcquisitionTime, "HRESULT")
        return result
    }

    /**
     * The GetFlags method retrieves the photo acquire flags.
     * @returns {Integer} Pointer to a double word value containing the photo acquire flags.
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresettings-getflags
     */
    GetFlags() {
        result := ComCall(10, this, "uint*", &pdwPhotoAcquireFlags := 0, "HRESULT")
        return pdwPhotoAcquireFlags
    }

    /**
     * The GetOutputFilenameTemplate method retrieves a format string (template) that specifies the format of file names.
     * @remarks
     * Format strings contain a mix of path literals and tokens. A format string looks like the following:
     * 
     * 
     * ``` syntax
     * 
     * $(MyPicturesFolder)\$(DateAcquired), $(EventName)\$(EventName) $(SequenceNumber).$(OriginalExtension)
     * 
     * ```
     * @returns {BSTR} Pointer to a string containing the format string.
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresettings-getoutputfilenametemplate
     */
    GetOutputFilenameTemplate() {
        pbstrTemplate := BSTR()
        result := ComCall(11, this, "ptr", pbstrTemplate, "HRESULT")
        return pbstrTemplate
    }

    /**
     * The GetSequencePaddingWidth method retrieves a value indicating how wide sequential fields in file names will be.
     * @remarks
     * If the format string specified in <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquiresettings-setoutputfilenametemplate">SetOutputFileNameTemplate</a> contains a sequential token, this method gets the width allotted for the sequential token.
     * 
     * If the format string does not contain a sequential token, the value returned by this method is not defined.
     * @returns {Integer} Pointer to a double word value containing the width of sequential fields.
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresettings-getsequencepaddingwidth
     */
    GetSequencePaddingWidth() {
        result := ComCall(12, this, "uint*", &pdwWidth := 0, "HRESULT")
        return pdwWidth
    }

    /**
     * The GetSequenceZeroPadding method retrieves a value that indicates whether zeros or spaces will be used to pad sequential file names.
     * @remarks
     * A file name padded with zeros might appear as
     * 
     * 
     * 
     * ``` syntax
     * "IMG0001.JPG"
     * ```
     * 
     * 
     * 
     * The same file name without zero padding might appear as 
     * 
     * 
     * 
     * ``` syntax
     * "IMG   1.JPG"
     * ```
     * @returns {BOOL} Pointer to a flag that, if set to <b>TRUE</b>, indicates that zeros will pad sequential file names.
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresettings-getsequencezeropadding
     */
    GetSequenceZeroPadding() {
        result := ComCall(13, this, "int*", &pfZeroPad := 0, "HRESULT")
        return pfZeroPad
    }

    /**
     * The GetGroupTag method retrieves a tag string for the group of files being downloaded from the device.
     * @remarks
     * The group tag is stored as a keyword in each file's metadata. It is also used in the file name if the <c>$(GroupTag)</c> token is present in the format string passed to <a href="https://docs.microsoft.com/windows/desktop/api/photoacquire/nf-photoacquire-iphotoacquiresettings-getoutputfilenametemplate">SetOutputFileNameTemplate</a>.
     * @returns {BSTR} Pointer to a string containing the group tag.
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresettings-getgrouptag
     */
    GetGroupTag() {
        pbstrGroupTag := BSTR()
        result := ComCall(14, this, "ptr", pbstrGroupTag, "HRESULT")
        return pbstrGroupTag
    }

    /**
     * The GetAcquisitionTime method retrieves the acquisition time of the current session.
     * @remarks
     * If not set explicitly, the acquisition time defaults to the current machine time.
     * @returns {FILETIME} Specifies acquisition time.
     * @see https://learn.microsoft.com/windows/win32/api/photoacquire/nf-photoacquire-iphotoacquiresettings-getacquisitiontime
     */
    GetAcquisitionTime() {
        pftAcquisitionTime := FILETIME()
        result := ComCall(15, this, "ptr", pftAcquisitionTime, "HRESULT")
        return pftAcquisitionTime
    }
}
