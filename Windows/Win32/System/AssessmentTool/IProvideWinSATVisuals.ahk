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
     * 
     * @param {Integer} bitmapSize 
     * @param {Integer} state 
     * @param {Float} rating 
     * @param {Pointer<HBITMAP>} pBitmap 
     * @returns {HRESULT} 
     */
    get_Bitmap(bitmapSize, state, rating, pBitmap) {
        result := ComCall(3, this, "int", bitmapSize, "int", state, "float", rating, "ptr", pBitmap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
