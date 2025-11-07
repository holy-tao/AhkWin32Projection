#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkrectangle
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkRectangle extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Top", "put_Top", "get_Left", "put_Left", "get_Bottom", "put_Bottom", "get_Right", "put_Right", "get_Data", "put_Data", "GetRectangle", "SetRectangle"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrectangle-get_top
     */
    get_Top() {
        result := ComCall(7, this, "int*", &Units := 0, "HRESULT")
        return Units
    }

    /**
     * 
     * @param {Integer} Units 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrectangle-put_top
     */
    put_Top(Units) {
        result := ComCall(8, this, "int", Units, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrectangle-get_left
     */
    get_Left() {
        result := ComCall(9, this, "int*", &Units := 0, "HRESULT")
        return Units
    }

    /**
     * 
     * @param {Integer} Units 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrectangle-put_left
     */
    put_Left(Units) {
        result := ComCall(10, this, "int", Units, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrectangle-get_bottom
     */
    get_Bottom() {
        result := ComCall(11, this, "int*", &Units := 0, "HRESULT")
        return Units
    }

    /**
     * 
     * @param {Integer} Units 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrectangle-put_bottom
     */
    put_Bottom(Units) {
        result := ComCall(12, this, "int", Units, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrectangle-get_right
     */
    get_Right() {
        result := ComCall(13, this, "int*", &Units := 0, "HRESULT")
        return Units
    }

    /**
     * 
     * @param {Integer} Units 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrectangle-put_right
     */
    put_Right(Units) {
        result := ComCall(14, this, "int", Units, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {RECT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrectangle-get_data
     */
    get_Data() {
        Rect := RECT()
        result := ComCall(15, this, "ptr", Rect, "HRESULT")
        return Rect
    }

    /**
     * 
     * @param {RECT} Rect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrectangle-put_data
     */
    put_Data(Rect) {
        result := ComCall(16, this, "ptr", Rect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Top 
     * @param {Pointer<Integer>} Left 
     * @param {Pointer<Integer>} Bottom 
     * @param {Pointer<Integer>} Right 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrectangle-getrectangle
     */
    GetRectangle(Top, Left, Bottom, Right) {
        TopMarshal := Top is VarRef ? "int*" : "ptr"
        LeftMarshal := Left is VarRef ? "int*" : "ptr"
        BottomMarshal := Bottom is VarRef ? "int*" : "ptr"
        RightMarshal := Right is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, TopMarshal, Top, LeftMarshal, Left, BottomMarshal, Bottom, RightMarshal, Right, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Top 
     * @param {Integer} Left 
     * @param {Integer} Bottom 
     * @param {Integer} Right 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrectangle-setrectangle
     */
    SetRectangle(Top, Left, Bottom, Right) {
        result := ComCall(18, this, "int", Top, "int", Left, "int", Bottom, "int", Right, "HRESULT")
        return result
    }
}
