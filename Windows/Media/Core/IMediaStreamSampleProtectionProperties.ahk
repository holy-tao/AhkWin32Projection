#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IMediaStreamSampleProtectionProperties extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaStreamSampleProtectionProperties
     * @type {Guid}
     */
    static IID => Guid("{4eb88292-ecdf-493e-841d-dd4add7caca2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetKeyIdentifier", "GetKeyIdentifier", "SetInitializationVector", "GetInitializationVector", "SetSubSampleMapping", "GetSubSampleMapping"]

    /**
     * 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     */
    SetKeyIdentifier(value_length, value) {
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
    GetKeyIdentifier(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     */
    SetInitializationVector(value_length, value) {
        valueMarshal := value is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, "uint", value_length, valueMarshal, value, "int")
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
    GetInitializationVector(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     */
    SetSubSampleMapping(value_length, value) {
        valueMarshal := value is VarRef ? "char*" : "ptr"

        result := ComCall(10, this, "uint", value_length, valueMarshal, value, "int")
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
    GetSubSampleMapping(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
