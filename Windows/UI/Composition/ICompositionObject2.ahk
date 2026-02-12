#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ImplicitAnimationCollection.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionObject2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionObject2
     * @type {Guid}
     */
    static IID => Guid("{ef874ea1-5cff-4b68-9e30-a1519d08ba03}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Comment", "put_Comment", "get_ImplicitAnimations", "put_ImplicitAnimations", "StartAnimationGroup", "StopAnimationGroup"]

    /**
     * @type {HSTRING} 
     */
    Comment {
        get => this.get_Comment()
        set => this.put_Comment(value)
    }

    /**
     * @type {ImplicitAnimationCollection} 
     */
    ImplicitAnimations {
        get => this.get_ImplicitAnimations()
        set => this.put_ImplicitAnimations(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Comment() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Comment(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ImplicitAnimationCollection} 
     */
    get_ImplicitAnimations() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ImplicitAnimationCollection(value)
    }

    /**
     * 
     * @param {ImplicitAnimationCollection} value 
     * @returns {HRESULT} 
     */
    put_ImplicitAnimations(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ICompositionAnimationBase} value 
     * @returns {HRESULT} 
     */
    StartAnimationGroup(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ICompositionAnimationBase} value 
     * @returns {HRESULT} 
     */
    StopAnimationGroup(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
