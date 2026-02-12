#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Text
 * @version WindowsRuntime 1.4
 */
class ISemanticTextQuery extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISemanticTextQuery
     * @type {Guid}
     */
    static IID => Guid("{6a1cab51-1fb2-4909-80b8-35731a2b3e7f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Find", "FindInProperty"]

    /**
     * Find Method Example (VC++)
     * @param {HSTRING} content 
     * @returns {IVectorView<TextSegment>} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/find-method-example-vc
     */
    Find(content) {
        if(content is String) {
            pin := HSTRING.Create(content)
            content := pin.Value
        }
        content := content is Win32Handle ? NumGet(content, "ptr") : content

        result := ComCall(6, this, "ptr", content, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetTextSegment(), result_)
    }

    /**
     * 
     * @param {HSTRING} propertyContent 
     * @param {HSTRING} propertyName 
     * @returns {IVectorView<TextSegment>} 
     */
    FindInProperty(propertyContent, propertyName) {
        if(propertyContent is String) {
            pin := HSTRING.Create(propertyContent)
            propertyContent := pin.Value
        }
        propertyContent := propertyContent is Win32Handle ? NumGet(propertyContent, "ptr") : propertyContent
        if(propertyName is String) {
            pin := HSTRING.Create(propertyName)
            propertyName := pin.Value
        }
        propertyName := propertyName is Win32Handle ? NumGet(propertyName, "ptr") : propertyName

        result := ComCall(7, this, "ptr", propertyContent, "ptr", propertyName, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetTextSegment(), result_)
    }
}
