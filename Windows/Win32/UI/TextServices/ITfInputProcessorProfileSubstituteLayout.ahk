#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Input\KeyboardAndMouse\HKL.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is implemented by the TSF manager and is used by an application or text service to manipulate the substitute input locale identifier (keyboard layout) of a text service profile.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfinputprocessorprofilesubstitutelayout
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfInputProcessorProfileSubstituteLayout extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSubstituteKeyboardLayout"]

    /**
     * ITfInputProcessorProfileSubstituteLayout::GetSubstituteKeyboardLayout method
     * @param {Pointer<Guid>} rclsid Contains the class identifier of the text service.
     * @param {Integer} langid Specifies the language of the profile. See <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifiers">Language Identifiers</a>.
     * @param {Pointer<Guid>} guidProfile Identifies the profile GUID.
     * @returns {HKL} Pointer to an <b>HKL</b> value that specifies the substitute input locale identifier.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfinputprocessorprofilesubstitutelayout-getsubstitutekeyboardlayout
     */
    GetSubstituteKeyboardLayout(rclsid, langid, guidProfile) {
        phKL := HKL()
        result := ComCall(3, this, "ptr", rclsid, "ushort", langid, "ptr", guidProfile, "ptr", phKL, "HRESULT")
        return phKL
    }
}
