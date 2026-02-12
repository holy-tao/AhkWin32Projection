#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\XamlSourceFocusNavigationRequest.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Hosting
 * @version WindowsRuntime 1.4
 */
class IXamlSourceFocusNavigationRequestFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXamlSourceFocusNavigationRequestFactory
     * @type {Guid}
     */
    static IID => Guid("{e746ab8f-b4ef-5390-97e5-cc0a2779c574}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance", "CreateInstanceWithHintRect", "CreateInstanceWithHintRectAndCorrelationId"]

    /**
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {Integer} reason 
     * @returns {XamlSourceFocusNavigationRequest} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(reason) {
        result := ComCall(6, this, "int", reason, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XamlSourceFocusNavigationRequest(value)
    }

    /**
     * 
     * @param {Integer} reason 
     * @param {RECT} hintRect 
     * @returns {XamlSourceFocusNavigationRequest} 
     */
    CreateInstanceWithHintRect(reason, hintRect) {
        result := ComCall(7, this, "int", reason, "ptr", hintRect, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XamlSourceFocusNavigationRequest(value)
    }

    /**
     * 
     * @param {Integer} reason 
     * @param {RECT} hintRect 
     * @param {Guid} correlationId_ 
     * @returns {XamlSourceFocusNavigationRequest} 
     */
    CreateInstanceWithHintRectAndCorrelationId(reason, hintRect, correlationId_) {
        result := ComCall(8, this, "int", reason, "ptr", hintRect, "ptr", correlationId_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XamlSourceFocusNavigationRequest(value)
    }
}
