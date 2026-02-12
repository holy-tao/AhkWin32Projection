#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Foundation\Collections\IIterable.ahk
#Include .\AutomationPeer.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class IAutomationPeerOverrides5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomationPeerOverrides5
     * @type {Guid}
     */
    static IID => Guid("{2c847c85-781e-49f7-9fef-b9e14d014707}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsPeripheralCore", "IsDataValidForFormCore", "GetFullDescriptionCore", "GetDescribedByCore", "GetFlowsToCore", "GetFlowsFromCore"]

    /**
     * 
     * @returns {Boolean} 
     */
    IsPeripheralCore() {
        result := ComCall(6, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsDataValidForFormCore() {
        result := ComCall(7, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetFullDescriptionCore() {
        result_ := HSTRING()
        result := ComCall(8, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {IIterable<AutomationPeer>} 
     */
    GetDescribedByCore() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IIterable(AutomationPeer, result_)
    }

    /**
     * 
     * @returns {IIterable<AutomationPeer>} 
     */
    GetFlowsToCore() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IIterable(AutomationPeer, result_)
    }

    /**
     * 
     * @returns {IIterable<AutomationPeer>} 
     */
    GetFlowsFromCore() {
        result := ComCall(11, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IIterable(AutomationPeer, result_)
    }
}
