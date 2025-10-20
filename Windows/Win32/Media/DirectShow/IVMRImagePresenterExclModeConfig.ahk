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
     * 
     * @param {IDirectDraw7} lpDDObj 
     * @param {IDirectDrawSurface7} lpPrimarySurf 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrimagepresenterexclmodeconfig-setxlcmodeddobjandprimarysurface
     */
    SetXlcModeDDObjAndPrimarySurface(lpDDObj, lpPrimarySurf) {
        result := ComCall(5, this, "ptr", lpDDObj, "ptr", lpPrimarySurf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDirectDraw7>} lpDDObj 
     * @param {Pointer<IDirectDrawSurface7>} lpPrimarySurf 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrimagepresenterexclmodeconfig-getxlcmodeddobjandprimarysurface
     */
    GetXlcModeDDObjAndPrimarySurface(lpDDObj, lpPrimarySurf) {
        result := ComCall(6, this, "ptr*", lpDDObj, "ptr*", lpPrimarySurf, "HRESULT")
        return result
    }
}
