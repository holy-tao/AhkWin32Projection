#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Contains methods for launcher view options.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.ilauncherviewoptions
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class ILauncherViewOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILauncherViewOptions
     * @type {Guid}
     */
    static IID => Guid("{8a9b29f1-7ca7-49de-9bd3-3c5b7184f616}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DesiredRemainingView", "put_DesiredRemainingView"]

    /**
     * Gets the desired remaining view.
     * @see https://learn.microsoft.com/uwp/api/windows.system.ilauncherviewoptions.desiredremainingview
     * @type {Integer} 
     */
    DesiredRemainingView {
        get => this.get_DesiredRemainingView()
        set => this.put_DesiredRemainingView(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DesiredRemainingView() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DesiredRemainingView(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
