#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfInputProcessorProfiles.ahk

/**
 * This interface is implemented by the TSF manager and used by a text service or application to set the display description of the language profile.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfinputprocessorprofilesex
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfInputProcessorProfilesEx extends ITfInputProcessorProfiles{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfInputProcessorProfilesEx
     * @type {Guid}
     */
    static IID => Guid("{892f230f-fe00-4a41-a98e-fcd6de0d35ef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 21

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetLanguageProfileDisplayName"]

    /**
     * 
     * @param {Pointer<Guid>} rclsid 
     * @param {Integer} langid 
     * @param {Pointer<Guid>} guidProfile 
     * @param {PWSTR} pchFile 
     * @param {Integer} cchFile 
     * @param {Integer} uResId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfinputprocessorprofilesex-setlanguageprofiledisplayname
     */
    SetLanguageProfileDisplayName(rclsid, langid, guidProfile, pchFile, cchFile, uResId) {
        pchFile := pchFile is String ? StrPtr(pchFile) : pchFile

        result := ComCall(21, this, "ptr", rclsid, "ushort", langid, "ptr", guidProfile, "ptr", pchFile, "uint", cchFile, "uint", uResId, "HRESULT")
        return result
    }
}
