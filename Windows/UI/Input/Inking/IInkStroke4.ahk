#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkStroke4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkStroke4
     * @type {Guid}
     */
    static IID => Guid("{cd5b62e5-b6e9-5b91-a577-1921d2348690}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PointerId"]

    /**
     * @type {Integer} 
     */
    PointerId {
        get => this.get_PointerId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PointerId() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
