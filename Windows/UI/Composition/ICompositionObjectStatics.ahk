#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionObjectStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionObjectStatics
     * @type {Guid}
     */
    static IID => Guid("{c1ed052f-1ba2-44ba-a904-6a882a0a5adb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartAnimationWithIAnimationObject", "StartAnimationGroupWithIAnimationObject"]

    /**
     * 
     * @param {IAnimationObject} target 
     * @param {HSTRING} propertyName 
     * @param {CompositionAnimation} animation 
     * @returns {HRESULT} 
     */
    StartAnimationWithIAnimationObject(target, propertyName, animation) {
        if(propertyName is String) {
            pin := HSTRING.Create(propertyName)
            propertyName := pin.Value
        }
        propertyName := propertyName is Win32Handle ? NumGet(propertyName, "ptr") : propertyName

        result := ComCall(6, this, "ptr", target, "ptr", propertyName, "ptr", animation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IAnimationObject} target 
     * @param {ICompositionAnimationBase} animation 
     * @returns {HRESULT} 
     */
    StartAnimationGroupWithIAnimationObject(target, animation) {
        result := ComCall(7, this, "ptr", target, "ptr", animation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
