#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_AUTH_TRANSFORM0.ahk" { IPSEC_AUTH_TRANSFORM0 }
#Import ".\IPSEC_AUTH_AND_CIPHER_TRANSFORM0.ahk" { IPSEC_AUTH_AND_CIPHER_TRANSFORM0 }
#Import ".\IPSEC_TRANSFORM_TYPE.ahk" { IPSEC_TRANSFORM_TYPE }
#Import ".\IPSEC_CIPHER_TRANSFORM0.ahk" { IPSEC_CIPHER_TRANSFORM0 }

/**
 * Is used to store an IPsec security association (SA) transform in an IPsec quick mode policy.
 * @remarks
 * <b>IPSEC_SA_TRANSFORM0</b> is a specific implementation of IPSEC_SA_TRANSFORM. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_sa_transform0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_SA_TRANSFORM0 {
    #StructPack 8

    /**
     * Type of the SA transform.
     * 
     * See [IPSEC_TRANSFORM_TYPE](/windows/desktop/api/ipsectypes/ne-ipsectypes-ipsec_transform_type) for more information.
     */
    ipsecTransformType : IPSEC_TRANSFORM_TYPE

    ahTransform : IPSEC_AUTH_TRANSFORM0.Ptr

    static __New() {
        DefineProp(this.Prototype, 'espAuthTransform', { type: IPSEC_AUTH_TRANSFORM0.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'espCipherTransform', { type: IPSEC_CIPHER_TRANSFORM0.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'espAuthAndCipherTransform', { type: IPSEC_AUTH_AND_CIPHER_TRANSFORM0.Ptr, offset: 8 })
        DefineProp(this.Prototype, 'espAuthFwTransform', { type: IPSEC_AUTH_TRANSFORM0.Ptr, offset: 8 })
        this.DeleteProp("__New")
    }
}
