#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Hosting
 * @version WindowsRuntime 1.4
 */
class IXamlUIPresenterStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXamlUIPresenterStatics
     * @type {Guid}
     */
    static IID => Guid("{71eaeac8-45e1-4192-85aa-3a422edd23cf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CompleteTimelinesAutomatically", "put_CompleteTimelinesAutomatically", "SetHost", "NotifyWindowSizeChanged"]

    /**
     * @type {Boolean} 
     */
    CompleteTimelinesAutomatically {
        get => this.get_CompleteTimelinesAutomatically()
        set => this.put_CompleteTimelinesAutomatically(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CompleteTimelinesAutomatically() {
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
    put_CompleteTimelinesAutomatically(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IXamlUIPresenterHost} host 
     * @returns {HRESULT} 
     */
    SetHost(host) {
        result := ComCall(8, this, "ptr", host, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NotifyWindowSizeChanged() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
