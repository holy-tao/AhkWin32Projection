#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * ICDBurnExt may be altered or unavailable.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-icdburnext
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ICDBurnExt extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICDBurnExt
     * @type {Guid}
     */
    static IID => Guid("{2271dcca-74fc-4414-8fb7-c56b05ace2d7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSupportedActionTypes"]

    /**
     * 
     * @param {Pointer<Integer>} pdwActions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-icdburnext-getsupportedactiontypes
     */
    GetSupportedActionTypes(pdwActions) {
        result := ComCall(3, this, "uint*", pdwActions, "HRESULT")
        return result
    }
}
