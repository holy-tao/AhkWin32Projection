#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\AnimationController.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionObject4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionObject4
     * @type {Guid}
     */
    static IID => Guid("{0bb3784c-346b-4a7c-966b-7310966553d5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryGetAnimationController"]

    /**
     * 
     * @param {HSTRING} propertyName 
     * @returns {AnimationController} 
     */
    TryGetAnimationController(propertyName) {
        if(propertyName is String) {
            pin := HSTRING.Create(propertyName)
            propertyName := pin.Value
        }
        propertyName := propertyName is Win32Handle ? NumGet(propertyName, "ptr") : propertyName

        result := ComCall(6, this, "ptr", propertyName, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AnimationController(result_)
    }
}
