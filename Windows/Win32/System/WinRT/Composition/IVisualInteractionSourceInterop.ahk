#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Composition
 * @version v4.0.30319
 */
class IVisualInteractionSourceInterop extends IUnknown{
    /**
     * The interface identifier for IVisualInteractionSourceInterop
     * @type {Guid}
     */
    static IID => Guid("{11f62cd1-2f9d-42d3-b05f-d6790d9e9f8e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<POINTER_INFO>} pointerInfo 
     * @returns {HRESULT} 
     */
    TryRedirectForManipulation(pointerInfo) {
        result := ComCall(3, this, "ptr", pointerInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
