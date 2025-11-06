#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInkRectangle.ahk
#Include .\InkRecoGuide.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkrecognizerguide
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkRecognizerGuide extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkRecognizerGuide
     * @type {Guid}
     */
    static IID => Guid("{d934be07-7b84-4208-9136-83c20994e905}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_WritingBox", "put_WritingBox", "get_DrawnBox", "put_DrawnBox", "get_Rows", "put_Rows", "get_Columns", "put_Columns", "get_Midline", "put_Midline", "get_GuideData", "put_GuideData"]

    /**
     * 
     * @returns {IInkRectangle} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_writingbox
     */
    get_WritingBox() {
        result := ComCall(7, this, "ptr*", &Rectangle := 0, "HRESULT")
        return IInkRectangle(Rectangle)
    }

    /**
     * 
     * @param {IInkRectangle} Rectangle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizerguide-put_writingbox
     */
    put_WritingBox(Rectangle) {
        result := ComCall(8, this, "ptr", Rectangle, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IInkRectangle} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_drawnbox
     */
    get_DrawnBox() {
        result := ComCall(9, this, "ptr*", &Rectangle := 0, "HRESULT")
        return IInkRectangle(Rectangle)
    }

    /**
     * 
     * @param {IInkRectangle} Rectangle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizerguide-put_drawnbox
     */
    put_DrawnBox(Rectangle) {
        result := ComCall(10, this, "ptr", Rectangle, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_rows
     */
    get_Rows() {
        result := ComCall(11, this, "int*", &Units := 0, "HRESULT")
        return Units
    }

    /**
     * 
     * @param {Integer} Units 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizerguide-put_rows
     */
    put_Rows(Units) {
        result := ComCall(12, this, "int", Units, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_columns
     */
    get_Columns() {
        result := ComCall(13, this, "int*", &Units := 0, "HRESULT")
        return Units
    }

    /**
     * 
     * @param {Integer} Units 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizerguide-put_columns
     */
    put_Columns(Units) {
        result := ComCall(14, this, "int", Units, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_midline
     */
    get_Midline() {
        result := ComCall(15, this, "int*", &Units := 0, "HRESULT")
        return Units
    }

    /**
     * 
     * @param {Integer} Units 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizerguide-put_midline
     */
    put_Midline(Units) {
        result := ComCall(16, this, "int", Units, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {InkRecoGuide} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizerguide-get_guidedata
     */
    get_GuideData() {
        pRecoGuide := InkRecoGuide()
        result := ComCall(17, this, "ptr", pRecoGuide, "HRESULT")
        return pRecoGuide
    }

    /**
     * 
     * @param {InkRecoGuide} recoGuide 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizerguide-put_guidedata
     */
    put_GuideData(recoGuide) {
        result := ComCall(18, this, "ptr", recoGuide, "HRESULT")
        return result
    }
}
