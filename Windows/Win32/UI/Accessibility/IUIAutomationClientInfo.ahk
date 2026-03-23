#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationClientInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationClientInfo
     * @type {Guid}
     */
    static IID => Guid("{b2e8a3f1-4c5d-4e7a-8f6b-3d2e1c9a0b8f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProcessId", "get_ProcessName"]

    /**
     * @type {Integer} 
     */
    ProcessId {
        get => this.get_ProcessId()
    }

    /**
     * @type {BSTR} 
     */
    ProcessName {
        get => this.get_ProcessName()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProcessId() {
        result := ComCall(3, this, "uint*", &processId := 0, "HRESULT")
        return processId
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ProcessName() {
        processName := BSTR()
        result := ComCall(4, this, "ptr", processName, "HRESULT")
        return processName
    }
}
