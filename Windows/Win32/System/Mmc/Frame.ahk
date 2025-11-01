#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/medfound/framerateconverter
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class Frame extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for Frame
     * @type {Guid}
     */
    static IID => Guid("{e5e2d970-5bb3-4306-8804-b0968a31c8e6}")

    /**
     * The class identifier for Frame
     * @type {Guid}
     */
    static CLSID => Guid("{e5e2d970-5bb3-4306-8804-b0968a31c8e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Maximize", "Minimize", "Restore", "get_Top", "put_Top", "get_Bottom", "put_Bottom", "get_Left", "put_Left", "get_Right", "put_Right"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Maximize() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Minimize() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Restore() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Top 
     * @returns {HRESULT} 
     */
    get_Top(Top) {
        TopMarshal := Top is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, TopMarshal, Top, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} top 
     * @returns {HRESULT} 
     */
    put_Top(top) {
        result := ComCall(11, this, "int", top, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Bottom 
     * @returns {HRESULT} 
     */
    get_Bottom(Bottom) {
        BottomMarshal := Bottom is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, BottomMarshal, Bottom, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bottom 
     * @returns {HRESULT} 
     */
    put_Bottom(bottom) {
        result := ComCall(13, this, "int", bottom, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Left 
     * @returns {HRESULT} 
     */
    get_Left(Left) {
        LeftMarshal := Left is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, LeftMarshal, Left, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} left 
     * @returns {HRESULT} 
     */
    put_Left(left) {
        result := ComCall(15, this, "int", left, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Right 
     * @returns {HRESULT} 
     */
    get_Right(Right) {
        RightMarshal := Right is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, RightMarshal, Right, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} right 
     * @returns {HRESULT} 
     */
    put_Right(right) {
        result := ComCall(17, this, "int", right, "HRESULT")
        return result
    }
}
