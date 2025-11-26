#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IInkRecognizerContext.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Vendor", "get_Capabilities", "get_Languages", "get_SupportedProperties", "get_PreferredPacketDescription", "CreateRecognizerContext"]

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    Vendor {
        get => this.get_Vendor()
    }

    /**
     * @type {Integer} 
     */
    Capabilities {
        get => this.get_Capabilities()
    }

    /**
     * @type {VARIANT} 
     */
    Languages {
        get => this.get_Languages()
    }

    /**
     * @type {VARIANT} 
     */
    SupportedProperties {
        get => this.get_SupportedProperties()
    }

    /**
     * @type {VARIANT} 
     */
    PreferredPacketDescription {
        get => this.get_PreferredPacketDescription()
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizer-get_name
     */
    get_Name() {
        Name := BSTR()
        result := ComCall(7, this, "ptr", Name, "HRESULT")
        return Name
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizer-get_vendor
     */
    get_Vendor() {
        Vendor := BSTR()
        result := ComCall(8, this, "ptr", Vendor, "HRESULT")
        return Vendor
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizer-get_capabilities
     */
    get_Capabilities() {
        result := ComCall(9, this, "int*", &CapabilitiesFlags := 0, "HRESULT")
        return CapabilitiesFlags
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizer-get_languages
     */
    get_Languages() {
        Languages := VARIANT()
        result := ComCall(10, this, "ptr", Languages, "HRESULT")
        return Languages
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizer-get_supportedproperties
     */
    get_SupportedProperties() {
        SupportedProperties := VARIANT()
        result := ComCall(11, this, "ptr", SupportedProperties, "HRESULT")
        return SupportedProperties
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizer-get_preferredpacketdescription
     */
    get_PreferredPacketDescription() {
        PreferredPacketDescription := VARIANT()
        result := ComCall(12, this, "ptr", PreferredPacketDescription, "HRESULT")
        return PreferredPacketDescription
    }

    /**
     * 
     * @returns {IInkRecognizerContext} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizer-createrecognizercontext
     */
    CreateRecognizerContext() {
        result := ComCall(13, this, "ptr*", &Context := 0, "HRESULT")
        return IInkRecognizerContext(Context)
    }
}
