#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Not supported.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-ishellrundll
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellRunDll extends IUnknown{
    /**
     * The interface identifier for IShellRunDll
     * @type {Guid}
     */
    static IID => Guid("{fce4bde0-4b68-4b80-8e9c-7426315a7388}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pszArgs 
     * @returns {HRESULT} 
     */
    Run(pszArgs) {
        pszArgs := pszArgs is String ? StrPtr(pszArgs) : pszArgs

        result := ComCall(3, this, "ptr", pszArgs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
