#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICorePerceptionAutomationStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides automation services for the Perception API.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.perception.automation.core.coreperceptionautomation
 * @namespace Windows.Perception.Automation.Core
 * @version WindowsRuntime 1.4
 */
class CorePerceptionAutomation extends IInspectable {
;@region Static Methods
    /**
     * Overrides the Windows Perception API and provides a custom class provider to implement the API.
     * @param {IGetActivationFactory} provider The automation provider.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.automation.core.coreperceptionautomation.setactivationfactoryprovider
     */
    static SetActivationFactoryProvider(provider) {
        if (!CorePerceptionAutomation.HasProp("__ICorePerceptionAutomationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Automation.Core.CorePerceptionAutomation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICorePerceptionAutomationStatics.IID)
            CorePerceptionAutomation.__ICorePerceptionAutomationStatics := ICorePerceptionAutomationStatics(factoryPtr)
        }

        return CorePerceptionAutomation.__ICorePerceptionAutomationStatics.SetActivationFactoryProvider(provider)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
