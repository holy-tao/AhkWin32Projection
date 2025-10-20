#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Retrieves elements that can be used in a user interface to graphically represent the WinSAT assessment.
 * @see https://docs.microsoft.com/windows/win32/api//winsatcominterfacei/nn-winsatcominterfacei-iprovidewinsatvisuals
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
     * 
     * @param {Integer} bitmapSize 
     * @param {Integer} state 
     * @param {Float} rating 
     * @param {Pointer<HBITMAP>} pBitmap 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iprovidewinsatvisuals-get_bitmap
     */
    get_Bitmap(bitmapSize, state, rating, pBitmap) {
        result := ComCall(3, this, "int", bitmapSize, "int", state, "float", rating, "ptr", pBitmap, "HRESULT")
        return result
    }
}
