#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\UpdateAssessment.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * The OSUpdateAssessment structure defines how up-to-date the OS on a targeted device is.
 * @see https://docs.microsoft.com/windows/win32/api//waasapitypes/ns-waasapitypes-osupdateassessment
 * @namespace Windows.Win32.System.UpdateAssessment
 * @version v4.0.30319
 */
class OSUpdateAssessment extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * <b>true</b> if the OS on the device is no longer supported by Microsoft and will no longer receive servicing updates; otherwise, <b>false</b>.
     * @type {Integer}
     */
    isEndOfSupport {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/waasapitypes/ns-waasapitypes-updateassessment">UpdateAssessment</a> structure containing an assessment against the latest update Microsoft has released.
     * @type {UpdateAssessment}
     */
    assessmentForCurrent{
        get {
            if(!this.HasProp("__assessmentForCurrent"))
                this.__assessmentForCurrent := UpdateAssessment(this.ptr + 8)
            return this.__assessmentForCurrent
        }
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/waasapitypes/ns-waasapitypes-updateassessment">UpdateAssessment</a> structure containing an assessment against the latest applicable quality update for the device.
     * @type {UpdateAssessment}
     */
    assessmentForUpToDate{
        get {
            if(!this.HasProp("__assessmentForUpToDate"))
                this.__assessmentForUpToDate := UpdateAssessment(this.ptr + 24)
            return this.__assessmentForUpToDate
        }
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/SysInfo/updateassessmentstatus">UpdateAssessmentStatus</a> enumeration that details whether the device is on the latest applicable security update.
     * @type {Integer}
     */
    securityStatus {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * Timestamp when the assessment was done.
     * @type {FILETIME}
     */
    assessmentTime{
        get {
            if(!this.HasProp("__assessmentTime"))
                this.__assessmentTime := FILETIME(this.ptr + 40)
            return this.__assessmentTime
        }
    }

    /**
     * Timestamp when the release information was updated.
     * @type {FILETIME}
     */
    releaseInfoTime{
        get {
            if(!this.HasProp("__releaseInfoTime"))
                this.__releaseInfoTime := FILETIME(this.ptr + 48)
            return this.__releaseInfoTime
        }
    }

    /**
     * The latest OS build that Microsoft has released. This value is used to determine whether a device is current.
     * @type {Pointer<Char>}
     */
    currentOSBuild {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * The published timestamp of the release date for current OS build.
     * @type {FILETIME}
     */
    currentOSReleaseTime{
        get {
            if(!this.HasProp("__currentOSReleaseTime"))
                this.__currentOSReleaseTime := FILETIME(this.ptr + 64)
            return this.__currentOSReleaseTime
        }
    }

    /**
     * The latest applicable OS build in the device's servicing train. This value is used to determine whether a device is up-to-date.
     * @type {Pointer<Char>}
     */
    upToDateOSBuild {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * The published timestamp of the release date for the up-to-date OS build.
     * @type {FILETIME}
     */
    upToDateOSReleaseTime{
        get {
            if(!this.HasProp("__upToDateOSReleaseTime"))
                this.__upToDateOSReleaseTime := FILETIME(this.ptr + 80)
            return this.__upToDateOSReleaseTime
        }
    }
}
