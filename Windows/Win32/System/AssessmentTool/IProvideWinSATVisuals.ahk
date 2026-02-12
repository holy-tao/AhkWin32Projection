#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Gdi\HBITMAP.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Retrieves elements that can be used in a user interface to graphically represent the WinSAT assessment.
 * @see https://learn.microsoft.com/windows/win32/api//content/winsatcominterfacei/nn-winsatcominterfacei-iprovidewinsatvisuals
 * @namespace Windows.Win32.System.AssessmentTool
 * @version v4.0.30319
 */
class IProvideWinSATVisuals extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProvideWinSATVisuals
     * @type {Guid}
     */
    static IID => Guid("{a9f4ade0-871a-42a3-b813-3078d25162c9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Bitmap"]

    /**
     * Retrieves a bitmap for the WinSAT base score.
     * @remarks
     * The bitmap is returned only for the WINSAT_ASSESSMENT_STATE_VALID and WINSAT_ASSESSMENT_STATE_INCOHERENT_WITH_HARDWARE states. The method will succeed (return value is S_OK) if you pass another state value, but the <i>pBitmap</i> parameter will be <b>NULL</b>.
     * @param {Integer} bitmapSize Determines the size of the bitmap that this method returns. For possible values, see the <a href="https://docs.microsoft.com/windows/win32/api/winsatcominterfacei/ne-winsatcominterfacei-winsat_bitmap_size">WINSAT_BITMAP_SIZE</a> enumeration.
     * @param {Integer} state The state of the assessment. To get this value, call the <a href="https://docs.microsoft.com/windows/desktop/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatresultsinfo-get_assessmentstate">IProvideWinSATResultsInfo::get_AssessmentState</a> method.
     * @param {Float} rating The base score for the computer. To get this value, call the <a href="https://docs.microsoft.com/windows/desktop/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatresultsinfo-get_systemrating">IProvideWinSATResultsInfo::get_SystemRating</a> method.
     * @returns {HBITMAP} The handle to the bitmap. To free the handle when finished, call the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deleteobject">DeleteObject</a> function.
     * @see https://learn.microsoft.com/windows/win32/api//content/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatvisuals-get_bitmap
     */
    get_Bitmap(bitmapSize, state, rating) {
        pBitmap := HBITMAP()
        result := ComCall(3, this, "int", bitmapSize, "int", state, "float", rating, "ptr", pBitmap, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pBitmap
    }
}
