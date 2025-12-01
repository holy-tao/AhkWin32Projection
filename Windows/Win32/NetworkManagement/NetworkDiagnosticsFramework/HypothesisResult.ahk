#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HYPOTHESIS.ahk

/**
 * Contains information about a hypothesis returned from a helper class.
 * @see https://learn.microsoft.com/windows/win32/api/ndhelper/ns-ndhelper-hypothesisresult
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 * @version v4.0.30319
 */
class HypothesisResult extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ndhelper/ns-ndhelper-hypothesis">HYPOTHESIS</a></b>
     * 
     * Information for a specific hypothesis.
     * @type {HYPOTHESIS}
     */
    hypothesis{
        get {
            if(!this.HasProp("__hypothesis"))
                this.__hypothesis := HYPOTHESIS(0, this)
            return this.__hypothesis
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ndhelper/ne-ndhelper-diagnosis_status">DIAGNOSIS_STATUS</a></b>
     * 
     * The status of the child helper class and its children. 
     * 
     * If the hypothesis or any of its children indicated <b>DS_CONFIRMED</b> in a call to <a href="https://docs.microsoft.com/windows/desktop/api/ndhelper/nf-ndhelper-inetdiaghelper-lowhealth">LowHealth</a>, then this value will be <b>DS_CONFIRMED</b>. If no problems exist in such a call, the value will be <b>DS_REJECTED</b>. The value will be <b>DS_INDETERMINATE</b> if the health of the component is not clear.
     * @type {Integer}
     */
    pathStatus {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}
