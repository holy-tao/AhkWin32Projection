#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumTfInputProcessorProfiles interface is implemented by TSF manager and used by applications or textservices. This interface can be retrieved by ITfInputProcessorProfileMgr::EnumProfiles and enumerates the registered profiles.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-ienumtfinputprocessorprofiles
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class IEnumTfInputProcessorProfiles extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumTfInputProcessorProfiles
     * @type {Guid}
     */
    static IID => Guid("{71c6e74d-0f28-11d8-a82a-00065b84435c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Clone", "Next", "Reset", "Skip"]

    /**
     * 
     * @param {Pointer<IEnumTfInputProcessorProfiles>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-ienumtfinputprocessorprofiles-clone
     */
    Clone(ppEnum) {
        result := ComCall(3, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @param {Pointer<TF_INPUTPROCESSORPROFILE>} pProfile 
     * @param {Pointer<Integer>} pcFetch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-ienumtfinputprocessorprofiles-next
     */
    Next(ulCount, pProfile, pcFetch) {
        result := ComCall(4, this, "uint", ulCount, "ptr", pProfile, "uint*", pcFetch, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-ienumtfinputprocessorprofiles-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-ienumtfinputprocessorprofiles-skip
     */
    Skip(ulCount) {
        result := ComCall(6, this, "uint", ulCount, "HRESULT")
        return result
    }
}
