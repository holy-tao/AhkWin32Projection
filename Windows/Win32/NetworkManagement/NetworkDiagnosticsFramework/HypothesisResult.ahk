#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HELPER_ATTRIBUTE.ahk" { HELPER_ATTRIBUTE }
#Import ".\HYPOTHESIS.ahk" { HYPOTHESIS }
#Import ".\DIAGNOSIS_STATUS.ahk" { DIAGNOSIS_STATUS }

/**
 * Contains information about a hypothesis returned from a helper class.
 * @see https://learn.microsoft.com/windows/win32/api/ndhelper/ns-ndhelper-hypothesisresult
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 */
export default struct HypothesisResult {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ndhelper/ns-ndhelper-hypothesis">HYPOTHESIS</a></b>
     * 
     * Information for a specific hypothesis.
     */
    hypothesis : HYPOTHESIS

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ndhelper/ne-ndhelper-diagnosis_status">DIAGNOSIS_STATUS</a></b>
     * 
     * The status of the child helper class and its children. 
     * 
     * If the hypothesis or any of its children indicated <b>DS_CONFIRMED</b> in a call to <a href="https://docs.microsoft.com/windows/desktop/api/ndhelper/nf-ndhelper-inetdiaghelper-lowhealth">LowHealth</a>, then this value will be <b>DS_CONFIRMED</b>. If no problems exist in such a call, the value will be <b>DS_REJECTED</b>. The value will be <b>DS_INDETERMINATE</b> if the health of the component is not clear.
     */
    pathStatus : DIAGNOSIS_STATUS

}
