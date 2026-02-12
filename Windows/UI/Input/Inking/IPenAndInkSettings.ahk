#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IPenAndInkSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPenAndInkSettings
     * @type {Guid}
     */
    static IID => Guid("{bc2ceb8f-0066-44a8-bb7a-b839b3deb8f5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsHandwritingDirectlyIntoTextFieldEnabled", "get_PenHandedness", "get_HandwritingLineHeight", "get_FontFamilyName", "get_UserConsentsToHandwritingTelemetryCollection", "get_IsTouchHandwritingEnabled"]

    /**
     * @type {Boolean} 
     */
    IsHandwritingDirectlyIntoTextFieldEnabled {
        get => this.get_IsHandwritingDirectlyIntoTextFieldEnabled()
    }

    /**
     * @type {Integer} 
     */
    PenHandedness {
        get => this.get_PenHandedness()
    }

    /**
     * @type {Integer} 
     */
    HandwritingLineHeight {
        get => this.get_HandwritingLineHeight()
    }

    /**
     * @type {HSTRING} 
     */
    FontFamilyName {
        get => this.get_FontFamilyName()
    }

    /**
     * @type {Boolean} 
     */
    UserConsentsToHandwritingTelemetryCollection {
        get => this.get_UserConsentsToHandwritingTelemetryCollection()
    }

    /**
     * @type {Boolean} 
     */
    IsTouchHandwritingEnabled {
        get => this.get_IsTouchHandwritingEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHandwritingDirectlyIntoTextFieldEnabled() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PenHandedness() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HandwritingLineHeight() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FontFamilyName() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UserConsentsToHandwritingTelemetryCollection() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTouchHandwritingEnabled() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
