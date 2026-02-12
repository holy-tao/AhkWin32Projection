#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IXamlLightStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXamlLightStatics
     * @type {Guid}
     */
    static IID => Guid("{b5ea9d69-b508-4e9c-bd27-6b044b5f78a0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddTargetElement", "RemoveTargetElement", "AddTargetBrush", "RemoveTargetBrush"]

    /**
     * 
     * @param {HSTRING} lightId 
     * @param {UIElement} element 
     * @returns {HRESULT} 
     */
    AddTargetElement(lightId, element) {
        if(lightId is String) {
            pin := HSTRING.Create(lightId)
            lightId := pin.Value
        }
        lightId := lightId is Win32Handle ? NumGet(lightId, "ptr") : lightId

        result := ComCall(6, this, "ptr", lightId, "ptr", element, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} lightId 
     * @param {UIElement} element 
     * @returns {HRESULT} 
     */
    RemoveTargetElement(lightId, element) {
        if(lightId is String) {
            pin := HSTRING.Create(lightId)
            lightId := pin.Value
        }
        lightId := lightId is Win32Handle ? NumGet(lightId, "ptr") : lightId

        result := ComCall(7, this, "ptr", lightId, "ptr", element, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} lightId 
     * @param {Brush} brush_ 
     * @returns {HRESULT} 
     */
    AddTargetBrush(lightId, brush_) {
        if(lightId is String) {
            pin := HSTRING.Create(lightId)
            lightId := pin.Value
        }
        lightId := lightId is Win32Handle ? NumGet(lightId, "ptr") : lightId

        result := ComCall(8, this, "ptr", lightId, "ptr", brush_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} lightId 
     * @param {Brush} brush_ 
     * @returns {HRESULT} 
     */
    RemoveTargetBrush(lightId, brush_) {
        if(lightId is String) {
            pin := HSTRING.Create(lightId)
            lightId := pin.Value
        }
        lightId := lightId is Win32Handle ? NumGet(lightId, "ptr") : lightId

        result := ComCall(9, this, "ptr", lightId, "ptr", brush_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
