#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IppAttributeValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class IIppAttributeValueStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIppAttributeValueStatics
     * @type {Guid}
     */
    static IID => Guid("{10d43942-dd94-5998-b235-afafb6fa7935}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateUnsupported", "CreateUnknown", "CreateNoValue", "CreateInteger", "CreateIntegerArray", "CreateBoolean", "CreateBooleanArray", "CreateEnum", "CreateEnumArray", "CreateOctetString", "CreateOctetStringArray", "CreateDateTime", "CreateDateTimeArray", "CreateResolution", "CreateResolutionArray", "CreateRangeOfInteger", "CreateRangeOfIntegerArray", "CreateCollection", "CreateCollectionArray", "CreateTextWithLanguage", "CreateTextWithLanguageArray", "CreateNameWithLanguage", "CreateNameWithLanguageArray", "CreateTextWithoutLanguage", "CreateTextWithoutLanguageArray", "CreateNameWithoutLanguage", "CreateNameWithoutLanguageArray", "CreateKeyword", "CreateKeywordArray", "CreateUri", "CreateUriArray", "CreateUriSchema", "CreateUriSchemaArray", "CreateCharset", "CreateCharsetArray", "CreateNaturalLanguage", "CreateNaturalLanguageArray", "CreateMimeMedia", "CreateMimeMediaArray"]

    /**
     * 
     * @returns {IppAttributeValue} 
     */
    CreateUnsupported() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @returns {IppAttributeValue} 
     */
    CreateUnknown() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @returns {IppAttributeValue} 
     */
    CreateNoValue() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {IppAttributeValue} 
     */
    CreateInteger(value) {
        result := ComCall(9, this, "int", value, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {IIterable<Integer>} values 
     * @returns {IppAttributeValue} 
     */
    CreateIntegerArray(values) {
        result := ComCall(10, this, "ptr", values, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {IppAttributeValue} 
     */
    CreateBoolean(value) {
        result := ComCall(11, this, "int", value, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {IIterable<Boolean>} values 
     * @returns {IppAttributeValue} 
     */
    CreateBooleanArray(values) {
        result := ComCall(12, this, "ptr", values, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {IppAttributeValue} 
     */
    CreateEnum(value) {
        result := ComCall(13, this, "int", value, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {IIterable<Integer>} values 
     * @returns {IppAttributeValue} 
     */
    CreateEnumArray(values) {
        result := ComCall(14, this, "ptr", values, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {IppAttributeValue} 
     */
    CreateOctetString(value) {
        result := ComCall(15, this, "ptr", value, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {IIterable<IBuffer>} values 
     * @returns {IppAttributeValue} 
     */
    CreateOctetStringArray(values) {
        result := ComCall(16, this, "ptr", values, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {IppAttributeValue} 
     */
    CreateDateTime(value) {
        result := ComCall(17, this, "ptr", value, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {IIterable<DateTime>} values 
     * @returns {IppAttributeValue} 
     */
    CreateDateTimeArray(values) {
        result := ComCall(18, this, "ptr", values, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {IppResolution} value 
     * @returns {IppAttributeValue} 
     */
    CreateResolution(value) {
        result := ComCall(19, this, "ptr", value, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {IIterable<IppResolution>} values 
     * @returns {IppAttributeValue} 
     */
    CreateResolutionArray(values) {
        result := ComCall(20, this, "ptr", values, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {IppIntegerRange} value 
     * @returns {IppAttributeValue} 
     */
    CreateRangeOfInteger(value) {
        result := ComCall(21, this, "ptr", value, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {IIterable<IppIntegerRange>} values 
     * @returns {IppAttributeValue} 
     */
    CreateRangeOfIntegerArray(values) {
        result := ComCall(22, this, "ptr", values, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {IIterable<IKeyValuePair<HSTRING, IppAttributeValue>>} memberAttributes 
     * @returns {IppAttributeValue} 
     */
    CreateCollection(memberAttributes) {
        result := ComCall(23, this, "ptr", memberAttributes, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {IIterable<IIterable<IKeyValuePair<HSTRING, IppAttributeValue>>>} memberAttributesArray 
     * @returns {IppAttributeValue} 
     */
    CreateCollectionArray(memberAttributesArray) {
        result := ComCall(24, this, "ptr", memberAttributesArray, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {IppTextWithLanguage} value 
     * @returns {IppAttributeValue} 
     */
    CreateTextWithLanguage(value) {
        result := ComCall(25, this, "ptr", value, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {IIterable<IppTextWithLanguage>} values 
     * @returns {IppAttributeValue} 
     */
    CreateTextWithLanguageArray(values) {
        result := ComCall(26, this, "ptr", values, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {IppTextWithLanguage} value 
     * @returns {IppAttributeValue} 
     */
    CreateNameWithLanguage(value) {
        result := ComCall(27, this, "ptr", value, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {IIterable<IppTextWithLanguage>} values 
     * @returns {IppAttributeValue} 
     */
    CreateNameWithLanguageArray(values) {
        result := ComCall(28, this, "ptr", values, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {IppAttributeValue} 
     */
    CreateTextWithoutLanguage(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(29, this, "ptr", value, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} values 
     * @returns {IppAttributeValue} 
     */
    CreateTextWithoutLanguageArray(values) {
        result := ComCall(30, this, "ptr", values, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {IppAttributeValue} 
     */
    CreateNameWithoutLanguage(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(31, this, "ptr", value, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} values 
     * @returns {IppAttributeValue} 
     */
    CreateNameWithoutLanguageArray(values) {
        result := ComCall(32, this, "ptr", values, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {IppAttributeValue} 
     */
    CreateKeyword(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(33, this, "ptr", value, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} values 
     * @returns {IppAttributeValue} 
     */
    CreateKeywordArray(values) {
        result := ComCall(34, this, "ptr", values, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {IppAttributeValue} 
     */
    CreateUri(value) {
        result := ComCall(35, this, "ptr", value, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {IIterable<Uri>} values 
     * @returns {IppAttributeValue} 
     */
    CreateUriArray(values) {
        result := ComCall(36, this, "ptr", values, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {IppAttributeValue} 
     */
    CreateUriSchema(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(37, this, "ptr", value, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} values 
     * @returns {IppAttributeValue} 
     */
    CreateUriSchemaArray(values) {
        result := ComCall(38, this, "ptr", values, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {IppAttributeValue} 
     */
    CreateCharset(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(39, this, "ptr", value, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} values 
     * @returns {IppAttributeValue} 
     */
    CreateCharsetArray(values) {
        result := ComCall(40, this, "ptr", values, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {IppAttributeValue} 
     */
    CreateNaturalLanguage(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(41, this, "ptr", value, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} values 
     * @returns {IppAttributeValue} 
     */
    CreateNaturalLanguageArray(values) {
        result := ComCall(42, this, "ptr", values, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {IppAttributeValue} 
     */
    CreateMimeMedia(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(43, this, "ptr", value, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} values 
     * @returns {IppAttributeValue} 
     */
    CreateMimeMediaArray(values) {
        result := ComCall(44, this, "ptr", values, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IppAttributeValue(result_)
    }
}
