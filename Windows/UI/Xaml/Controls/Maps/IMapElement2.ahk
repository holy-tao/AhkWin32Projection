#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapElement2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapElement2
     * @type {Guid}
     */
    static IID => Guid("{6619f261-fba6-4964-a7ff-f1af63ab9cb0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MapTabIndex", "put_MapTabIndex"]

    /**
     * @type {Integer} 
     */
    MapTabIndex {
        get => this.get_MapTabIndex()
        set => this.put_MapTabIndex(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MapTabIndex() {
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
    put_MapTabIndex(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
