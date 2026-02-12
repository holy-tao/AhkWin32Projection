#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class IVideoEncodingProperties2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVideoEncodingProperties2
     * @type {Guid}
     */
    static IID => Guid("{f743a1ef-d465-4290-a94b-ef0f1528f8e3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFormatUserData", "GetFormatUserData", "put_ProfileId", "get_ProfileId"]

    /**
     * @type {Integer} 
     */
    ProfileId {
        get => this.get_ProfileId()
        set => this.put_ProfileId(value)
    }

    /**
     * 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     */
    SetFormatUserData(value_length, value) {
        valueMarshal := value is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "uint", value_length, valueMarshal, value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} value 
     * @returns {HRESULT} 
     */
    GetFormatUserData(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ProfileId(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProfileId() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
