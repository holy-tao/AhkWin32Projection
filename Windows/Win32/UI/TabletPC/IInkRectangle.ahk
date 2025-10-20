#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkrectangle
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkRectangle extends IDispatch{
    /**
     * The interface identifier for IInkRectangle
     * @type {Guid}
     */
    static IID => Guid("{9794ff82-6071-4717-8a8b-6ac7c64a686e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} Units 
     * @returns {HRESULT} 
     */
    get_Top(Units) {
        result := ComCall(7, this, "int*", Units, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Units 
     * @returns {HRESULT} 
     */
    put_Top(Units) {
        result := ComCall(8, this, "int", Units, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Units 
     * @returns {HRESULT} 
     */
    get_Left(Units) {
        result := ComCall(9, this, "int*", Units, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Units 
     * @returns {HRESULT} 
     */
    put_Left(Units) {
        result := ComCall(10, this, "int", Units, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Units 
     * @returns {HRESULT} 
     */
    get_Bottom(Units) {
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
    put_Bottom(Units) {
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
    get_Right(Units) {
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
    put_Right(Units) {
        result := ComCall(14, this, "int", Units, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} Rect 
     * @returns {HRESULT} 
     */
    get_Data(Rect) {
        result := ComCall(15, this, "ptr", Rect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {RECT} Rect 
     * @returns {HRESULT} 
     */
    put_Data(Rect) {
        result := ComCall(16, this, "ptr", Rect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Top 
     * @param {Pointer<Int32>} Left 
     * @param {Pointer<Int32>} Bottom 
     * @param {Pointer<Int32>} Right 
     * @returns {HRESULT} 
     */
    GetRectangle(Top, Left, Bottom, Right) {
        result := ComCall(17, this, "int*", Top, "int*", Left, "int*", Bottom, "int*", Right, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Top 
     * @param {Integer} Left 
     * @param {Integer} Bottom 
     * @param {Integer} Right 
     * @returns {HRESULT} 
     */
    SetRectangle(Top, Left, Bottom, Right) {
        result := ComCall(18, this, "int", Top, "int", Left, "int", Bottom, "int", Right, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
