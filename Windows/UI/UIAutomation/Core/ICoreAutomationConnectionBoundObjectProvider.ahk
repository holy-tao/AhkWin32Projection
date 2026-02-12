#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes the properties of a connection-bound object in a remote operation for a UI Automation provider.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.icoreautomationconnectionboundobjectprovider
 * @namespace Windows.UI.UIAutomation.Core
 * @version WindowsRuntime 1.4
 */
class ICoreAutomationConnectionBoundObjectProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreAutomationConnectionBoundObjectProvider
     * @type {Guid}
     */
    static IID => Guid("{0620bb64-9616-5593-be3a-eb8e6daeb3fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsComThreadingRequired"]

    /**
     * Gets whether a COM threading model is required by the [ICoreAutomationConnectionBoundObjectProvider](icoreautomationconnectionboundobjectprovider.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.icoreautomationconnectionboundobjectprovider.iscomthreadingrequired
     * @type {Boolean} 
     */
    IsComThreadingRequired {
        get => this.get_IsComThreadingRequired()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsComThreadingRequired() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
