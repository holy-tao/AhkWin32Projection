#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IUIElementOverrides9 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIElementOverrides9
     * @type {Guid}
     */
    static IID => Guid("{9a6e5973-6d63-54f2-90fa-62813b20b7b9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PopulatePropertyInfoOverride"]

    /**
     * 
     * @param {HSTRING} propertyName 
     * @param {AnimationPropertyInfo} animationPropertyInfo_ 
     * @returns {HRESULT} 
     */
    PopulatePropertyInfoOverride(propertyName, animationPropertyInfo_) {
        if(propertyName is String) {
            pin := HSTRING.Create(propertyName)
            propertyName := pin.Value
        }
        propertyName := propertyName is Win32Handle ? NumGet(propertyName, "ptr") : propertyName

        result := ComCall(6, this, "ptr", propertyName, "ptr", animationPropertyInfo_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
