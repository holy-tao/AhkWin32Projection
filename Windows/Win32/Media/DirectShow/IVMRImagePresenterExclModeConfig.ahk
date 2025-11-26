#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVMRImagePresenterConfig.ahk

/**
 * The IVMRImagePresenterExclModeConfig interface inherits from IVMRImagePresenterConfig and provides methods for setting and retrieving the renderering preferences on the Exclusive Mode Allocator-Presenter.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ivmrimagepresenterexclmodeconfig
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRImagePresenterExclModeConfig extends IVMRImagePresenterConfig{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRImagePresenterExclModeConfig
     * @type {Guid}
     */
    static IID => Guid("{e6f7ce40-4673-44f1-8f77-5499d68cb4ea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetXlcModeDDObjAndPrimarySurface", "GetXlcModeDDObjAndPrimarySurface"]

    /**
     * The SetXlcModeDDObjAndPrimarySurface method informs the VMR of the DirectDraw object and primary surface that were created by the application.
     * @param {IDirectDraw7} lpDDObj Specifies the Exclusive Mode DirectDraw object created by the application.
     * @param {IDirectDrawSurface7} lpPrimarySurf Specifies the primary surface associated with the DirectDraw object.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrimagepresenterexclmodeconfig-setxlcmodeddobjandprimarysurface
     */
    SetXlcModeDDObjAndPrimarySurface(lpDDObj, lpPrimarySurf) {
        result := ComCall(5, this, "ptr", lpDDObj, "ptr", lpPrimarySurf, "HRESULT")
        return result
    }

    /**
     * The GetXlcModeDDObjAndPrimarySurface method retrieves the DirectDraw object and primary surface currently being used by a VMR that has been configured for DirectDraw Exclusive Mode using the SetXlcModeDDObjAndPrimarySurface method.
     * @param {Pointer<IDirectDraw7>} lpDDObj Retrieves the Exclusive Mode DirectDraw object created by the application.
     * @param {Pointer<IDirectDrawSurface7>} lpPrimarySurf Retrieves the primary surface associated with the DirectDraw object.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrimagepresenterexclmodeconfig-getxlcmodeddobjandprimarysurface
     */
    GetXlcModeDDObjAndPrimarySurface(lpDDObj, lpPrimarySurf) {
        result := ComCall(6, this, "ptr*", lpDDObj, "ptr*", lpPrimarySurf, "HRESULT")
        return result
    }
}
