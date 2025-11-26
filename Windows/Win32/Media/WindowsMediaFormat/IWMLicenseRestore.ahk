#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMLicenseRestore interface manages the restoring of licenses.This interface is obtained from another interface on the backup restorer object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmlicenserestore
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMLicenseRestore extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMLicenseRestore
     * @type {Guid}
     */
    static IID => Guid("{c70b6334-a22e-4efb-a245-15e65a004a13}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RestoreLicenses", "CancelLicenseRestore"]

    /**
     * The RestoreLicenses method restores licenses that were previously backed up.
     * @param {Integer} dwFlags <b>DWORD</b> containing the flags.
     * 
     * <table>
     * <tr>
     * <th>Flag
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WM_RESTORE_INDIVIDUALIZE</td>
     * <td>Indicates that the application has received permission from the user to individualize their computer. (See <a href="https://docs.microsoft.com/windows/desktop/wmformat/individualizing-drm-applications">Individualizing DRM Applications</a> section.)</td>
     * </tr>
     * </table>
     * @param {IWMStatusCallback} pCallback Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmstatuscallback">IWMStatusCallback</a> interface.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmlicenserestore-restorelicenses
     */
    RestoreLicenses(dwFlags, pCallback) {
        result := ComCall(3, this, "uint", dwFlags, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * The CancelLicenseRestore method cancels a current restore operation.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmlicenserestore-cancellicenserestore
     */
    CancelLicenseRestore() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
