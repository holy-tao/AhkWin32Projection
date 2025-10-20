#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ILaunchUIContextProvider extends IUnknown{
    /**
     * The interface identifier for ILaunchUIContextProvider
     * @type {Guid}
     */
    static IID => Guid("{0d12c4c8-a3d9-4e24-94c1-0e20c5a956c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ILaunchUIContext>} context 
     * @returns {HRESULT} 
     */
    UpdateContext(context) {
        result := ComCall(3, this, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
