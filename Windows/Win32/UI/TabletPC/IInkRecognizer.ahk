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
     * Gets the name of the object.
     * @remarks
     * 
     * Accessing this property within certain message handlers can result in the underlying function being re-entered, causing unexpected results. Take care to avoid a reentrant call when handling any of the following messages: <b>WM_ACTIVATE</b>, <b>WM_ACTIVATEAPP</b>, <b>WM_NCACTIVATE</b>, WM_PAINT; <b>WM_SYSCOMMAND</b> if <i>wParam</i> is set to SC_HOTKEY or SC_TASKLIST; and <b>WM_SYSKEYDOWN</b> (when processing Alt-Tab or Alt-Esc key combinations). This is an issue with single-threaded apartment model applications.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognizer-get_name
     */
    get_Name() {
        Name := BSTR()
        result := ComCall(7, this, "ptr", Name, "HRESULT")
        return Name
    }

    /**
     * Gets the vendor name of the IInkRecognizer object.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognizer-get_vendor
     */
    get_Vendor() {
        Vendor := BSTR()
        result := ComCall(8, this, "ptr", Vendor, "HRESULT")
        return Vendor
    }

    /**
     * Gets the capabilities of the IInkRecognizer object.
     * @remarks
     * 
     * A recognizer's capabilities are defined in the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/ne-msinkaut-inkrecognizercapabilities">InkRecognizerCapabilities</a> enumeration, and they include whether the recognizer supports character Autocomplete; whether it supports free, lined, or boxed input; and so on. For a complete list of recognizer capabilities, see the <b>InkRecognizerCapabilities</b> enumeration.
     * 
     * To determine if a recognizer has a particular capability, use a bitwise comparison operator to check for that capability.
     * 
     * For information about how to request various recognizer capabilities, or modes, see the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_guide">Guide</a> property of the <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizercontext-class">RecognizerContext</a> object.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognizer-get_capabilities
     */
    get_Capabilities() {
        result := ComCall(9, this, "int*", &CapabilitiesFlags := 0, "HRESULT")
        return CapabilitiesFlags
    }

    /**
     * Gets an array of language identifiers for the languages that the IInkRecognizer object supports.
     * @remarks
     * 
     * This property can be used to search the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms702438(v=vs.85)">InkRecognizers</a> collection for a <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognizer">IInkRecognizer</a> that supports a specific language.
     * 
     * This property returns the empty array for Microsoft gesture recognizer.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognizer-get_languages
     */
    get_Languages() {
        Languages := VARIANT()
        result := ComCall(10, this, "ptr", Languages, "HRESULT")
        return Languages
    }

    /**
     * Gets an array of globally unique identifiers (GUIDs) that describe the properties that the IInkRecognizer object supports.
     * @remarks
     * 
     * A recognizer may support line metrics, line numbers, confidence levels, and so on. For a complete list of the properties that a recognizer may support, see the <a href="https://docs.microsoft.com/windows/desktop/tablet/recognitionproperty-constants">RecognitionProperty</a> object.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognizer-get_supportedproperties
     */
    get_SupportedProperties() {
        SupportedProperties := VARIANT()
        result := ComCall(11, this, "ptr", SupportedProperties, "HRESULT")
        return SupportedProperties
    }

    /**
     * Gets an array of globally unique identifiers (GUIDs) that represents the preferred packet properties for the recognizer.
     * @remarks
     * 
     * This property describes the contents of a packet and does not allow access to the data that the packet contains.
     * 
     * This property lists the packet properties that the recognizer uses to complete recognition. For all of the Microsoft recognizers, the <b>PreferredPacketDescription</b> property refers to the data describing (x, y) coordinates within an <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp">IInkStrokeDisp</a> object. This data is represented by the X and Y fields of the <a href="https://docs.microsoft.com/windows/desktop/tablet/packetpropertyguids-constants">packet property</a> constants. A packet contains this point data as well as other data that is related to that stroke, such as the pressure of the pen that made the stroke, the angle of the pen, and so on. The Microsoft recognizers ignore pressure, tilt, and other packet properties.
     * 
     * 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognizer-get_preferredpacketdescription
     */
    get_PreferredPacketDescription() {
        PreferredPacketDescription := VARIANT()
        result := ComCall(12, this, "ptr", PreferredPacketDescription, "HRESULT")
        return PreferredPacketDescription
    }

    /**
     * Creates a new InkRecognizerContext object.
     * @returns {IInkRecognizerContext} Returns a <a href="https://docs.microsoft.com/windows/desktop/tablet/inkrecognizercontext-class">InkRecognizerContext</a> for the invoking <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nn-msinkaut-iinkrecognizer">IInkRecognizer</a>.
     * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nf-msinkaut-iinkrecognizer-createrecognizercontext
     */
    CreateRecognizerContext() {
        result := ComCall(13, this, "ptr*", &Context := 0, "HRESULT")
        return IInkRecognizerContext(Context)
    }
}
