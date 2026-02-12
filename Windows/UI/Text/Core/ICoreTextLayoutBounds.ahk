#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\Foundation\RECT.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Text.Core
 * @version WindowsRuntime 1.4
 */
class ICoreTextLayoutBounds extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreTextLayoutBounds
     * @type {Guid}
     */
    static IID => Guid("{e972c974-4436-4917-80d0-a525e4ca6780}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TextBounds", "put_TextBounds", "get_ControlBounds", "put_ControlBounds"]

    /**
     * @type {RECT} 
     */
    TextBounds {
        get => this.get_TextBounds()
        set => this.put_TextBounds(value)
    }

    /**
     * @type {RECT} 
     */
    ControlBounds {
        get => this.get_ControlBounds()
        set => this.put_ControlBounds(value)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_TextBounds() {
        value := RECT()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {RECT} value 
     * @returns {HRESULT} 
     */
    put_TextBounds(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_ControlBounds() {
        value := RECT()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {RECT} value 
     * @returns {HRESULT} 
     */
    put_ControlBounds(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
