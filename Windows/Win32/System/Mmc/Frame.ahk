#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents the name of a frame to target when the application is open as an Active document in a container application. The default is an empty string.
 * @remarks
 * To get a reference to the Frame cell by name from another formula, or from a program using the **CellsU** property, use: 
 *   
 * ||Value |
 * |:-----|:-----|
 * | **Cell name:**  <br/> | Hyperlink.  *name*  .Frame            where Hyperlink.  *name*  is the row name  <br/> |
 *    
 * To get a reference to the Frame cell by index from a program, use the **CellsSRC** property with the following arguments: 
 *   
 * ||Value |
 * |:-----|:-----|
 * | **Section index:**  <br/> |**visSectionHyperlink** <br/> |
 * | **Row index:**  <br/> |**visRow1stHyperlink** +  *i*            where  *i*  = 0, 1, 2... |
 * | **Cell index:**  <br/> |**visHLinkFrame** <br/> |
 * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/frame-cell-hyperlinks-section
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
     * @type {Integer} 
     */
    Top {
        get => this.get_Top()
        set => this.put_Top(value)
    }

    /**
     * @type {Integer} 
     */
    Bottom {
        get => this.get_Bottom()
        set => this.put_Bottom(value)
    }

    /**
     * @type {Integer} 
     */
    Left {
        get => this.get_Left()
        set => this.put_Left(value)
    }

    /**
     * @type {Integer} 
     */
    Right {
        get => this.get_Right()
        set => this.put_Right(value)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Maximize() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Minimize() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initiates a system restore.
     * @returns {HRESULT} If the method succeeds, the return value is S\_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/sr/restore-systemrestore
     */
    Restore() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Top() {
        result := ComCall(10, this, "int*", &Top := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Top
    }

    /**
     * 
     * @param {Integer} top 
     * @returns {HRESULT} 
     */
    put_Top(top) {
        result := ComCall(11, this, "int", top, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Bottom() {
        result := ComCall(12, this, "int*", &Bottom := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Bottom
    }

    /**
     * 
     * @param {Integer} bottom 
     * @returns {HRESULT} 
     */
    put_Bottom(bottom) {
        result := ComCall(13, this, "int", bottom, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Left() {
        result := ComCall(14, this, "int*", &Left := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Left
    }

    /**
     * 
     * @param {Integer} left 
     * @returns {HRESULT} 
     */
    put_Left(left) {
        result := ComCall(15, this, "int", left, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Right() {
        result := ComCall(16, this, "int*", &Right := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Right
    }

    /**
     * 
     * @param {Integer} right 
     * @returns {HRESULT} 
     */
    put_Right(right) {
        result := ComCall(17, this, "int", right, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
