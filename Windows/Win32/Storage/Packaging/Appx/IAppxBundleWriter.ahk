#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides a write-only object model for bundle packages. (IAppxBundleWriter)
 * @remarks
 * You can use the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxbundlefactory-createbundlewriter">CreateBundleWriter</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nn-appxpackaging-iappxbundlefactory">IAppxBundleFactory</a> interface to retrieve the <b>IAppxBundleWriter</b> object. 
 * 
 * You can add only app packages to the writer.  The writer automatically generates footprint files, such as, the bundle’s manifest and block map.
 * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nn-appxpackaging-iappxbundlewriter
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxBundleWriter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxBundleWriter
     * @type {Guid}
     */
    static IID => Guid("{ec446fe8-bfec-4c64-ab4f-49f038f0c6d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddPayloadPackage", "Close"]

    /**
     * Adds a new app package to the bundle. (IAppxBundleWriter.AddPayloadPackage)
     * @remarks
     * When the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxpackagewriter-addpayloadfile">AddPayloadFile</a> method succeeds the contents of the specified <i>fileName</i> are written to the package and a corresponding entry is made in the package block map.
     * 
     * <b>AddPayloadPackage</b> reads the content of the app package from <i>packageStream</i> and stores the content in the bundle with the given <i>fileName</i>. 
     * 
     * <b>AddPayloadPackage</b> can fail if:
     * 
     * <ul>
     * <li><i>packageStream</i> doesn't deliver a valid app package</li>
     * <li>The app package delivered by <i>packageStream</i> is in a different package family than an app package already added to the bundle</li>
     * <li>The app package delivered by <i>packageStream</i> is targeted to an architecture that can't reside in the same bundle as another app package already added to the bundle</li>
     * <li>The app package delivered by <i>packageStream</i> has a block map that uses a different hash method than an app package already added to the bundle</li>
     * <li><i>fileName</i> isn't a valid file name, is a reserved name, or is already used by another app package added to the bundle</li>
     * </ul>
     * @param {PWSTR} fileName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The name of the payload file. The file name path must be relative to the root of the package.
     * @param {IStream} packageStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> that provides the contents of <i>fileName</i>.
     *           The stream must support <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-read">Read</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-seek">Seek</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-stat">Stat</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an error code that includes, but is not limited to, those in the following table. Error OPC codes, in addition to  OPC_E_DUPLICATE_PART may result. If the method fails, the bundle writer will close in a failed state and can't be used any more.
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
     * The file name specified is already in use in the bundle. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlewriter-addpayloadpackage
     */
    AddPayloadPackage(fileName, packageStream) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(3, this, "ptr", fileName, "ptr", packageStream, "HRESULT")
        return result
    }

    /**
     * Finalizes the bundle package by writing footprint files at the end of the package, and closes the writer’s output stream. (IAppxBundleWriter.Close)
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxbundlewriter-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
