#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 * @version v4.0.30319
 */
class PF_NPGetPropertyText extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Integer} iButton 
     * @param {Integer} nPropSel 
     * @param {PWSTR} lpName 
     * @param {PWSTR} lpButtonName 
     * @param {Integer} nButtonNameLen 
     * @param {Integer} nType 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(iButton, nPropSel, lpName, lpButtonName, nButtonNameLen, nType) {
        lpName := lpName is String ? StrPtr(lpName) : lpName
        lpButtonName := lpButtonName is String ? StrPtr(lpButtonName) : lpButtonName

        result := ComCall(3, this, "uint", iButton, "uint", nPropSel, "ptr", lpName, "ptr", lpButtonName, "uint", nButtonNameLen, "uint", nType, "uint")
        return result
    }
}
