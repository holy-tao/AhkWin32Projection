#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IDropSource interface is one of the interfaces you implement to provide drag-and-drop operations in your application.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-idropsource
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IDropSource extends IUnknown{
    /**
     * The interface identifier for IDropSource
     * @type {Guid}
     */
    static IID => Guid("{00000121-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {BOOL} fEscapePressed 
     * @param {Integer} grfKeyState 
     * @returns {HRESULT} 
     */
    QueryContinueDrag(fEscapePressed, grfKeyState) {
        result := ComCall(3, this, "int", fEscapePressed, "uint", grfKeyState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwEffect 
     * @returns {HRESULT} 
     */
    GiveFeedback(dwEffect) {
        result := ComCall(4, this, "uint", dwEffect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
