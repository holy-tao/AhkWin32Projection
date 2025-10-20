#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Represents the ability to process ink, or handwriting, and translate the stroke into text or gesture. The recognizer creates an InkRecognizerContext object, which is used to perform the actual handwriting recognition.
 * @remarks
 * 
  * A recognizer has specific attributes and properties that allow it to perform recognition. The properties of a recognizer must be determined before recognition can occur. The types of properties that a recognizer supports determine the types of recognition it can perform. For instance, if a recognizer doesn't support cursive handwriting, it returns inaccurate results when a user writes in cursive.
  * 
  * A recognizer also has built-in functionality that automatically manages many aspects of handwriting. For instance, it determines the metrics for the lines on which strokes are drawn. You can return the line number of a stroke, but you never need to specify how those line metrics are determined because of the built-in functionality of the recognizer.
  * 
  * For more information about recognition, see <a href="https://docs.microsoft.com/windows/desktop/tablet/about-handwriting-recognition">About Handwriting Recognition</a>.
  * 
  * If you define a class that implements this interface, the new class will not interact correctly with the Tablet PC application programming interfaces (APIs).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkrecognizer
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkRecognizer extends IDispatch{
    /**
     * The interface identifier for IInkRecognizer
     * @type {Guid}
     */
    static IID => Guid("{782bf7cf-034b-4396-8a32-3a1833cf6b56}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} Name 
     * @returns {HRESULT} 
     */
    get_Name(Name) {
        result := ComCall(7, this, "ptr", Name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Vendor 
     * @returns {HRESULT} 
     */
    get_Vendor(Vendor) {
        result := ComCall(8, this, "ptr", Vendor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} CapabilitiesFlags 
     * @returns {HRESULT} 
     */
    get_Capabilities(CapabilitiesFlags) {
        result := ComCall(9, this, "int*", CapabilitiesFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Languages 
     * @returns {HRESULT} 
     */
    get_Languages(Languages) {
        result := ComCall(10, this, "ptr", Languages, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} SupportedProperties 
     * @returns {HRESULT} 
     */
    get_SupportedProperties(SupportedProperties) {
        result := ComCall(11, this, "ptr", SupportedProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} PreferredPacketDescription 
     * @returns {HRESULT} 
     */
    get_PreferredPacketDescription(PreferredPacketDescription) {
        result := ComCall(12, this, "ptr", PreferredPacketDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkRecognizerContext>} Context 
     * @returns {HRESULT} 
     */
    CreateRecognizerContext(Context) {
        result := ComCall(13, this, "ptr", Context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
