#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IInclinometer2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInclinometer2
     * @type {Guid}
     */
    static IID => Guid("{029f3393-28b2-45f8-bb16-61e86a7fae6e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_ReadingTransform", "get_ReadingTransform", "get_ReadingType"]

    /**
     * @type {Integer} 
     */
    ReadingTransform {
        get => this.get_ReadingTransform()
        set => this.put_ReadingTransform(value)
    }

    /**
     * @type {Integer} 
     */
    ReadingType {
        get => this.get_ReadingType()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReadingTransform(value) {
        result := ComCall(6, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReadingTransform() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReadingType() {
        result := ComCall(8, this, "int*", &type := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return type
    }
}
