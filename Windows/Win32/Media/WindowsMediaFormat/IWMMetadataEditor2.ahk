#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWMMetadataEditor.ahk" { IWMMetadataEditor }

/**
 * The IWMMetadataEditor2 interface provides an improved method for opening files for metadata operations.This interface is implemented as part of the metadata editor object.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmmetadataeditor2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMMetadataEditor2 extends IWMMetadataEditor {
    /**
     * The interface identifier for IWMMetadataEditor2
     * @type {Guid}
     */
    static IID := Guid("{203cffe3-2e18-4fdf-b59d-6e71530534cf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMMetadataEditor2 interfaces
    */
    struct Vtbl extends IWMMetadataEditor.Vtbl {
        OpenEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMMetadataEditor2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The OpenEx method opens a file for use by the metadata editor object. OpenEx opens ASF files and MP3 files, though the metadata editor has limited capabilities when working with MP3 files.
     * @remarks
     * The parameters <i>dwDesiredAccess</i> and <i>dwShareMode</i> are identical to those used in the <b>OpenFile</b> function defined in the Platform SDK. In the case of <b>OpenEx</b>, however, only a limited set of values are valid for <i>dwDesiredAccess</i>. Using any value other than those specified will result in an error.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmmetadataeditor2-openex
     */
    OpenEx(pwszFilename, dwDesiredAccess, dwShareMode) {
        pwszFilename := pwszFilename is String ? StrPtr(pwszFilename) : pwszFilename

        result := ComCall(6, this, "ptr", pwszFilename, "uint", dwDesiredAccess, "uint", dwShareMode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMMetadataEditor2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OpenEx := CallbackCreate(GetMethod(implObj, "OpenEx"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OpenEx)
    }
}
