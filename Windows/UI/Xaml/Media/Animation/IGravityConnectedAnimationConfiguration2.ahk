#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class IGravityConnectedAnimationConfiguration2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGravityConnectedAnimationConfiguration2
     * @type {Guid}
     */
    static IID => Guid("{62333add-aed4-5fed-95ff-d128acce8be4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsShadowEnabled", "put_IsShadowEnabled"]

    /**
     * @type {Boolean} 
     */
    IsShadowEnabled {
        get => this.get_IsShadowEnabled()
        set => this.put_IsShadowEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsShadowEnabled() {
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
    put_IsShadowEnabled(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
