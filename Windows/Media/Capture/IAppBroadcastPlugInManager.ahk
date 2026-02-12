#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\AppBroadcastPlugIn.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IAppBroadcastPlugInManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppBroadcastPlugInManager
     * @type {Guid}
     */
    static IID => Guid("{e550d979-27a1-49a7-bbf4-d7a9e9d07668}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsBroadcastProviderAvailable", "get_PlugInList", "get_DefaultPlugIn", "put_DefaultPlugIn"]

    /**
     * @type {Boolean} 
     */
    IsBroadcastProviderAvailable {
        get => this.get_IsBroadcastProviderAvailable()
    }

    /**
     * @type {IVectorView<AppBroadcastPlugIn>} 
     */
    PlugInList {
        get => this.get_PlugInList()
    }

    /**
     * @type {AppBroadcastPlugIn} 
     */
    DefaultPlugIn {
        get => this.get_DefaultPlugIn()
        set => this.put_DefaultPlugIn(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBroadcastProviderAvailable() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<AppBroadcastPlugIn>} 
     */
    get_PlugInList() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(AppBroadcastPlugIn, value)
    }

    /**
     * 
     * @returns {AppBroadcastPlugIn} 
     */
    get_DefaultPlugIn() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppBroadcastPlugIn(value)
    }

    /**
     * 
     * @param {AppBroadcastPlugIn} value 
     * @returns {HRESULT} 
     */
    put_DefaultPlugIn(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
