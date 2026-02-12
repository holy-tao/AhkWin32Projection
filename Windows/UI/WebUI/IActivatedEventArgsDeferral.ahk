#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ActivatedOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Manages delayed activation for an app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.iactivatedeventargsdeferral
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class IActivatedEventArgsDeferral extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActivatedEventArgsDeferral
     * @type {Guid}
     */
    static IID => Guid("{ca6d5f74-63c2-44a6-b97b-d9a03c20bc9b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ActivatedOperation"]

    /**
     * Gets the app activation operation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.iactivatedeventargsdeferral.activatedoperation
     * @type {ActivatedOperation} 
     */
    ActivatedOperation {
        get => this.get_ActivatedOperation()
    }

    /**
     * 
     * @returns {ActivatedOperation} 
     */
    get_ActivatedOperation() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ActivatedOperation(value)
    }
}
