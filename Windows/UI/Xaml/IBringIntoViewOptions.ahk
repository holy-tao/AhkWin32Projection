#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IBringIntoViewOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBringIntoViewOptions
     * @type {Guid}
     */
    static IID => Guid("{19bdd1b5-c7cb-46d9-a4dd-a1bbe83ef2fb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AnimationDesired", "put_AnimationDesired", "get_TargetRect", "put_TargetRect"]

    /**
     * @type {Boolean} 
     */
    AnimationDesired {
        get => this.get_AnimationDesired()
        set => this.put_AnimationDesired(value)
    }

    /**
     * @type {IReference<RECT>} 
     */
    TargetRect {
        get => this.get_TargetRect()
        set => this.put_TargetRect(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AnimationDesired() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AnimationDesired(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<RECT>} 
     */
    get_TargetRect() {
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
    put_TargetRect(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
