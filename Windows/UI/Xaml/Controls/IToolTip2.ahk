#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IToolTip2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IToolTip2
     * @type {Guid}
     */
    static IID => Guid("{2b1ade26-299a-5d54-800b-3bea123b4c20}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PlacementRect", "put_PlacementRect"]

    /**
     * @type {IReference<RECT>} 
     */
    PlacementRect {
        get => this.get_PlacementRect()
        set => this.put_PlacementRect(value)
    }

    /**
     * 
     * @returns {IReference<RECT>} 
     */
    get_PlacementRect() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetRECT(), value)
    }

    /**
     * 
     * @param {IReference<RECT>} value 
     * @returns {HRESULT} 
     */
    put_PlacementRect(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
