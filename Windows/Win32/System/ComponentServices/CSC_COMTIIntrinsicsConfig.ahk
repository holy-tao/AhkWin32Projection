#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates whether the current COM Transaction Integrator (COMTI) intrinsics are propagated into the new context.
 * @remarks
 * This enumeration is used to configure the COMTI intrinsics settings through <a href="https://docs.microsoft.com/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> for either the work submitted through the activity created by <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-cocreateactivity">CoCreateActivity</a> or the work that is enclosed between calls to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-coenterservicedomain">CoEnterServiceDomain</a> and <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-coleaveservicedomain">CoLeaveServiceDomain</a>.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/ne-comsvcs-csc_comtiintrinsicsconfig
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct CSC_COMTIIntrinsicsConfig {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The current COMTI intrinsics do not propagate to the new context. This is the default setting for <a href="https://docs.microsoft.com/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> when <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_inheritanceconfig">CSC_InheritanceConfig</a> is set to CSC_Ignore.
     * @type {Integer (Int32)}
     */
    static CSC_NoCOMTIIntrinsics => 0

    /**
     * The current COMTI intrinsics propagate to the new context. This is the default setting for <a href="https://docs.microsoft.com/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> when <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_inheritanceconfig">CSC_InheritanceConfig</a> is set to CSC_Inherit.
     * @type {Integer (Int32)}
     */
    static CSC_InheritCOMTIIntrinsics => 1
}
