#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IReference.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class ILauncherUIOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILauncherUIOptions
     * @type {Guid}
     */
    static IID => Guid("{1b25da6e-8aa6-41e9-8251-4165f5985f49}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InvocationPoint", "put_InvocationPoint", "get_SelectionRect", "put_SelectionRect", "get_PreferredPlacement", "put_PreferredPlacement"]

    /**
     * @type {IReference<POINT>} 
     */
    InvocationPoint {
        get => this.get_InvocationPoint()
        set => this.put_InvocationPoint(value)
    }

    /**
     * @type {IReference<RECT>} 
     */
    SelectionRect {
        get => this.get_SelectionRect()
        set => this.put_SelectionRect(value)
    }

    /**
     * @type {Integer} 
     */
    PreferredPlacement {
        get => this.get_PreferredPlacement()
        set => this.put_PreferredPlacement(value)
    }

    /**
     * 
     * @returns {IReference<POINT>} 
     */
    get_InvocationPoint() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetPOINT(), value)
    }

    /**
     * 
     * @param {IReference<POINT>} value 
     * @returns {HRESULT} 
     */
    put_InvocationPoint(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<RECT>} 
     */
    get_SelectionRect() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetRECT(), value)
    }

    /**
     * 
     * @param {IReference<RECT>} value 
     * @returns {HRESULT} 
     */
    put_SelectionRect(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PreferredPlacement() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PreferredPlacement(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
