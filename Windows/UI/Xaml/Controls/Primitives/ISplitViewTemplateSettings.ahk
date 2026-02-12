#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\GridLength.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ISplitViewTemplateSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISplitViewTemplateSettings
     * @type {Guid}
     */
    static IID => Guid("{c16ab5a7-4996-4443-b199-6b6b89124eab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OpenPaneLength", "get_NegativeOpenPaneLength", "get_OpenPaneLengthMinusCompactLength", "get_NegativeOpenPaneLengthMinusCompactLength", "get_OpenPaneGridLength", "get_CompactPaneGridLength"]

    /**
     * @type {Float} 
     */
    OpenPaneLength {
        get => this.get_OpenPaneLength()
    }

    /**
     * @type {Float} 
     */
    NegativeOpenPaneLength {
        get => this.get_NegativeOpenPaneLength()
    }

    /**
     * @type {Float} 
     */
    OpenPaneLengthMinusCompactLength {
        get => this.get_OpenPaneLengthMinusCompactLength()
    }

    /**
     * @type {Float} 
     */
    NegativeOpenPaneLengthMinusCompactLength {
        get => this.get_NegativeOpenPaneLengthMinusCompactLength()
    }

    /**
     * @type {GridLength} 
     */
    OpenPaneGridLength {
        get => this.get_OpenPaneGridLength()
    }

    /**
     * @type {GridLength} 
     */
    CompactPaneGridLength {
        get => this.get_CompactPaneGridLength()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OpenPaneLength() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_NegativeOpenPaneLength() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OpenPaneLengthMinusCompactLength() {
        result := ComCall(8, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_NegativeOpenPaneLengthMinusCompactLength() {
        result := ComCall(9, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {GridLength} 
     */
    get_OpenPaneGridLength() {
        value := GridLength()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {GridLength} 
     */
    get_CompactPaneGridLength() {
        value := GridLength()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
