#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class IAppWindowChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppWindowChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{1de1f3be-a655-55ad-b2b6-eb240f880356}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DidAvailableWindowPresentationsChange", "get_DidDisplayRegionsChange", "get_DidFrameChange", "get_DidSizeChange", "get_DidTitleBarChange", "get_DidVisibilityChange", "get_DidWindowingEnvironmentChange", "get_DidWindowPresentationChange"]

    /**
     * @type {Boolean} 
     */
    DidAvailableWindowPresentationsChange {
        get => this.get_DidAvailableWindowPresentationsChange()
    }

    /**
     * @type {Boolean} 
     */
    DidDisplayRegionsChange {
        get => this.get_DidDisplayRegionsChange()
    }

    /**
     * @type {Boolean} 
     */
    DidFrameChange {
        get => this.get_DidFrameChange()
    }

    /**
     * @type {Boolean} 
     */
    DidSizeChange {
        get => this.get_DidSizeChange()
    }

    /**
     * @type {Boolean} 
     */
    DidTitleBarChange {
        get => this.get_DidTitleBarChange()
    }

    /**
     * @type {Boolean} 
     */
    DidVisibilityChange {
        get => this.get_DidVisibilityChange()
    }

    /**
     * @type {Boolean} 
     */
    DidWindowingEnvironmentChange {
        get => this.get_DidWindowingEnvironmentChange()
    }

    /**
     * @type {Boolean} 
     */
    DidWindowPresentationChange {
        get => this.get_DidWindowPresentationChange()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DidAvailableWindowPresentationsChange() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DidDisplayRegionsChange() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DidFrameChange() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DidSizeChange() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DidTitleBarChange() {
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
    get_DidVisibilityChange() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DidWindowingEnvironmentChange() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DidWindowPresentationChange() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
