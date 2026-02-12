#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Compositor.ahk
#Include ..\Core\CoreDispatcher.ahk
#Include .\CompositionPropertySet.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionObject extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionObject
     * @type {Guid}
     */
    static IID => Guid("{bcb4ad45-7609-4550-934f-16002a68fded}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Compositor", "get_Dispatcher", "get_Properties", "StartAnimation", "StopAnimation"]

    /**
     * @type {Compositor} 
     */
    Compositor {
        get => this.get_Compositor()
    }

    /**
     * @type {CoreDispatcher} 
     */
    Dispatcher {
        get => this.get_Dispatcher()
    }

    /**
     * @type {CompositionPropertySet} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * 
     * @returns {Compositor} 
     */
    get_Compositor() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Compositor(value)
    }

    /**
     * 
     * @returns {CoreDispatcher} 
     */
    get_Dispatcher() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CoreDispatcher(value)
    }

    /**
     * 
     * @returns {CompositionPropertySet} 
     */
    get_Properties() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionPropertySet(value)
    }

    /**
     * 
     * @param {HSTRING} propertyName 
     * @param {CompositionAnimation} animation 
     * @returns {HRESULT} 
     */
    StartAnimation(propertyName, animation) {
        if(propertyName is String) {
            pin := HSTRING.Create(propertyName)
            propertyName := pin.Value
        }
        propertyName := propertyName is Win32Handle ? NumGet(propertyName, "ptr") : propertyName

        result := ComCall(9, this, "ptr", propertyName, "ptr", animation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} propertyName 
     * @returns {HRESULT} 
     */
    StopAnimation(propertyName) {
        if(propertyName is String) {
            pin := HSTRING.Create(propertyName)
            propertyName := pin.Value
        }
        propertyName := propertyName is Win32Handle ? NumGet(propertyName, "ptr") : propertyName

        result := ComCall(10, this, "ptr", propertyName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
