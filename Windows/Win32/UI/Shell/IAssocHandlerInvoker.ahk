#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that invoke an associated application handler.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iassochandlerinvoker
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IAssocHandlerInvoker extends IUnknown{
    /**
     * The interface identifier for IAssocHandlerInvoker
     * @type {Guid}
     */
    static IID => Guid("{92218cab-ecaa-4335-8133-807fd234c2ee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    SupportsSelection() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Invoke() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
