#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\InputInjector.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Preview.Injection
 * @version WindowsRuntime 1.4
 */
class IInputInjectorStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInputInjectorStatics2
     * @type {Guid}
     */
    static IID => Guid("{a4db38fb-dd8c-414f-95ea-f87ef4c0ae6c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryCreateForAppBroadcastOnly"]

    /**
     * 
     * @returns {InputInjector} 
     */
    TryCreateForAppBroadcastOnly() {
        result := ComCall(6, this, "ptr*", &instance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InputInjector(instance)
    }
}
