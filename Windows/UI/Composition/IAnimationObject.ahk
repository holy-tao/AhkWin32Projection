#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents an object that has properties that can be referenced by an animation.
 * @remarks
 * Implement `IAnimationObject` to let a custom object participate in [ExpressionAnimation](expressionanimation.md)s. It redirects the property on the custom object to the underlying [CompositionObject](compositionobject.md). For more info, see [CompositionAnimation.SetExpressionReferenceParameter](compositionanimation_setexpressionreferenceparameter_171213698.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.ianimationobject
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IAnimationObject extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAnimationObject
     * @type {Guid}
     */
    static IID => Guid("{e7141e0a-04b8-4fc5-a4dc-195392e57807}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PopulatePropertyInfo"]

    /**
     * Defines a property that can be animated.
     * @param {HSTRING} propertyName The property that can be animated.
     * @param {AnimationPropertyInfo} propertyInfo Information about the property to be animated.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.ianimationobject.populatepropertyinfo
     */
    PopulatePropertyInfo(propertyName, propertyInfo) {
        if(propertyName is String) {
            pin := HSTRING.Create(propertyName)
            propertyName := pin.Value
        }
        propertyName := propertyName is Win32Handle ? NumGet(propertyName, "ptr") : propertyName

        result := ComCall(6, this, "ptr", propertyName, "ptr", propertyInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
