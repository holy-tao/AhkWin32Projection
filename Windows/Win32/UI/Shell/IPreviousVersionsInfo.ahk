#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that checks for previous versions of server files or folders, stored for the purpose of reversion by the shadow copies technology provided with Windows Server 2003.
 * @remarks
 * 
  * The CLSID, IID, and definition for this interface are shown in the following example.
  * 
  *                 
  * 
  * <pre class="syntax" xml:space="preserve"><code>// {596AB062-B4D2-4215-9F74-E9109B0A8153}
  * const CLSID CLSID_PreviousVersions = {0x596AB062, 0xB4D2, 0x4215, 
  *                              {0x9F, 0x74, 0xE9, 0x10, 0x9B, 0x0A, 0x81, 0x53}};
  * 
  * // {76e54780-ad74-48e3-a695-3ba9a0aff10d}
  * const IID IID_IPreviousVersionsInfo = {0x76E54780, 0xAD74, 0x48E3, 
  *                              {0xA6, 0x95, 0x3B, 0xA9, 0xA0, 0xAF, 0xF1, 0x0D}};
  * 
  * MIDL_INTERFACE("76e54780-ad74-48e3-a695-3ba9a0aff10d")
  * IPreviousVersionsInfo : public IUnknown
  * {
  * public:
  *     virtual HRESULT STDMETHODCALLTYPE AreSnapshotsAvailable( 
  *         // [string][in]  LPCWSTR pszPath,
  *         // [in]  BOOL fOkToBeSlow,
  *         // [retval][out]  BOOL *pfAvailable) = 0;
  * };</code></pre>
  * Note that the shadow copies technology does not store entire copies of older versions unless they are deleted; only the changed bits are stored.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-ipreviousversionsinfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IPreviousVersionsInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPreviousVersionsInfo
     * @type {Guid}
     */
    static IID => Guid("{76e54780-ad74-48e3-a695-3ba9a0aff10d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AreSnapshotsAvailable"]

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {BOOL} fOkToBeSlow 
     * @param {Pointer<BOOL>} pfAvailable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ipreviousversionsinfo-aresnapshotsavailable
     */
    AreSnapshotsAvailable(pszPath, fOkToBeSlow, pfAvailable) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(3, this, "ptr", pszPath, "int", fOkToBeSlow, "ptr", pfAvailable, "HRESULT")
        return result
    }
}
