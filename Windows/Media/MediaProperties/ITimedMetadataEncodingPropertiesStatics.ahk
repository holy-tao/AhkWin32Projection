#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\TimedMetadataEncodingProperties.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class ITimedMetadataEncodingPropertiesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITimedMetadataEncodingPropertiesStatics
     * @type {Guid}
     */
    static IID => Guid("{6629bb67-6e55-5643-89a0-7a7e8d85b52c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePgs", "CreateSrt", "CreateSsa", "CreateVobSub"]

    /**
     * 
     * @returns {TimedMetadataEncodingProperties} 
     */
    CreatePgs() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TimedMetadataEncodingProperties(result_)
    }

    /**
     * 
     * @returns {TimedMetadataEncodingProperties} 
     */
    CreateSrt() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TimedMetadataEncodingProperties(result_)
    }

    /**
     * 
     * @param {Integer} formatUserData_length 
     * @param {Pointer<Integer>} formatUserData 
     * @returns {TimedMetadataEncodingProperties} 
     */
    CreateSsa(formatUserData_length, formatUserData) {
        formatUserDataMarshal := formatUserData is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, "uint", formatUserData_length, formatUserDataMarshal, formatUserData, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TimedMetadataEncodingProperties(result_)
    }

    /**
     * 
     * @param {Integer} formatUserData_length 
     * @param {Pointer<Integer>} formatUserData 
     * @returns {TimedMetadataEncodingProperties} 
     */
    CreateVobSub(formatUserData_length, formatUserData) {
        formatUserDataMarshal := formatUserData is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, "uint", formatUserData_length, formatUserDataMarshal, formatUserData, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TimedMetadataEncodingProperties(result_)
    }
}
