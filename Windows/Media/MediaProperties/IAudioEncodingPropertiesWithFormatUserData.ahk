#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class IAudioEncodingPropertiesWithFormatUserData extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioEncodingPropertiesWithFormatUserData
     * @type {Guid}
     */
    static IID => Guid("{98f10d79-13ea-49ff-be70-2673db69702c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFormatUserData", "GetFormatUserData"]

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
}
