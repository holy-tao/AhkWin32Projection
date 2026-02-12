#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include .\IppResolution.ahk
#Include .\IppIntegerRange.ahk
#Include ..\..\Foundation\Collections\IMapView.ahk
#Include .\IppAttributeValue.ahk
#Include .\IppTextWithLanguage.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class IIppAttributeValue extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIppAttributeValue
     * @type {Guid}
     */
    static IID => Guid("{99407fed-e2bb-59a3-988b-28a974052a26}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Kind", "GetIntegerArray", "GetBooleanArray", "GetEnumArray", "GetOctetStringArray", "GetDateTimeArray", "GetResolutionArray", "GetRangeOfIntegerArray", "GetCollectionArray", "GetTextWithLanguageArray", "GetNameWithLanguageArray", "GetTextWithoutLanguageArray", "GetNameWithoutLanguageArray", "GetKeywordArray", "GetUriArray", "GetUriSchemaArray", "GetCharsetArray", "GetNaturalLanguageArray", "GetMimeMediaTypeArray"]

    /**
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    GetIntegerArray() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @returns {IVector<Boolean>} 
     */
    GetBooleanArray() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    GetEnumArray() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @returns {IVector<IBuffer>} 
     */
    GetOctetStringArray() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(IBuffer, result_)
    }

    /**
     * 
     * @returns {IVector<DateTime>} 
     */
    GetDateTimeArray() {
        result := ComCall(11, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => IPropertyValue(ptr).GetDateTime(), result_)
    }

    /**
     * 
     * @returns {IVector<IppResolution>} 
     */
    GetResolutionArray() {
        result := ComCall(12, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(IppResolution, result_)
    }

    /**
     * 
     * @returns {IVector<IppIntegerRange>} 
     */
    GetRangeOfIntegerArray() {
        result := ComCall(13, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(IppIntegerRange, result_)
    }

    /**
     * 
     * @returns {IVector<IMapView<HSTRING, IppAttributeValue>>} 
     */
    GetCollectionArray() {
        result := ComCall(14, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(IMapView.Call.Bind(IMapView, (ptr) => HSTRING({ Value: ptr }), IppAttributeValue), result_)
    }

    /**
     * 
     * @returns {IVector<IppTextWithLanguage>} 
     */
    GetTextWithLanguageArray() {
        result := ComCall(15, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(IppTextWithLanguage, result_)
    }

    /**
     * 
     * @returns {IVector<IppTextWithLanguage>} 
     */
    GetNameWithLanguageArray() {
        result := ComCall(16, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(IppTextWithLanguage, result_)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    GetTextWithoutLanguageArray() {
        result := ComCall(17, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), result_)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    GetNameWithoutLanguageArray() {
        result := ComCall(18, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), result_)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    GetKeywordArray() {
        result := ComCall(19, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), result_)
    }

    /**
     * 
     * @returns {IVector<Uri>} 
     */
    GetUriArray() {
        result := ComCall(20, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Uri, result_)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    GetUriSchemaArray() {
        result := ComCall(21, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), result_)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    GetCharsetArray() {
        result := ComCall(22, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), result_)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    GetNaturalLanguageArray() {
        result := ComCall(23, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), result_)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    GetMimeMediaTypeArray() {
        result := ComCall(24, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), result_)
    }
}
