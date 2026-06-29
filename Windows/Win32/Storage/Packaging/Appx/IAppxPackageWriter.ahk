#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\APPX_COMPRESSION_OPTION.ahk" { APPX_COMPRESSION_OPTION }
#Import "..\..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a write-only object model for app packages. (IAppxPackageWriter)
 * @remarks
 * This object can be retrieved using the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxfactory-createpackagewriter">CreatePackageWriter</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxfactory">IAppxFactory</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxpackagewriter
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct IAppxPackageWriter extends IUnknown {
    /**
     * The interface identifier for IAppxPackageWriter
     * @type {Guid}
     */
    static IID := Guid("{9099e33b-246f-41e4-881a-008eb613f858}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAppxPackageWriter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddPayloadFile : IntPtr
        Close          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAppxPackageWriter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds a new payload file to the app package.
     * @remarks
     * When the <b>AddPayloadFile</b> method succeeds the contents of the specified <i>fileName</i> are written to the package and a corresponding entry is made in the package block map.
     * 
     * 
     * <div class="alert"><b>Note</b>  Files with the following reserved filenames cannot be added to the package using the <b>AddPayloadFile</b> method:
     * 
     * `AppxManifest.xml`, `AppxBlockMap.xml`, `AppxStreamMap.xml`, and `AppxSignature.p7x`.
     * 
     * Also, files with the following reserved folder prefixes cannot be added to the package using the <b>AddPayloadFile</b> method: `\AppxMetadata\` and `\Microsoft.System.Package.Metadata\`.
     * @param {PWSTR} fileName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The name of the payload file. The file name path must be relative to the root of the package.
     * @param {PWSTR} contentType Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The string specifying the <a href="https://www.w3.org/Protocols/rfc2616/rfc2616.html">content type</a> of  <i>fileName</i>.
     * @param {APPX_COMPRESSION_OPTION} compressionOption Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/ne-appxpackaging-appx_compression_option">APPX_COMPRESSION_OPTION</a></b>
     * 
     * The type of compression to use  to store <i>fileName</i> in the package.
     * @param {IStream} inputStream Type: <b>IStream*</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> providing the contents of <i>fileName</i>.
     *           The stream must support <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-read">Read</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-seek">Seek</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-stat">Stat</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an error code that includes, but is not limited to, those in the following table. Error OPC codes, in addition to  OPC_E_DUPLICATE_PART may result. If the method fails, the package writer will close in a failed state and can't be used any more.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The compression option specified by <i>compressionOption</i> is not one of the values of the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/ne-appxpackaging-appx_compression_option">APPX_COMPRESSION_OPTION</a> enumeration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOT_VALID_STATE </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer is closed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INVALID_NAME)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file name specified is not a valid file name or is a reserved name for a footprint file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>OPC_E_DUPLICATE_PART</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file name specified is already in use in the package. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxpackagewriter-addpayloadfile
     */
    AddPayloadFile(fileName, contentType, compressionOption, inputStream) {
        fileName := fileName is String ? StrPtr(fileName) : fileName
        contentType := contentType is String ? StrPtr(contentType) : contentType

        result := ComCall(3, this, "ptr", fileName, "ptr", contentType, APPX_COMPRESSION_OPTION, compressionOption, "ptr", inputStream, "HRESULT")
        return result
    }

    /**
     * Writes footprint files at the end of the app package, and closes the package writer object's output stream.
     * @remarks
     * The <b>Close</b> method should be called only after all payload files have been added to the package.
     * @param {IStream} manifest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * The stream that provides the contents of the manifest for the package. The stream must support <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-read">Read</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-seek">Seek</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-stat">Stat</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an error code that includes, but is not limited to, those in the following table. 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOT_VALID_STATE </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer is closed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>APPX_E_INVALID_MANIFEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input stream contains a manifest that is not valid. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxpackagewriter-close
     */
    Close(manifest) {
        result := ComCall(4, this, "ptr", manifest, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAppxPackageWriter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddPayloadFile := CallbackCreate(GetMethod(implObj, "AddPayloadFile"), flags, 5)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddPayloadFile)
        CallbackFree(this.vtbl.Close)
    }
}
