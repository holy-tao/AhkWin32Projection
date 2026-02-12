#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\WebUIView.ahk
#Include ..\..\ApplicationModel\Activation\IActivatedEventArgs.ahk
#Include ..\..\Foundation\Deferral.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class INewWebUIViewCreatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INewWebUIViewCreatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{e8e1b216-be2b-4c9e-85e7-083143ec4be7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_WebUIView", "get_ActivatedEventArgs", "get_HasPendingNavigate", "GetDeferral"]

    /**
     * @type {WebUIView} 
     */
    WebUIView {
        get => this.get_WebUIView()
    }

    /**
     * @type {IActivatedEventArgs} 
     */
    ActivatedEventArgs {
        get => this.get_ActivatedEventArgs()
    }

    /**
     * @type {Boolean} 
     */
    HasPendingNavigate {
        get => this.get_HasPendingNavigate()
    }

    /**
     * 
     * @returns {WebUIView} 
     */
    get_WebUIView() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebUIView(value)
    }

    /**
     * 
     * @returns {IActivatedEventArgs} 
     */
    get_ActivatedEventArgs() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IActivatedEventArgs(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasPendingNavigate() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Deferral} 
     */
    GetDeferral() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Deferral(result_)
    }
}
