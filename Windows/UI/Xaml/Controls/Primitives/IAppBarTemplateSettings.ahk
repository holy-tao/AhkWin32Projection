#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\Foundation\RECT.ahk
#Include ..\..\Thickness.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class IAppBarTemplateSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBarTemplateSettings
     * @type {Guid}
     */
    static IID => Guid("{bcc2a863-eb35-423c-8389-d7827be3bf67}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ClipRect", "get_CompactVerticalDelta", "get_CompactRootMargin", "get_MinimalVerticalDelta", "get_MinimalRootMargin", "get_HiddenVerticalDelta", "get_HiddenRootMargin"]

    /**
     * @type {RECT} 
     */
    ClipRect {
        get => this.get_ClipRect()
    }

    /**
     * @type {Float} 
     */
    CompactVerticalDelta {
        get => this.get_CompactVerticalDelta()
    }

    /**
     * @type {Thickness} 
     */
    CompactRootMargin {
        get => this.get_CompactRootMargin()
    }

    /**
     * @type {Float} 
     */
    MinimalVerticalDelta {
        get => this.get_MinimalVerticalDelta()
    }

    /**
     * @type {Thickness} 
     */
    MinimalRootMargin {
        get => this.get_MinimalRootMargin()
    }

    /**
     * @type {Float} 
     */
    HiddenVerticalDelta {
        get => this.get_HiddenVerticalDelta()
    }

    /**
     * @type {Thickness} 
     */
    HiddenRootMargin {
        get => this.get_HiddenRootMargin()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_ClipRect() {
        value := RECT()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CompactVerticalDelta() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_CompactRootMargin() {
        value := Thickness()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinimalVerticalDelta() {
        result := ComCall(9, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_MinimalRootMargin() {
        value := Thickness()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HiddenVerticalDelta() {
        result := ComCall(11, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_HiddenRootMargin() {
        value := Thickness()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
