#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is implemented by the TSF manager and is used by an application or text service to manipulate the substitute input locale identifier (keyboard layout) of a text service profile.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfinputprocessorprofilesubstitutelayout
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfInputProcessorProfileSubstituteLayout extends IUnknown{
    /**
     * The interface identifier for ITfInputProcessorProfileSubstituteLayout
     * @type {Guid}
     */
    static IID => Guid("{4fd67194-1002-4513-bff2-c0ddf6258552}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Integer} langid 
     * @param {Pointer<Guid>} guidProfile 
     * @param {Pointer<HKL>} phKL 
     * @returns {HRESULT} 
     */
    GetSubstituteKeyboardLayout(rclsid, langid, guidProfile, phKL) {
        result := ComCall(3, this, "ptr", rclsid, "ushort", langid, "ptr", guidProfile, "ptr", phKL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
