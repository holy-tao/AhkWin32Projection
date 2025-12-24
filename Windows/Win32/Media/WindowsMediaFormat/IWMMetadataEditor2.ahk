#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMMetadataEditor.ahk

/**
 * The IWMMetadataEditor2 interface provides an improved method for opening files for metadata operations.This interface is implemented as part of the metadata editor object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmmetadataeditor2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMMetadataEditor2 extends IWMMetadataEditor{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMMetadataEditor2
     * @type {Guid}
     */
    static IID => Guid("{203cffe3-2e18-4fdf-b59d-6e71530534cf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenEx"]

    /**
     * The OpenEx method opens a file for use by the metadata editor object. OpenEx opens ASF files and MP3 files, though the metadata editor has limited capabilities when working with MP3 files.
     * @param {PWSTR} pwszFilename Pointer to a wide-character null-terminated string containing the file name.
     * @param {Integer} dwDesiredAccess <b>DWORD</b> containing the desired access type. This can be set to GENERIC_READ or GENERIC_WRITE. For read/write access, pass both values combined with a bitwise <b>OR</b>. When using GENERIC_READ, you must also pass a valid sharing mode as <i>dwShareMode</i>. Failure to do so will result in an error.
     * @param {Integer} dwShareMode <b>DWORD</b> containing the sharing mode. This can be one of the values in the following table or a combination of the two using a bitwise <b>OR</b>. A value of zero indicates no sharing. Sharing is not supported when requesting read/write access. If you request read/write access and pass any value other than zero for the share mode, an error is returned.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>FILE_SHARE_READ</td>
     * <td>Subsequent open operations on the file will succeed only if read access is requested.</td>
     * </tr>
     * <tr>
     * <td>FILE_SHARE_DELETE</td>
     * <td>(NTFS only) Subsequent open operations on the file will succeed only if it is being deleted.</td>
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
     * Read/write access has been requested using file sharing.
     * 
     * OR
     * 
     * Read access has been requested without indicating read-and-delete file sharing.
     * 
     * OR
     * 
     * The access mode requested is not available with this method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmmetadataeditor2-openex
     */
    OpenEx(pwszFilename, dwDesiredAccess, dwShareMode) {
        pwszFilename := pwszFilename is String ? StrPtr(pwszFilename) : pwszFilename

        result := ComCall(6, this, "ptr", pwszFilename, "uint", dwDesiredAccess, "uint", dwShareMode, "HRESULT")
        return result
    }
}
