#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.Input.Preview
 * @version WindowsRuntime 1.4
 */
class IGameControllerProviderInfoStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameControllerProviderInfoStatics
     * @type {Guid}
     */
    static IID => Guid("{0be1e6c5-d9bd-44ee-8362-488b2e464bfb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetParentProviderId", "GetProviderId"]

    /**
     * 
     * @param {IGameControllerProvider} provider 
     * @returns {HSTRING} 
     */
    GetParentProviderId(provider) {
        value := HSTRING()
        result := ComCall(6, this, "ptr", provider, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {IGameControllerProvider} provider 
     * @returns {HSTRING} 
     */
    GetProviderId(provider) {
        value := HSTRING()
        result := ComCall(7, this, "ptr", provider, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
