#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used to store a pair of IKE/Authip cookies.
 * @remarks
 * <b>IKEEXT_COOKIE_PAIR0</b> is a specific implementation of IKEEXT_COOKIE_PAIR. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_cookie_pair0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_COOKIE_PAIR0 {
    #StructPack 8

    /**
     * Initiator cookie. An IKEEXT_COOKIE is a UINT64.
     */
    initiator : Int64

    /**
     * Responder cookie. An IKEEXT_COOKIE is a UINT64.
     */
    responder : Int64

}
