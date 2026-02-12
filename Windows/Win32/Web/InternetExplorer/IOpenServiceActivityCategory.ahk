#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IOpenServiceActivity.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IEnumOpenServiceActivity.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IOpenServiceActivityCategory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpenServiceActivityCategory
     * @type {Guid}
     */
    static IID => Guid("{850af9d6-7309-40b5-bdb8-786c106b2153}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["HasDefaultActivity", "GetDefaultActivity", "SetDefaultActivity", "GetName", "GetActivityEnumerator"]

    /**
     * 
     * @returns {BOOL} 
     */
    HasDefaultActivity() {
        result := ComCall(3, this, "int*", &pfHasDefaultActivity := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfHasDefaultActivity
    }

    /**
     * 
     * @returns {IOpenServiceActivity} 
     */
    GetDefaultActivity() {
        result := ComCall(4, this, "ptr*", &ppDefaultActivity := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IOpenServiceActivity(ppDefaultActivity)
    }

    /**
     * 
     * @param {IOpenServiceActivity} pActivity 
     * @param {HWND} hwnd_ 
     * @returns {HRESULT} 
     */
    SetDefaultActivity(pActivity, hwnd_) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_

        result := ComCall(5, this, "ptr", pActivity, "ptr", hwnd_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetName
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wmformat/iwmcodecstrings-getname
     */
    GetName() {
        pbstrName := BSTR()
        result := ComCall(6, this, "ptr", pbstrName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrName
    }

    /**
     * 
     * @param {IOpenServiceActivityInput} pInput 
     * @param {IOpenServiceActivityOutputContext} pOutput 
     * @returns {IEnumOpenServiceActivity} 
     */
    GetActivityEnumerator(pInput, pOutput) {
        result := ComCall(7, this, "ptr", pInput, "ptr", pOutput, "ptr*", &ppEnumActivity := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumOpenServiceActivity(ppEnumActivity)
    }
}
