#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IFrame5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFrame5
     * @type {Guid}
     */
    static IID => Guid("{453fb92e-82b5-5f93-92ab-15341806c9da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsNavigationStackEnabled", "put_IsNavigationStackEnabled", "NavigateToType"]

    /**
     * @type {Boolean} 
     */
    IsNavigationStackEnabled {
        get => this.get_IsNavigationStackEnabled()
        set => this.put_IsNavigationStackEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsNavigationStackEnabled() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsNavigationStackEnabled(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypeName} sourcePageType 
     * @param {IInspectable} parameter 
     * @param {FrameNavigationOptions} navigationOptions 
     * @returns {Boolean} 
     */
    NavigateToType(sourcePageType, parameter, navigationOptions) {
        result := ComCall(8, this, "ptr", sourcePageType, "ptr", parameter, "ptr", navigationOptions, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
