#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\Foundation\RECT.ahk
#Include ..\..\..\..\Foundation\Collections\IVector.ahk
#Include .\AutomationPeer.ahk
#Include ..\..\..\..\Win32\Foundation\POINT.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class IAutomationPeerOverrides extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomationPeerOverrides
     * @type {Guid}
     */
    static IID => Guid("{bea93e67-dbee-4f7b-af0d-a79aae5333bf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPatternCore", "GetAcceleratorKeyCore", "GetAccessKeyCore", "GetAutomationControlTypeCore", "GetAutomationIdCore", "GetBoundingRectangleCore", "GetChildrenCore", "GetClassNameCore", "GetClickablePointCore", "GetHelpTextCore", "GetItemStatusCore", "GetItemTypeCore", "GetLabeledByCore", "GetLocalizedControlTypeCore", "GetNameCore", "GetOrientationCore", "HasKeyboardFocusCore", "IsContentElementCore", "IsControlElementCore", "IsEnabledCore", "IsKeyboardFocusableCore", "IsOffscreenCore", "IsPasswordCore", "IsRequiredForFormCore", "SetFocusCore", "GetPeerFromPointCore", "GetLiveSettingCore"]

    /**
     * 
     * @param {Integer} patternInterface_ 
     * @returns {IInspectable} 
     */
    GetPatternCore(patternInterface_) {
        result := ComCall(6, this, "int", patternInterface_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetAcceleratorKeyCore() {
        result_ := HSTRING()
        result := ComCall(7, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetAccessKeyCore() {
        result_ := HSTRING()
        result := ComCall(8, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetAutomationControlTypeCore() {
        result := ComCall(9, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetAutomationIdCore() {
        result_ := HSTRING()
        result := ComCall(10, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {RECT} 
     */
    GetBoundingRectangleCore() {
        result_ := RECT()
        result := ComCall(11, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {IVector<AutomationPeer>} 
     */
    GetChildrenCore() {
        result := ComCall(12, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(AutomationPeer, result_)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetClassNameCore() {
        result_ := HSTRING()
        result := ComCall(13, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {POINT} 
     */
    GetClickablePointCore() {
        result_ := POINT()
        result := ComCall(14, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetHelpTextCore() {
        result_ := HSTRING()
        result := ComCall(15, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetItemStatusCore() {
        result_ := HSTRING()
        result := ComCall(16, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetItemTypeCore() {
        result_ := HSTRING()
        result := ComCall(17, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {AutomationPeer} 
     */
    GetLabeledByCore() {
        result := ComCall(18, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationPeer(result_)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetLocalizedControlTypeCore() {
        result_ := HSTRING()
        result := ComCall(19, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetNameCore() {
        result_ := HSTRING()
        result := ComCall(20, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetOrientationCore() {
        result := ComCall(21, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Boolean} 
     */
    HasKeyboardFocusCore() {
        result := ComCall(22, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsContentElementCore() {
        result := ComCall(23, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsControlElementCore() {
        result := ComCall(24, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsEnabledCore() {
        result := ComCall(25, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsKeyboardFocusableCore() {
        result := ComCall(26, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsOffscreenCore() {
        result := ComCall(27, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsPasswordCore() {
        result := ComCall(28, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsRequiredForFormCore() {
        result := ComCall(29, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetFocusCore() {
        result := ComCall(30, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {POINT} point_ 
     * @returns {AutomationPeer} 
     */
    GetPeerFromPointCore(point_) {
        result := ComCall(31, this, "ptr", point_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationPeer(result_)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLiveSettingCore() {
        result := ComCall(32, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
