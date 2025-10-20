#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationElement3.ahk

/**
 * Extends the IUIAutomationElement3 interface.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationelement4
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationElement4 extends IUIAutomationElement3{
    /**
     * The interface identifier for IUIAutomationElement4
     * @type {Guid}
     */
    static IID => Guid("{3b6e233c-52fb-4063-a4c9-77c075c2a06b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 94

    /**
     * 
     * @param {Pointer<Int32>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentPositionInSet(retVal) {
        result := ComCall(94, this, "int*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentSizeOfSet(retVal) {
        result := ComCall(95, this, "int*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentLevel(retVal) {
        result := ComCall(96, this, "int*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentAnnotationTypes(retVal) {
        result := ComCall(97, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentAnnotationObjects(retVal) {
        result := ComCall(98, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedPositionInSet(retVal) {
        result := ComCall(99, this, "int*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedSizeOfSet(retVal) {
        result := ComCall(100, this, "int*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedLevel(retVal) {
        result := ComCall(101, this, "int*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedAnnotationTypes(retVal) {
        result := ComCall(102, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedAnnotationObjects(retVal) {
        result := ComCall(103, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
