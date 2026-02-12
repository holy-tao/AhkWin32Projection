#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkPoint2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkPoint2
     * @type {Guid}
     */
    static IID => Guid("{fba9c3f7-ae56-4d5c-bd2f-0ac45f5e4af9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TiltX", "get_TiltY", "get_Timestamp"]

    /**
     * @type {Float} 
     */
    TiltX {
        get => this.get_TiltX()
    }

    /**
     * @type {Float} 
     */
    TiltY {
        get => this.get_TiltY()
    }

    /**
     * @type {Integer} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TiltX() {
        result := ComCall(6, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TiltY() {
        result := ComCall(7, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Timestamp() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
