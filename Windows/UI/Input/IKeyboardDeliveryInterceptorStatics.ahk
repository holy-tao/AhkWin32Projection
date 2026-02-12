#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\KeyboardDeliveryInterceptor.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class IKeyboardDeliveryInterceptorStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKeyboardDeliveryInterceptorStatics
     * @type {Guid}
     */
    static IID => Guid("{f9f63ba2-ceba-4755-8a7e-14c0ffecd239}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForCurrentView"]

    /**
     * 
     * @returns {KeyboardDeliveryInterceptor} 
     */
    GetForCurrentView() {
        result := ComCall(6, this, "ptr*", &keyboardDeliverySettings := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return KeyboardDeliveryInterceptor(keyboardDeliverySettings)
    }
}
