#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\Collections\IVector.ahk
#Include .\AutomationPeerAnnotation.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class IAutomationPeerOverrides3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomationPeerOverrides3
     * @type {Guid}
     */
    static IID => Guid("{b6f0c4ad-4d39-49e6-bb91-d924eefd8538}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NavigateCore", "GetElementFromPointCore", "GetFocusedElementCore", "GetAnnotationsCore", "GetPositionInSetCore", "GetSizeOfSetCore", "GetLevelCore"]

    /**
     * 
     * @param {Integer} direction_ 
     * @returns {IInspectable} 
     */
    NavigateCore(direction_) {
        result := ComCall(6, this, "int", direction_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @param {POINT} pointInWindowCoordinates 
     * @returns {IInspectable} 
     */
    GetElementFromPointCore(pointInWindowCoordinates) {
        result := ComCall(7, this, "ptr", pointInWindowCoordinates, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    GetFocusedElementCore() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @returns {IVector<AutomationPeerAnnotation>} 
     */
    GetAnnotationsCore() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(AutomationPeerAnnotation, result_)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPositionInSetCore() {
        result := ComCall(10, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetSizeOfSetCore() {
        result := ComCall(11, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLevelCore() {
        result := ComCall(12, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
