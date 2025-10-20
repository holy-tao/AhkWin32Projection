#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a control that contains text.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationtextpattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationTextPattern extends IUnknown{
    /**
     * The interface identifier for IUIAutomationTextPattern
     * @type {Guid}
     */
    static IID => Guid("{32eba289-3583-42c9-9c59-3b6d9a1e9b6a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {POINT} pt 
     * @param {Pointer<IUIAutomationTextRange>} range 
     * @returns {HRESULT} 
     */
    RangeFromPoint(pt, range) {
        result := ComCall(3, this, "ptr", pt, "ptr", range, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} child 
     * @param {Pointer<IUIAutomationTextRange>} range 
     * @returns {HRESULT} 
     */
    RangeFromChild(child, range) {
        result := ComCall(4, this, "ptr", child, "ptr", range, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationTextRangeArray>} ranges 
     * @returns {HRESULT} 
     */
    GetSelection(ranges) {
        result := ComCall(5, this, "ptr", ranges, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationTextRangeArray>} ranges 
     * @returns {HRESULT} 
     */
    GetVisibleRanges(ranges) {
        result := ComCall(6, this, "ptr", ranges, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationTextRange>} range 
     * @returns {HRESULT} 
     */
    get_DocumentRange(range) {
        result := ComCall(7, this, "ptr", range, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} supportedTextSelection 
     * @returns {HRESULT} 
     */
    get_SupportedTextSelection(supportedTextSelection) {
        result := ComCall(8, this, "int*", supportedTextSelection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
