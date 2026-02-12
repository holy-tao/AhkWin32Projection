#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IWebViewControl.ahk
#Include ..\..\Foundation\Deferral.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.UI
 * @version WindowsRuntime 1.4
 */
class IWebViewControlNewWindowRequestedEventArgs2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebViewControlNewWindowRequestedEventArgs2
     * @type {Guid}
     */
    static IID => Guid("{b53c5ca6-2aae-4bfc-92b9-c30e92b48098}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NewWindow", "put_NewWindow", "GetDeferral"]

    /**
     * @type {IWebViewControl} 
     */
    NewWindow {
        get => this.get_NewWindow()
        set => this.put_NewWindow(value)
    }

    /**
     * 
     * @returns {IWebViewControl} 
     */
    get_NewWindow() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWebViewControl(value)
    }

    /**
     * 
     * @param {IWebViewControl} value 
     * @returns {HRESULT} 
     */
    put_NewWindow(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Deferral} 
     */
    GetDeferral() {
        result := ComCall(8, this, "ptr*", &deferral_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Deferral(deferral_)
    }
}
