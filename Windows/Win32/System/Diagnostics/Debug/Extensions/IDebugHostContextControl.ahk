#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostContextControl extends IUnknown{
    /**
     * The interface identifier for IDebugHostContextControl
     * @type {Guid}
     */
    static IID => Guid("{eeb8fb43-b44e-4b0f-b871-65f0886fcaf2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    SwitchTo() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostContextAlternator>} contextAlternator 
     * @returns {HRESULT} 
     */
    GetContextAlternator(contextAlternator) {
        result := ComCall(4, this, "ptr", contextAlternator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
