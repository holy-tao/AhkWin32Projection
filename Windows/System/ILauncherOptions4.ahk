#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class ILauncherOptions4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILauncherOptions4
     * @type {Guid}
     */
    static IID => Guid("{ef6fd10e-e6fb-4814-a44e-57e8b9d9a01b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LimitPickerToCurrentAppAndAppUriHandlers", "put_LimitPickerToCurrentAppAndAppUriHandlers"]

    /**
     * @type {Boolean} 
     */
    LimitPickerToCurrentAppAndAppUriHandlers {
        get => this.get_LimitPickerToCurrentAppAndAppUriHandlers()
        set => this.put_LimitPickerToCurrentAppAndAppUriHandlers(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_LimitPickerToCurrentAppAndAppUriHandlers() {
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
    put_LimitPickerToCurrentAppAndAppUriHandlers(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
