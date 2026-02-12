#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionObject5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionObject5
     * @type {Guid}
     */
    static IID => Guid("{1d7f391b-a130-5265-a62b-60b8e668965a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartAnimationWithController"]

    /**
     * 
     * @param {HSTRING} propertyName 
     * @param {CompositionAnimation} animation 
     * @param {AnimationController} animationController_ 
     * @returns {HRESULT} 
     */
    StartAnimationWithController(propertyName, animation, animationController_) {
        if(propertyName is String) {
            pin := HSTRING.Create(propertyName)
            propertyName := pin.Value
        }
        propertyName := propertyName is Win32Handle ? NumGet(propertyName, "ptr") : propertyName

        result := ComCall(6, this, "ptr", propertyName, "ptr", animation, "ptr", animationController_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
