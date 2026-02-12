#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IAcrylicBrush2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAcrylicBrush2
     * @type {Guid}
     */
    static IID => Guid("{c9645383-b19e-5ac0-86ff-3d90506dbcda}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TintLuminosityOpacity", "put_TintLuminosityOpacity"]

    /**
     * @type {IReference<Float>} 
     */
    TintLuminosityOpacity {
        get => this.get_TintLuminosityOpacity()
        set => this.put_TintLuminosityOpacity(value)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_TintLuminosityOpacity() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDouble(), value)
    }

    /**
     * 
     * @param {IReference<Float>} value 
     * @returns {HRESULT} 
     */
    put_TintLuminosityOpacity(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
