#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Media\Animation\ConnectedAnimation.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IListViewBase6 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IListViewBase6
     * @type {Guid}
     */
    static IID => Guid("{f8a42637-965b-483b-94e5-e5c9fef0e352}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryStartConnectedAnimationAsync", "PrepareConnectedAnimation"]

    /**
     * 
     * @param {ConnectedAnimation} animation 
     * @param {IInspectable} item 
     * @param {HSTRING} elementName 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryStartConnectedAnimationAsync(animation, item, elementName) {
        if(elementName is String) {
            pin := HSTRING.Create(elementName)
            elementName := pin.Value
        }
        elementName := elementName is Win32Handle ? NumGet(elementName, "ptr") : elementName

        result := ComCall(6, this, "ptr", animation, "ptr", item, "ptr", elementName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {HSTRING} key 
     * @param {IInspectable} item 
     * @param {HSTRING} elementName 
     * @returns {ConnectedAnimation} 
     */
    PrepareConnectedAnimation(key, item, elementName) {
        if(key is String) {
            pin := HSTRING.Create(key)
            key := pin.Value
        }
        key := key is Win32Handle ? NumGet(key, "ptr") : key
        if(elementName is String) {
            pin := HSTRING.Create(elementName)
            elementName := pin.Value
        }
        elementName := elementName is Win32Handle ? NumGet(elementName, "ptr") : elementName

        result := ComCall(7, this, "ptr", key, "ptr", item, "ptr", elementName, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ConnectedAnimation(result_)
    }
}
