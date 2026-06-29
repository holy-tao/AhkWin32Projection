#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_TRANSFORM_TYPE.ahk" { IPSEC_TRANSFORM_TYPE }
#Import ".\IPSEC_SA_CIPHER_INFORMATION0.ahk" { IPSEC_SA_CIPHER_INFORMATION0 }
#Import ".\IPSEC_SA_AUTH_AND_CIPHER_INFORMATION0.ahk" { IPSEC_SA_AUTH_AND_CIPHER_INFORMATION0 }
#Import ".\IPSEC_SA_AUTH_INFORMATION0.ahk" { IPSEC_SA_AUTH_INFORMATION0 }

/**
 * Is used to store information about an IPsec security association (SA).
 * @remarks
 * <b>IPSEC_SA0</b> is a specific implementation of IPSEC_SA. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_sa0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_SA0 {
    #StructPack 8

    /**
     * Security parameter index (SPI) of the IPsec SA. <b>IPSEC_SA_SPI</b> is defined in ipsectypes.h as UINT32.
     */
    spi : UInt32

    /**
     * Transform type of the SA specifying the IPsec security protocol.
     * 
     * See [IPSEC_TRANSFORM_TYPE](/windows/desktop/api/ipsectypes/ne-ipsectypes-ipsec_transform_type) for more information.
     */
    saTransformType : IPSEC_TRANSFORM_TYPE

    ahInformation : IPSEC_SA_AUTH_INFORMATION0.Ptr

    static __New() {
        DefineProp(this.Prototype, 'espAuthInformation', { type: IPSEC_SA_AUTH_INFORMATION0.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'espCipherInformation', { type: IPSEC_SA_CIPHER_INFORMATION0.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'espAuthAndCipherInformation', { type: IPSEC_SA_AUTH_AND_CIPHER_INFORMATION0.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'espAuthFwInformation', { type: IPSEC_SA_AUTH_INFORMATION0.Ptr, offset: 8 })
        this.DeleteProp("__New")
    }
}
