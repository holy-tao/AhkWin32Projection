#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class IKeyFrameAnimation3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKeyFrameAnimation3
     * @type {Guid}
     */
    static IID => Guid("{845bf0b4-d8de-462f-8753-c80d43c6ff5a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DelayBehavior", "put_DelayBehavior"]

    /**
     * @type {Integer} 
     */
    DelayBehavior {
        get => this.get_DelayBehavior()
        set => this.put_DelayBehavior(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DelayBehavior() {
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
    put_DelayBehavior(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
