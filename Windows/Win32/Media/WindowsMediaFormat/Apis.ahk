#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\IWMWriterNetworkSink.ahk" { IWMWriterNetworkSink }
#Import ".\IWMWriterPushSink.ahk" { IWMWriterPushSink }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IWMReader.ahk" { IWMReader }
#Import ".\IWMWriter.ahk" { IWMWriter }
#Import ".\IWMProfileManager.ahk" { IWMProfileManager }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWMMetadataEditor.ahk" { IWMMetadataEditor }
#Import ".\IWMSyncReader.ahk" { IWMSyncReader }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IWMLicenseBackup.ahk" { IWMLicenseBackup }
#Import ".\IWMIndexer.ahk" { IWMIndexer }
#Import ".\IWMWriterFileSink.ahk" { IWMWriterFileSink }

/**
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */

;@region Functions
/**
 * The WMIsContentProtected function checks a file for DRM-protected content. This function is a shortcut so that your application can quickly identify protected files.
 * @param {PWSTR} pwszFileName Pointer to a wide-character <b>null</b>-terminated string containing the name of the file to check for DRM-protected content.
 * @param {Pointer<BOOL>} pfIsProtected Pointer to a Boolean value that is set to True on function return if the file contains DRM-protected content.
 * @returns {HRESULT} The function returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
 * The function succeeded.
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
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>S_FALSE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The content is unprotected.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-wmiscontentprotected
 * @since windows5.0
 */
export WMIsContentProtected(pwszFileName, pfIsProtected) {
    pwszFileName := pwszFileName is String ? StrPtr(pwszFileName) : pwszFileName

    pfIsProtectedMarshal := pfIsProtected is VarRef ? "int*" : "ptr"

    result := DllCall("WMVCore.dll\WMIsContentProtected", "ptr", pwszFileName, pfIsProtectedMarshal, pfIsProtected, "HRESULT")
    return result
}

/**
 * The WMCreateWriter function creates a writer object.
 * @param {IUnknown} pUnkCert Pointer to an <b>IUnknown</b> interface. This value is not used and should be set to <b>NULL</b>.
 * @returns {IWMWriter} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmwriter">IWMWriter</a> interface of the newly created writer object.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-wmcreatewriter
 * @since windows5.0
 */
export WMCreateWriter(pUnkCert) {
    result := DllCall("WMVCore.dll\WMCreateWriter", "ptr", pUnkCert, "ptr*", &ppWriter := 0, "HRESULT")
    return IWMWriter(ppWriter)
}

/**
 * The WMCreateReader function creates a reader object.
 * @remarks
 * After this object has been created, you can modify the rights that will be requested for the next file opened by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmdrmreader-setdrmproperty">IWMDRMReader::SetDRMProperty</a> with the <a href="https://docs.microsoft.com/windows/desktop/wmformat/drm-rights">DRM_Rights</a> property. Note that when using this property, the rights are specified as strings, not as <b>DWORD</b> values.
 * 
 * The <i>dwRights</i> parameter may be set to 0 when reading non-DRM content. If <i>dwRights</i> is set to 0 and you open a protected file, you can access license related metadata, but you cannot read data from any streams in the file.
 * @param {IUnknown} pUnkCert This value must be set to <b>NULL</b>.
 * @param {Integer} dwRights <b>DWORD</b> indicating the desired operation. Set to one of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_rights">WMT_RIGHTS</a> enumeration type, indicating the operation that is performed on this file. If multiple operations are being performed, <i>dwRights</i> must consist of multiple values from <b>WMT_RIGHTS</b> combined by using the bitwise <b>OR</b> operator.
 * @returns {IWMReader} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmreader">IWMReader</a> interface of the newly created reader object.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-wmcreatereader
 * @since windows5.0
 */
export WMCreateReader(pUnkCert, dwRights) {
    result := DllCall("WMVCore.dll\WMCreateReader", "ptr", pUnkCert, "uint", dwRights, "ptr*", &ppReader := 0, "HRESULT")
    return IWMReader(ppReader)
}

/**
 * The WMCreateSyncReader function creates a synchronous reader object.
 * @param {IUnknown} pUnkCert Pointer to an <b>IUnknown</b> interface. This value must be set to <b>NULL</b>.
 * @param {Integer} dwRights <b>DWORD</b> specifying the desired operation. When playing back non-DRM content, or for an application that does not have DRM rights, this value can be set to zero. Otherwise, this value must be one of the values from the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_rights">WMT_RIGHTS</a> enumeration type, indicating the operation that is performed on this file. If multiple operations are being performed, <b>dwRights</b> must consist of multiple values from <b>WMT_RIGHTS</b> combined by using the bitwise <b>OR</b> operator.
 * @returns {IWMSyncReader} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmsyncreader">IWMSyncReader</a> interface of the newly created synchronous reader object.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-wmcreatesyncreader
 * @since windows5.0
 */
export WMCreateSyncReader(pUnkCert, dwRights) {
    result := DllCall("WMVCore.dll\WMCreateSyncReader", "ptr", pUnkCert, "uint", dwRights, "ptr*", &ppSyncReader := 0, "HRESULT")
    return IWMSyncReader(ppSyncReader)
}

/**
 * The WMCreateEditor function creates a metadata editor object.
 * @returns {IWMMetadataEditor} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmmetadataeditor">IWMMetadataEditor</a> interface of the newly created metadata editor object.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-wmcreateeditor
 * @since windows5.0
 */
export WMCreateEditor() {
    result := DllCall("WMVCore.dll\WMCreateEditor", "ptr*", &ppEditor := 0, "HRESULT")
    return IWMMetadataEditor(ppEditor)
}

/**
 * The WMCreateIndexer function creates an indexer object.
 * @returns {IWMIndexer} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmindexer">IWMIndexer</a> interface of the newly created indexer object.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-wmcreateindexer
 * @since windows5.0
 */
export WMCreateIndexer() {
    result := DllCall("WMVCore.dll\WMCreateIndexer", "ptr*", &ppIndexer := 0, "HRESULT")
    return IWMIndexer(ppIndexer)
}

/**
 * The WMCreateBackupRestorer function creates a backup restorer object.
 * @remarks
 * Use <b>IWMLicenseBackup::QueryInterface</b> to obtain a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmbackuprestoreprops">IWMBackupRestoreProps</a> interface.
 * @param {IUnknown} pCallback Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmstatuscallback">IWMStatusCallback</a> interface containing the <b>OnStatus</b> callback method to be used by the new backup restorer object.
 * @returns {IWMLicenseBackup} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmlicensebackup">IWMLicenseBackup</a> interface of the newly created backup restorer object.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-wmcreatebackuprestorer
 * @since windows5.0
 */
export WMCreateBackupRestorer(pCallback) {
    result := DllCall("WMVCore.dll\WMCreateBackupRestorer", "ptr", pCallback, "ptr*", &ppBackup := 0, "HRESULT")
    return IWMLicenseBackup(ppBackup)
}

/**
 * The WMCreateProfileManager function creates a profile manager object.
 * @remarks
 * When a profile manager object is created, it parses all of the system profiles. Creating and releasing a profile manager every time you need to use it will adversely affect performance. You should create a profile manager once in your application and release it only when you no longer need to use it.
 * @returns {IWMProfileManager} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmprofilemanager">IWMProfileManager</a> interface of the newly created profile manager object.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-wmcreateprofilemanager
 * @since windows5.0
 */
export WMCreateProfileManager() {
    result := DllCall("WMVCore.dll\WMCreateProfileManager", "ptr*", &ppProfileManager := 0, "HRESULT")
    return IWMProfileManager(ppProfileManager)
}

/**
 * The WMCreateWriterFileSink function creates a writer file sink object.
 * @returns {IWMWriterFileSink} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmwriterfilesink">IWMWriterFileSink</a> interface of the newly created writer file sink object.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-wmcreatewriterfilesink
 * @since windows5.0
 */
export WMCreateWriterFileSink() {
    result := DllCall("WMVCore.dll\WMCreateWriterFileSink", "ptr*", &ppSink := 0, "HRESULT")
    return IWMWriterFileSink(ppSink)
}

/**
 * The WMCreateWriterNetworkSink function creates a writer network sink object.
 * @returns {IWMWriterNetworkSink} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmwriternetworksink">IWMWriterNetworkSink</a> interface of the newly created writer network sink object.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-wmcreatewriternetworksink
 * @since windows5.0
 */
export WMCreateWriterNetworkSink() {
    result := DllCall("WMVCore.dll\WMCreateWriterNetworkSink", "ptr*", &ppSink := 0, "HRESULT")
    return IWMWriterNetworkSink(ppSink)
}

/**
 * The WMCreateWriterPushSink function creates a writer push sink object. Push sinks are used to deliver streaming content to other media servers for distribution.
 * @returns {IWMWriterPushSink} Pointer to a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmwriterpushsink">IWMWriterPushSink</a> interface of the newly created writer push sink object.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-wmcreatewriterpushsink
 * @since windows5.0
 */
export WMCreateWriterPushSink() {
    result := DllCall("WMVCore.dll\WMCreateWriterPushSink", "ptr*", &ppSink := 0, "HRESULT")
    return IWMWriterPushSink(ppSink)
}

;@endregion Functions
