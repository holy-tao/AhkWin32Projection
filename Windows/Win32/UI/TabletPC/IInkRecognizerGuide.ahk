#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkrecognizerguide
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkRecognizerGuide extends IDispatch{
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
     * 
     * @param {Pointer<IInkRectangle>} Rectangle 
     * @returns {HRESULT} 
     */
    get_WritingBox(Rectangle) {
        result := ComCall(7, this, "ptr", Rectangle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkRectangle>} Rectangle 
     * @returns {HRESULT} 
     */
    put_WritingBox(Rectangle) {
        result := ComCall(8, this, "ptr", Rectangle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkRectangle>} Rectangle 
     * @returns {HRESULT} 
     */
    get_DrawnBox(Rectangle) {
        result := ComCall(9, this, "ptr", Rectangle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkRectangle>} Rectangle 
     * @returns {HRESULT} 
     */
    put_DrawnBox(Rectangle) {
        result := ComCall(10, this, "ptr", Rectangle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Units 
     * @returns {HRESULT} 
     */
    get_Rows(Units) {
        result := ComCall(11, this, "int*", Units, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Units 
     * @returns {HRESULT} 
     */
    put_Rows(Units) {
        result := ComCall(12, this, "int", Units, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Units 
     * @returns {HRESULT} 
     */
    get_Columns(Units) {
        result := ComCall(13, this, "int*", Units, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Units 
     * @returns {HRESULT} 
     */
    put_Columns(Units) {
        result := ComCall(14, this, "int", Units, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Units 
     * @returns {HRESULT} 
     */
    get_Midline(Units) {
        result := ComCall(15, this, "int*", Units, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Units 
     * @returns {HRESULT} 
     */
    put_Midline(Units) {
        result := ComCall(16, this, "int", Units, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<InkRecoGuide>} pRecoGuide 
     * @returns {HRESULT} 
     */
    get_GuideData(pRecoGuide) {
        result := ComCall(17, this, "ptr", pRecoGuide, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {InkRecoGuide} recoGuide 
     * @returns {HRESULT} 
     */
    put_GuideData(recoGuide) {
        result := ComCall(18, this, "ptr", recoGuide, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
