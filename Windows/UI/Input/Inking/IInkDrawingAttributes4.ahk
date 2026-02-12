#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkDrawingAttributes4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkDrawingAttributes4
     * @type {Guid}
     */
    static IID => Guid("{ef65dc25-9f19-456d-91a3-bc3a3d91c5fb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IgnoreTilt", "put_IgnoreTilt"]

    /**
     * @type {Boolean} 
     */
    IgnoreTilt {
        get => this.get_IgnoreTilt()
        set => this.put_IgnoreTilt(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IgnoreTilt() {
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
    put_IgnoreTilt(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
