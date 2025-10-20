#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class Frame extends IDispatch{
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
     * 
     * @returns {HRESULT} 
     */
    Maximize() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Minimize() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Restore() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Top 
     * @returns {HRESULT} 
     */
    get_Top(Top) {
        result := ComCall(10, this, "int*", Top, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} top 
     * @returns {HRESULT} 
     */
    put_Top(top) {
        result := ComCall(11, this, "int", top, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Bottom 
     * @returns {HRESULT} 
     */
    get_Bottom(Bottom) {
        result := ComCall(12, this, "int*", Bottom, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bottom 
     * @returns {HRESULT} 
     */
    put_Bottom(bottom) {
        result := ComCall(13, this, "int", bottom, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Left 
     * @returns {HRESULT} 
     */
    get_Left(Left) {
        result := ComCall(14, this, "int*", Left, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} left 
     * @returns {HRESULT} 
     */
    put_Left(left) {
        result := ComCall(15, this, "int", left, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Right 
     * @returns {HRESULT} 
     */
    get_Right(Right) {
        result := ComCall(16, this, "int*", Right, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} right 
     * @returns {HRESULT} 
     */
    put_Right(right) {
        result := ComCall(17, this, "int", right, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
