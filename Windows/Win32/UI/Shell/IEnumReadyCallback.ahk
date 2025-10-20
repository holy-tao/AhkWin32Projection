#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that enable the view to notify the implementer when the enumeration has completed.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-ienumreadycallback
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IEnumReadyCallback extends IUnknown{
    /**
     * The interface identifier for IEnumReadyCallback
     * @type {Guid}
     */
    static IID => Guid("{61e00d45-8fff-4e60-924e-6537b61612dd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    EnumReady() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
