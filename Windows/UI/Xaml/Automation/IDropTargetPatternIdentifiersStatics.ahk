#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AutomationProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class IDropTargetPatternIdentifiersStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDropTargetPatternIdentifiersStatics
     * @type {Guid}
     */
    static IID => Guid("{1b693304-89fb-4b0a-9452-ca2c66aaf9f3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DropTargetEffectProperty", "get_DropTargetEffectsProperty"]

    /**
     * @type {AutomationProperty} 
     */
    DropTargetEffectProperty {
        get => this.get_DropTargetEffectProperty()
    }

    /**
     * @type {AutomationProperty} 
     */
    DropTargetEffectsProperty {
        get => this.get_DropTargetEffectsProperty()
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_DropTargetEffectProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }

    /**
     * 
     * @returns {AutomationProperty} 
     */
    get_DropTargetEffectsProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationProperty(value)
    }
}
