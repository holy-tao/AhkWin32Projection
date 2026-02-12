#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialLocatorPositionalTrackingDeactivatingEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialLocatorPositionalTrackingDeactivatingEventArgs
     * @type {Guid}
     */
    static IID => Guid("{b8a84063-e3f4-368b-9061-9ea9d1d6cc16}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Canceled", "put_Canceled"]

    /**
     * @type {Boolean} 
     */
    Canceled {
        get => this.get_Canceled()
        set => this.put_Canceled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Canceled() {
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
    put_Canceled(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
