#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\IInspectable.ahk
#Include ..\..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Composition
 */
class ICompositionCapabilitiesInteropFactory extends IInspectable {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionCapabilitiesInteropFactory
     * @type {Guid}
     */
    static IID => Guid("{2c9db356-e70d-4642-8298-bc4aa5b4865c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForWindow"]

    /**
     * 
     * @param {HWND} _hwnd 
     * @returns {Pointer} 
     */
    GetForWindow(_hwnd) {
        _hwnd := _hwnd is Win32Handle ? NumGet(_hwnd, "ptr") : _hwnd

        result := ComCall(6, this, "ptr", _hwnd, "ptr*", &result := 0, "HRESULT")
        return result
    }
}
