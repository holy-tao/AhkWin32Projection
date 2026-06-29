#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWPM_SUBSCRIPTION_FLAGS.ahk" { FWPM_SUBSCRIPTION_FLAGS }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FWPM_SUBLAYER_ENUM_TEMPLATE0.ahk" { FWPM_SUBLAYER_ENUM_TEMPLATE0 }

/**
 * Used to subscribe for change notifications. (FWPM_SUBLAYER_SUBSCRIPTION0)
 * @remarks
 * Notifications are only dispatched for sublayers that match the template. 
 * 
 * If
 *    the template is <b>NULL</b>, it matches all sublayers.
 * 
 * <b>FWPM_SUBLAYER_SUBSCRIPTION0</b> is a specific implementation of FWPM_SUBLAYER_SUBSCRIPTION. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_sublayer_subscription0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_SUBLAYER_SUBSCRIPTION0 {
    #StructPack 8

    /**
     * Enumeration template for limiting the subscription.
     * 
     * See [FWPM_SUBLAYER_ENUM_TEMPLATE0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_sublayer_enum_template0) for more information.
     */
    enumTemplate : FWPM_SUBLAYER_ENUM_TEMPLATE0.Ptr

    flags : FWPM_SUBSCRIPTION_FLAGS

    /**
     * Uniquely identifies this session.
     */
    sessionKey : Guid

}
