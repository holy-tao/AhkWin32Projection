#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IFECommon interface provides IME-related services that are common for different languages.
 * @remarks
 * 
  * Create an instance of this interface with the <a href="https://docs.microsoft.com/windows/desktop/api/msime/nf-msime-createifecommoninstance">CreateIFECommonInstance</a> function.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msime/nn-msime-ifecommon
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IFECommon extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFECommon
     * @type {Guid}
     */
    static IID => Guid("{019f7151-e6db-11d0-83c3-00c04fddb82e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsDefaultIME", "SetDefaultIME", "InvokeWordRegDialog", "InvokeDictToolDialog"]

    /**
     * 
     * @param {PSTR} szName 
     * @param {Integer} cszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msime/nf-msime-ifecommon-isdefaultime
     */
    IsDefaultIME(szName, cszName) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(3, this, "ptr", szName, "int", cszName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msime/nf-msime-ifecommon-setdefaultime
     */
    SetDefaultIME() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMEDLG>} pimedlg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msime/nf-msime-ifecommon-invokewordregdialog
     */
    InvokeWordRegDialog(pimedlg) {
        result := ComCall(5, this, "ptr", pimedlg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMEDLG>} pimedlg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msime/nf-msime-ifecommon-invokedicttooldialog
     */
    InvokeDictToolDialog(pimedlg) {
        result := ComCall(6, this, "ptr", pimedlg, "HRESULT")
        return result
    }
}
