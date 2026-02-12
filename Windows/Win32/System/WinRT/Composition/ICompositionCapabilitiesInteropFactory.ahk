#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\UI\Composition\CompositionCapabilities.ahk
#Include ..\IInspectable.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Composition
 * @version v4.0.30319
 */
class ICompositionCapabilitiesInteropFactory extends IInspectable{

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
     * @param {HWND} hwnd_ 
     * @returns {Pointer<CompositionCapabilities>} 
     */
    GetForWindow(hwnd_) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_

        result := ComCall(6, this, "ptr", hwnd_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionCapabilities(result_)
    }
}
