#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationTextRange2.ahk

/**
 * Extends the IUIAutomationTextRange2 interface to support faster access to the underlying rich text data on a text range.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationtextrange3
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationTextRange3 extends IUIAutomationTextRange2{
    /**
     * The interface identifier for IUIAutomationTextRange3
     * @type {Guid}
     */
    static IID => Guid("{6a315d69-5512-4c2e-85f0-53fce6dd4bc2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 22

    /**
     * 
     * @param {Pointer<IUIAutomationCacheRequest>} cacheRequest 
     * @param {Pointer<IUIAutomationElement>} enclosingElement 
     * @returns {HRESULT} 
     */
    GetEnclosingElementBuildCache(cacheRequest, enclosingElement) {
        result := ComCall(22, this, "ptr", cacheRequest, "ptr", enclosingElement, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationCacheRequest>} cacheRequest 
     * @param {Pointer<IUIAutomationElementArray>} children 
     * @returns {HRESULT} 
     */
    GetChildrenBuildCache(cacheRequest, children) {
        result := ComCall(23, this, "ptr", cacheRequest, "ptr", children, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} attributeIds 
     * @param {Integer} attributeIdCount 
     * @param {Pointer<SAFEARRAY>} attributeValues 
     * @returns {HRESULT} 
     */
    GetAttributeValues(attributeIds, attributeIdCount, attributeValues) {
        result := ComCall(24, this, "int*", attributeIds, "int", attributeIdCount, "ptr", attributeValues, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
