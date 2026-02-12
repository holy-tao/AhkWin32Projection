#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.Automation.Core
 * @version WindowsRuntime 1.4
 */
class ICorePerceptionAutomationStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICorePerceptionAutomationStatics
     * @type {Guid}
     */
    static IID => Guid("{0bb04541-4ce2-4923-9a76-8187ecc59112}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetActivationFactoryProvider"]

    /**
     * 
     * @param {IGetActivationFactory} provider 
     * @returns {HRESULT} 
     */
    SetActivationFactoryProvider(provider) {
        result := ComCall(6, this, "ptr", provider, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
