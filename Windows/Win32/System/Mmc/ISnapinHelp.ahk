#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Allows snap-ins to add HTML Help support.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-isnapinhelp
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class ISnapinHelp extends IUnknown{
    /**
     * The interface identifier for ISnapinHelp
     * @type {Guid}
     */
    static IID => Guid("{a6b15ace-df59-11d0-a7dd-00c04fd909dd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PWSTR>} lpCompiledHelpFile 
     * @returns {HRESULT} 
     */
    GetHelpTopic(lpCompiledHelpFile) {
        result := ComCall(3, this, "ptr", lpCompiledHelpFile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
