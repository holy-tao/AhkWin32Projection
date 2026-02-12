#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\IRawElementProviderSimple.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes the properties of an annotation in a document. Implement this interface in order to support the capabilities that an automation client requests with a [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) call and [PatternInterface.Annotation](../windows.ui.xaml.automation.peers/patterninterface.md).
 * @remarks
 * The **Annotation** control pattern is used to expose the properties of an annotation in a document. One example is a comment balloon that is in the margin of a document and is connected to some document text or a spreadsheet cell. For more info on what this pattern is for, see [Annotation Control Pattern](/windows/desktop/WinAuto/uiauto-implementingannotation).
 * 
 * IAnnotationProvider isn't implemented by any existing Windows Runtime automation peers. The interface exists so that custom control authors can support the automation pattern in a custom control, and implement their automation support using the same Windows Runtime managed or C++ API as they use to define control logic or other automation support.
 * 
 * Use [AnnotationPatternIdentifiers](../windows.ui.xaml.automation/annotationpatternidentifiers.md) if you want to reference the IAnnotationProvider pattern properties from control code when you fire automation events or call [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iannotationprovider
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class IAnnotationProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAnnotationProvider
     * @type {Guid}
     */
    static IID => Guid("{95ba1417-4437-451b-9461-050a49b59d06}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AnnotationTypeId", "get_AnnotationTypeName", "get_Author", "get_DateTime", "get_Target"]

    /**
     * Gets the annotation type identifier of this annotation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iannotationprovider.annotationtypeid
     * @type {Integer} 
     */
    AnnotationTypeId {
        get => this.get_AnnotationTypeId()
    }

    /**
     * Gets the name of this annotation type.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iannotationprovider.annotationtypename
     * @type {HSTRING} 
     */
    AnnotationTypeName {
        get => this.get_AnnotationTypeName()
    }

    /**
     * Gets the name of the annotation author.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iannotationprovider.author
     * @type {HSTRING} 
     */
    Author {
        get => this.get_Author()
    }

    /**
     * Gets the date and time when this annotation was created.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iannotationprovider.datetime
     * @type {HSTRING} 
     */
    DateTime {
        get => this.get_DateTime()
    }

    /**
     * Gets the UI Automation element that is being annotated.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iannotationprovider.target
     * @type {IRawElementProviderSimple} 
     */
    Target {
        get => this.get_Target()
    }

    /**
     * The annotation type identifier of this annotation.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iannotationprovider-get_annotationtypeid
     */
    get_AnnotationTypeId() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * The name of this annotation type.
     * @remarks
     * The name of the annotation type can correspond to one of the annotation type identifiers (for example, “Comment” for  <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-annotation-type-identifiers">AnnotationType_Comment</a>), but it is not required to.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iannotationprovider-get_annotationtypename
     */
    get_AnnotationTypeName() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * The name of the annotation author.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iannotationprovider-get_author
     */
    get_Author() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * The date and time when this annotation was created.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iannotationprovider-get_datetime
     */
    get_DateTime() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * The UI Automation element that is being annotated.
     * @returns {IRawElementProviderSimple} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iannotationprovider-get_target
     */
    get_Target() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRawElementProviderSimple(value)
    }
}
