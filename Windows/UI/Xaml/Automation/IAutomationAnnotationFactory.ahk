#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AutomationAnnotation.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class IAutomationAnnotationFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomationAnnotationFactory
     * @type {Guid}
     */
    static IID => Guid("{4906fa52-ddc0-4e69-b76b-019d928d822f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance", "CreateWithElementParameter"]

    /**
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {Integer} type 
     * @returns {AutomationAnnotation} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(type) {
        result := ComCall(6, this, "int", type, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationAnnotation(value)
    }

    /**
     * 
     * @param {Integer} type 
     * @param {UIElement} element 
     * @returns {AutomationAnnotation} 
     */
    CreateWithElementParameter(type, element) {
        result := ComCall(7, this, "int", type, "ptr", element, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationAnnotation(value)
    }
}
