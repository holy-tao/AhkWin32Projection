#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Text
 * @version WindowsRuntime 1.4
 */
class IUnicodeCharactersStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUnicodeCharactersStatics
     * @type {Guid}
     */
    static IID => Guid("{97909e87-9291-4f91-b6c8-b6e359d7a7fb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCodepointFromSurrogatePair", "GetSurrogatePairFromCodepoint", "IsHighSurrogate", "IsLowSurrogate", "IsSupplementary", "IsNoncharacter", "IsWhitespace", "IsAlphabetic", "IsCased", "IsUppercase", "IsLowercase", "IsIdStart", "IsIdContinue", "IsGraphemeBase", "IsGraphemeExtend", "GetNumericType", "GetGeneralCategory"]

    /**
     * 
     * @param {Integer} highSurrogate 
     * @param {Integer} lowSurrogate 
     * @returns {Integer} 
     */
    GetCodepointFromSurrogatePair(highSurrogate, lowSurrogate) {
        result := ComCall(6, this, "uint", highSurrogate, "uint", lowSurrogate, "uint*", &codepoint := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return codepoint
    }

    /**
     * 
     * @param {Integer} codepoint 
     * @param {Pointer<Char>} highSurrogate 
     * @param {Pointer<Char>} lowSurrogate 
     * @returns {HRESULT} 
     */
    GetSurrogatePairFromCodepoint(codepoint, highSurrogate, lowSurrogate) {
        result := ComCall(7, this, "uint", codepoint, "ptr", highSurrogate, "ptr", lowSurrogate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} codepoint 
     * @returns {Boolean} 
     */
    IsHighSurrogate(codepoint) {
        result := ComCall(8, this, "uint", codepoint, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} codepoint 
     * @returns {Boolean} 
     */
    IsLowSurrogate(codepoint) {
        result := ComCall(9, this, "uint", codepoint, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} codepoint 
     * @returns {Boolean} 
     */
    IsSupplementary(codepoint) {
        result := ComCall(10, this, "uint", codepoint, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} codepoint 
     * @returns {Boolean} 
     */
    IsNoncharacter(codepoint) {
        result := ComCall(11, this, "uint", codepoint, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} codepoint 
     * @returns {Boolean} 
     */
    IsWhitespace(codepoint) {
        result := ComCall(12, this, "uint", codepoint, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} codepoint 
     * @returns {Boolean} 
     */
    IsAlphabetic(codepoint) {
        result := ComCall(13, this, "uint", codepoint, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} codepoint 
     * @returns {Boolean} 
     */
    IsCased(codepoint) {
        result := ComCall(14, this, "uint", codepoint, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} codepoint 
     * @returns {Boolean} 
     */
    IsUppercase(codepoint) {
        result := ComCall(15, this, "uint", codepoint, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} codepoint 
     * @returns {Boolean} 
     */
    IsLowercase(codepoint) {
        result := ComCall(16, this, "uint", codepoint, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} codepoint 
     * @returns {Boolean} 
     */
    IsIdStart(codepoint) {
        result := ComCall(17, this, "uint", codepoint, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} codepoint 
     * @returns {Boolean} 
     */
    IsIdContinue(codepoint) {
        result := ComCall(18, this, "uint", codepoint, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} codepoint 
     * @returns {Boolean} 
     */
    IsGraphemeBase(codepoint) {
        result := ComCall(19, this, "uint", codepoint, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} codepoint 
     * @returns {Boolean} 
     */
    IsGraphemeExtend(codepoint) {
        result := ComCall(20, this, "uint", codepoint, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} codepoint 
     * @returns {Integer} 
     */
    GetNumericType(codepoint) {
        result := ComCall(21, this, "uint", codepoint, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} codepoint 
     * @returns {Integer} 
     */
    GetGeneralCategory(codepoint) {
        result := ComCall(22, this, "uint", codepoint, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
