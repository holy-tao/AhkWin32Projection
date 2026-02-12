#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\SIZE.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class IApplicationViewStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplicationViewStatics3
     * @type {Guid}
     */
    static IID => Guid("{a28d7594-8c41-4e13-9719-5164796fe4c7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PreferredLaunchWindowingMode", "put_PreferredLaunchWindowingMode", "get_PreferredLaunchViewSize", "put_PreferredLaunchViewSize"]

    /**
     * @type {Integer} 
     */
    PreferredLaunchWindowingMode {
        get => this.get_PreferredLaunchWindowingMode()
        set => this.put_PreferredLaunchWindowingMode(value)
    }

    /**
     * @type {SIZE} 
     */
    PreferredLaunchViewSize {
        get => this.get_PreferredLaunchViewSize()
        set => this.put_PreferredLaunchViewSize(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PreferredLaunchWindowingMode() {
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
    put_PreferredLaunchWindowingMode(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_PreferredLaunchViewSize() {
        value := SIZE()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {SIZE} value 
     * @returns {HRESULT} 
     */
    put_PreferredLaunchViewSize(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
