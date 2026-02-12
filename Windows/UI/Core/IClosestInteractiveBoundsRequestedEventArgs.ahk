#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\POINT.ahk
#Include ..\..\Win32\Foundation\RECT.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class IClosestInteractiveBoundsRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClosestInteractiveBoundsRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{347c11d7-f6f8-40e3-b29f-ae50d3e86486}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PointerPosition", "get_SearchBounds", "get_ClosestInteractiveBounds", "put_ClosestInteractiveBounds"]

    /**
     * @type {POINT} 
     */
    PointerPosition {
        get => this.get_PointerPosition()
    }

    /**
     * @type {RECT} 
     */
    SearchBounds {
        get => this.get_SearchBounds()
    }

    /**
     * @type {RECT} 
     */
    ClosestInteractiveBounds {
        get => this.get_ClosestInteractiveBounds()
        set => this.put_ClosestInteractiveBounds(value)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_PointerPosition() {
        value := POINT()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_SearchBounds() {
        value := RECT()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_ClosestInteractiveBounds() {
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
    put_ClosestInteractiveBounds(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
