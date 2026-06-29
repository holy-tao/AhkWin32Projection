#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\SLLICENSINGSTATUS.ahk" { SLLICENSINGSTATUS }

/**
 * Represents the licensing status. (SL_LICENSING_STATUS)
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/ns-slpublic-sl_licensing_status
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SL_LICENSING_STATUS {
    #StructPack 8

    /**
     * Type: <b>SLID</b>
     * 
     * The SKU ID.
     */
    SkuId : Guid

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/slpublic/ne-slpublic-sllicensingstatus">SLLICENSINGSTATUS</a></b>
     * 
     * The licensing status.
     */
    eStatus : SLLICENSINGSTATUS

    /**
     * Type: <b>DWORD</b>
     * 
     * The grace time in minutes.
     */
    dwGraceTime : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The predefined grace days in the license.
     */
    dwTotalGraceDays : UInt32

    /**
     * Type: <b>HRESULT</b>
     * 
     * The error of unlicensed status.
     */
    hrReason : HRESULT

    /**
     * Type: <b>UINT64</b>
     * 
     * The validity expiration day.
     */
    qwValidityExpiration : Int64

}
